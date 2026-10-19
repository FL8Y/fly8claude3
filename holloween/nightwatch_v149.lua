-- NIGHTWATCH V149
-- Start the 30-second cooldown when the route first arrives at door 1.
-- After visiting all doors, wait only for the remaining cooldown, then return to door 1.
-- Arrival pause: 0.9 seconds per door. Includes an X close button.

local Players = game:GetService("Players")
local CollectionService = game:GetService("CollectionService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

local SPEED = 65
local STOP_DISTANCE = 5
local PAUSE_AT_DOOR = 0.9
local CYCLE_COOLDOWN = 30
local DEFAULT_COOLDOWN = 10

local running = false
local destroyed = false
local eventConnections = {}
local lastKnockedAt = {}
local knockedCounts = {}
local lastLandedAt = {}
local activeTween = nil
local workerToken = 0
local currentDoorIndex = 0
local cycleCooldownDeadline = nil
local route = nil
local originalFirstDoor = nil

local function getCharacter()
    local character = player.Character or player.CharacterAdded:Wait()
    local root = character:WaitForChild("HumanoidRootPart")
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    return character, root, humanoid
end

local function getDoorPart(door)
    if not door then
        return nil
    end

    if door:IsA("BasePart") then
        return door
    end

    if door:IsA("Model") then
        return door.PrimaryPart or door:FindFirstChildWhichIsA("BasePart", true)
    end

    return nil
end

local function getDoorPosition(door)
    local part = getDoorPart(door)
    return part and part.Position or nil
end

local function getReadyAt(door)
    local part = getDoorPart(door)

    for _, object in ipairs({door, part}) do
        if object then
            for _, name in ipairs({"TrickOrTreatReadyAt", "ReadyAt", "CooldownUntil"}) do
                local value = object:GetAttribute(name)
                if typeof(value) == "number" then
                    return value, name
                end
            end
        end
    end

    return nil, nil
end

local function predictCooldown(door)
    local readyAt = getReadyAt(door)

    if readyAt then
        return math.max(0, readyAt - workspace:GetServerTimeNow())
    end

    local lastKnock = lastKnockedAt[door.Name]
    if lastKnock then
        return math.max(0, DEFAULT_COOLDOWN - (os.clock() - lastKnock))
    end

    return nil
end

local function attachEventListeners()
    local ok, result = pcall(function()
        local re = ReplicatedStorage
            :WaitForChild("Network")
            :WaitForChild("TrickOrTreatService")
            :WaitForChild("RE")

        local knocked = re:WaitForChild("Knocked")
        local landed = re:WaitForChild("Landed")

        table.insert(eventConnections, knocked.OnClientEvent:Connect(function(...)
            local args = {...}
            local name = tostring(args[1] or "unknown")
            lastKnockedAt[name] = os.clock()
            knockedCounts[name] = (knockedCounts[name] or 0) + 1
        end))

        table.insert(eventConnections, landed.OnClientEvent:Connect(function(...)
            local args = {...}
            local name = tostring(args[1] or "unknown")
            lastLandedAt[name] = os.clock()
        end))
    end)

    return ok, result
end

local function collectDoors()
    local doors = {}
    local seen = {}

    for _, door in ipairs(CollectionService:GetTagged("TrickOrTreatDoor")) do
        if door and door.Parent and not seen[door] then
            local position = getDoorPosition(door)

            if position then
                seen[door] = true
                table.insert(doors, {
                    instance = door,
                    position = position
                })
            end
        end
    end

    return doors
end

local function makeRoute(doors, startPosition)
    local result = {}
    local remaining = {}

    for _, item in ipairs(doors) do
        table.insert(remaining, item)
    end

    local currentPosition = startPosition

    while #remaining > 0 do
        local bestIndex = 1
        local bestDistance = math.huge

        for index, item in ipairs(remaining) do
            local distance = (item.position - currentPosition).Magnitude
            if distance < bestDistance then
                bestDistance = distance
                bestIndex = index
            end
        end

        local nextItem = table.remove(remaining, bestIndex)
        table.insert(result, nextItem)
        currentPosition = nextItem.position
    end

    return result
end

local function tweenToDoor(item, token)
    if not running or token ~= workerToken or not item then
        return false
    end

    local door = item.instance
    local doorName = door and door.Name or "unknown"
    local knockedCountBeforeApproach = knockedCounts[doorName] or 0
    local _, root, humanoid = getCharacter()

    if not running or token ~= workerToken then
        return false
    end

    if humanoid and humanoid.Health <= 0 then
        return false
    end

    if not door or not door.Parent then
        return false
    end

    local position = getDoorPosition(door)
    if not position then
        return false
    end

    local direction = Vector3.new(
        root.Position.X - position.X,
        0,
        root.Position.Z - position.Z
    )

    if direction.Magnitude < 0.01 then
        direction = Vector3.new(0, 0, 1)
    else
        direction = direction.Unit
    end

    local destination = position + direction * STOP_DISTANCE
    destination = Vector3.new(destination.X, root.Position.Y, destination.Z)

    local target = CFrame.lookAt(
        destination,
        Vector3.new(position.X, destination.Y, position.Z)
    )

    local distance = (root.Position - destination).Magnitude
    local duration = math.max(distance / SPEED, 0.15)

    predictCooldown(door)

    local tween = TweenService:Create(
        root,
        TweenInfo.new(duration, Enum.EasingStyle.Linear),
        {CFrame = target}
    )

    activeTween = tween
    tween:Play()

    local state = tween.Completed:Wait()

    if activeTween == tween then
        activeTween = nil
    end

    if not running or token ~= workerToken then
        return false
    end

    if state ~= Enum.PlaybackState.Completed then
        return false
    end

    -- Advance only after this door emits a new Knocked notification.
    -- Capture the count before tweening so a notification during arrival is not missed.
    updateUI("WAITING  ·  Knocked: " .. doorName)
    while running and token == workerToken do
        if (knockedCounts[doorName] or 0) > knockedCountBeforeApproach then
            return true
        end
        task.wait(0.05)
    end
    return false
end

-- UI
local gui = Instance.new("ScreenGui")
gui.Name = "NightwatchV149"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

pcall(function()
    gui.Parent = game:GetService("CoreGui")
end)

if not gui.Parent then
    gui.Parent = player:WaitForChild("PlayerGui")
end

local frame = Instance.new("Frame")
frame.Name = "Main"
frame.Size = UDim2.fromOffset(270, 174)
frame.Position = UDim2.new(0.5, -135, 0.32, 0)
frame.BackgroundColor3 = Color3.fromRGB(18, 21, 29)
frame.BorderSizePixel = 0
frame.Parent = gui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 14)
frameCorner.Parent = frame

local frameStroke = Instance.new("UIStroke")
frameStroke.Color = Color3.fromRGB(57, 73, 96)
frameStroke.Thickness = 1
frameStroke.Transparency = 0.15
frameStroke.Parent = frame

local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 42)
topBar.BackgroundColor3 = Color3.fromRGB(25, 31, 43)
topBar.BorderSizePixel = 0
topBar.Parent = frame

local topCorner = Instance.new("UICorner")
topCorner.CornerRadius = UDim.new(0, 14)
topCorner.Parent = topBar

local topFill = Instance.new("Frame")
topFill.Size = UDim2.new(1, 0, 0, 14)
topFill.Position = UDim2.new(0, 0, 1, -14)
topFill.BackgroundColor3 = topBar.BackgroundColor3
topFill.BorderSizePixel = 0
topFill.Parent = topBar

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -52, 1, 0)
title.Position = UDim2.fromOffset(12, 0)
title.BackgroundTransparency = 1
title.Text = "NIGHTWATCH  /  V149"
title.TextColor3 = Color3.fromRGB(237, 243, 252)
title.TextSize = 14
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = topBar

local closeButton = Instance.new("TextButton")
closeButton.Name = "Close"
closeButton.Size = UDim2.fromOffset(30, 30)
closeButton.Position = UDim2.new(1, -36, 0, 6)
closeButton.BackgroundColor3 = Color3.fromRGB(166, 58, 69)
closeButton.BorderSizePixel = 0
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 14
closeButton.Font = Enum.Font.GothamBold
closeButton.AutoButtonColor = true
closeButton.ZIndex = 2
closeButton.Parent = topBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeButton

local statusDot = Instance.new("Frame")
statusDot.Size = UDim2.fromOffset(8, 8)
statusDot.Position = UDim2.fromOffset(14, 56)
statusDot.BackgroundColor3 = Color3.fromRGB(230, 103, 109)
statusDot.BorderSizePixel = 0
statusDot.Parent = frame

local dotCorner = Instance.new("UICorner")
dotCorner.CornerRadius = UDim.new(1, 0)
dotCorner.Parent = statusDot

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -42, 0, 20)
status.Position = UDim2.fromOffset(28, 50)
status.BackgroundTransparency = 1
status.Text = "OFF  ·  Ready"
status.TextColor3 = Color3.fromRGB(188, 198, 214)
status.TextSize = 12
status.Font = Enum.Font.GothamMedium
status.TextXAlignment = Enum.TextXAlignment.Left
status.Parent = frame

local progress = Instance.new("TextLabel")
progress.Size = UDim2.new(1, -24, 0, 18)
progress.Position = UDim2.fromOffset(12, 74)
progress.BackgroundTransparency = 1
progress.Text = "Route: not started"
progress.TextColor3 = Color3.fromRGB(135, 149, 170)
progress.TextSize = 10
progress.Font = Enum.Font.Gotham
progress.TextXAlignment = Enum.TextXAlignment.Left
progress.Parent = frame

local toggle = Instance.new("TextButton")
toggle.Size = UDim2.new(1, -24, 0, 36)
toggle.Position = UDim2.fromOffset(12, 98)
toggle.BackgroundColor3 = Color3.fromRGB(35, 145, 95)
toggle.Text = "START ROUTE"
toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
toggle.TextSize = 12
toggle.Font = Enum.Font.GothamBold
toggle.AutoButtonColor = true
toggle.Parent = frame

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 9)
toggleCorner.Parent = toggle

local footer = Instance.new("TextLabel")
footer.Size = UDim2.new(1, -24, 0, 18)
footer.Position = UDim2.fromOffset(12, 145)
footer.BackgroundTransparency = 1
footer.Text = "30s cooldown   •   wait for Knocked"
footer.TextColor3 = Color3.fromRGB(117, 131, 151)
footer.TextSize = 10
footer.Font = Enum.Font.Gotham
footer.TextXAlignment = Enum.TextXAlignment.Left
footer.Parent = frame

-- Drag the panel by the top bar.
local dragging = false
local dragStart = nil
local startPosition = nil

topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPosition = frame.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch
    ) then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + delta.X,
            startPosition.Y.Scale,
            startPosition.Y.Offset + delta.Y
        )
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

closeButton.Activated:Connect(function()
    if gui and gui.Parent then
        gui:Destroy()
    end
end)

local function updateUI(message)
    if running then
        statusDot.BackgroundColor3 = Color3.fromRGB(85, 220, 148)
        status.Text = message or "RUNNING  ·  Route active"
        status.TextColor3 = Color3.fromRGB(154, 230, 184)
        toggle.Text = "STOP ROUTE"
        toggle.BackgroundColor3 = Color3.fromRGB(174, 63, 73)
    else
        statusDot.BackgroundColor3 = Color3.fromRGB(230, 103, 109)
        status.Text = message or "OFF  ·  Ready"
        status.TextColor3 = Color3.fromRGB(188, 198, 214)
        toggle.Text = "START ROUTE"
        toggle.BackgroundColor3 = Color3.fromRGB(35, 145, 95)
    end
end

local function waitCooldown(token)
    local deadline = os.clock() + CYCLE_COOLDOWN

    while running and token == workerToken do
        local remaining = deadline - os.clock()
        if remaining <= 0 then
            return true
        end

        updateUI(string.format("COOLDOWN  ·  %ds left", math.ceil(remaining)))
        task.wait(math.min(0.25, remaining))
    end

    return false
end

local function runCycle(token)
    local ok = pcall(function()
        local _, root = getCharacter()
        if not running or token ~= workerToken then
            return
        end

        -- Capture the route once. Keep the original first door between cycles.
        if not route or #route == 0 then
            route = makeRoute(collectDoors(), root.Position)
            originalFirstDoor = route[1]
        end

        if not route or #route == 0 then
            updateUI("NO DOORS  ·  Check tags")
            task.wait(2)
            return
        end

        while running and token == workerToken do
            -- The cooldown timer starts immediately upon arrival at the first door.
            cycleCooldownDeadline = nil
            for index = 1, #route do
                if not running or token ~= workerToken then
                    return
                end

                local item = route[index]
                currentDoorIndex = index
                local doorName = item.instance and item.instance.Name or "door"
                progress.Text = string.format("Door %d/%d  ·  %s", index, #route, doorName)

                if item.instance and item.instance.Parent then
                    if not tweenToDoor(item, token) then
                        return
                    end
                    if index == 1 then
                        cycleCooldownDeadline = os.clock() + CYCLE_COOLDOWN
                        updateUI("RUNNING  ·  30s cooldown started")
                    end
                end
            end

            if not running or token ~= workerToken then
                return
            end

            -- Count route time toward the cooldown that began at the first door.
            if cycleCooldownDeadline then
                while running and token == workerToken do
                    local remaining = cycleCooldownDeadline - os.clock()
                    if remaining <= 0 then
                        break
                    end
                    updateUI(string.format("COOLDOWN  ·  %ds left", math.ceil(remaining)))
                    task.wait(math.min(0.25, remaining))
                end
            end

            if not running or token ~= workerToken then
                return
            end

            -- Once the cooldown has expired, return to the exact original first door.
            if originalFirstDoor and originalFirstDoor.instance
                and originalFirstDoor.instance.Parent then
                progress.Text = "Returning to first door"
                if not tweenToDoor(originalFirstDoor, token) then
                    return
                end
            end

            if not running or token ~= workerToken then
                return
            end

            progress.Text = "At first door  ·  ready to repeat"
            currentDoorIndex = 0
        end
    end)

    if not ok then
        if activeTween then
            pcall(function()
                activeTween:Cancel()
            end)
            activeTween = nil
        end

        if running and token == workerToken then
            updateUI("ERROR  ·  Restart route")
            task.wait(1)
        end
    end
end

toggle.Activated:Connect(function()
    if destroyed then
        return
    end

    if running then
        running = false
        workerToken += 1

        if activeTween then
            pcall(function()
                activeTween:Cancel()
            end)
            activeTween = nil
        end

        updateUI("OFF  ·  Stopped")
        return
    end

    running = true
    workerToken += 1
    local token = workerToken

    route = nil
    originalFirstDoor = nil
    currentDoorIndex = 0
    progress.Text = "Building route..."
    updateUI("STARTING  ·  Building route")

    task.spawn(function()
        runCycle(token)
    end)
end)

attachEventListeners()
updateUI()

gui.Destroying:Connect(function()
    destroyed = true
    running = false
    workerToken += 1

    if activeTween then
        pcall(function()
            activeTween:Cancel()
        end)
        activeTween = nil
    end

    for _, connection in ipairs(eventConnections) do
        pcall(function()
            connection:Disconnect()
        end)
    end
end)
