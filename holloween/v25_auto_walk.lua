-- Halloween Door Tool V25
-- Auto-walk to the target, then attempt normal E interaction.
-- LISTEN records Knocked/Landed notifications and their arguments.
-- No fabricated RemoteEvent requests or reward claims.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PathfindingService = game:GetService("PathfindingService")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local GUI_NAME = "HalloweenDoorToolV25"
local MAX_LINES = 160

local function guiParent()
    if typeof(gethui) == "function" then
        local ok, result = pcall(gethui)
        if ok and result then return result end
    end
    local ok, result = pcall(function()
        return game:GetService("CoreGui")
    end)
    if ok and result then return result end
    return player:WaitForChild("PlayerGui")
end

local parent = guiParent()
pcall(function()
    local old = parent:FindFirstChild(GUI_NAME)
    if old then old:Destroy() end
end)

local gui = Instance.new("ScreenGui")
gui.Name = GUI_NAME
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.DisplayOrder = 999
gui.Parent = parent

local frame = Instance.new("Frame")
frame.Name = "Panel"
frame.Size = UDim2.new(0, 430, 0, 320)
frame.Position = UDim2.new(0.5, -215, 0.55, -160)
frame.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
frame.BorderSizePixel = 0
frame.Active = true
frame.Parent = gui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

local function label(name, text, size, position, fontSize)
    local x = Instance.new("TextLabel")
    x.Name = name
    x.Size = size
    x.Position = position
    x.BackgroundTransparency = 1
    x.Text = text
    x.TextColor3 = Color3.fromRGB(225, 225, 230)
    x.Font = Enum.Font.Gotham
    x.TextSize = fontSize or 12
    x.TextXAlignment = Enum.TextXAlignment.Left
    x.Parent = frame
    return x
end

local title = label("Title", "Halloween Door Tool V25",
    UDim2.new(1, -110, 0, 32), UDim2.new(0, 12, 0, 4), 16)
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 210, 120)
title.Active = true

local function button(name, text, width, x, color)
    local b = Instance.new("TextButton")
    b.Name = name
    b.Size = UDim2.new(0, width, 0, 30)
    b.Position = UDim2.new(0, x, 1, -40)
    b.Text = text
    b.Font = Enum.Font.GothamBold
    b.TextSize = 11
    b.TextColor3 = Color3.new(1, 1, 1)
    b.BackgroundColor3 = color
    b.Parent = frame
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    return b
end

local minimize = Instance.new("TextButton")
minimize.Name = "Minimize"
minimize.Size = UDim2.new(0, 30, 0, 28)
minimize.Position = UDim2.new(1, -70, 0, 5)
minimize.Text = "−"
minimize.Font = Enum.Font.GothamBold
minimize.TextSize = 16
minimize.TextColor3 = Color3.new(1, 1, 1)
minimize.BackgroundColor3 = Color3.fromRGB(80, 80, 95)
minimize.Parent = frame
Instance.new("UICorner", minimize).CornerRadius = UDim.new(0, 6)

local close = Instance.new("TextButton")
close.Name = "Close"
close.Size = UDim2.new(0, 30, 0, 28)
close.Position = UDim2.new(1, -36, 0, 5)
close.Text = "✕"
close.Font = Enum.Font.GothamBold
close.TextSize = 15
close.TextColor3 = Color3.new(1, 1, 1)
close.BackgroundColor3 = Color3.fromRGB(150, 55, 55)
close.Parent = frame
Instance.new("UICorner", close).CornerRadius = UDim.new(0, 6)

local status = label("Status", "READY — FIRE WALK moves toward the door",
    UDim2.new(1, -24, 0, 22), UDim2.new(0, 12, 0, 38), 12)

local logBox = Instance.new("TextBox")
logBox.Name = "Log"
logBox.Size = UDim2.new(1, -24, 1, -122)
logBox.Position = UDim2.new(0, 12, 0, 64)
logBox.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
logBox.TextColor3 = Color3.fromRGB(220, 235, 220)
logBox.Font = Enum.Font.Code
logBox.TextSize = 11
logBox.TextXAlignment = Enum.TextXAlignment.Left
logBox.TextYAlignment = Enum.TextYAlignment.Top
logBox.TextWrapped = false
logBox.MultiLine = true
logBox.ClearTextOnFocus = false
logBox.TextEditable = false
logBox.Text = ""
logBox.Parent = frame
Instance.new("UICorner", logBox).CornerRadius = UDim.new(0, 6)

local fire = button("Fire", "FIRE WALK", 95, 12, Color3.fromRGB(155, 75, 45))
local listen = button("Listen", "LISTEN: OFF", 110, 112, Color3.fromRGB(55, 95, 155))
local copy = button("Copy", "COPY LOG", 80, 227, Color3.fromRGB(55, 95, 155))
local stop = button("Stop", "STOP", 90, 314, Color3.fromRGB(150, 105, 45))

local lines, uiConnections, eventConnections = {}, {}, {}
local listening, running, minimized, destroyed = false, false, false, false
local walkToken = 0

local function log(message)
    table.insert(lines, os.date("%H:%M:%S") .. " | " .. tostring(message))
    while #lines > MAX_LINES do table.remove(lines, 1) end
    logBox.Text = table.concat(lines, "\n") .. "\n"
    logBox.CursorPosition = -1
    print("[V25] " .. tostring(message))
end

local function getDoor()
    local ok, door = pcall(function()
        return workspace.Halloween.HouseForTrickOrTreating1.DoorOpener["1S_Door"]
    end)
    if ok and door and door:IsA("BasePart") then return door end
    return nil
end

local function getRootAndHumanoid()
    local character = player.Character
    if not character then return nil, nil end
    return character:FindFirstChild("HumanoidRootPart"),
        character:FindFirstChildOfClass("Humanoid")
end

local function distanceToDoor()
    local root = select(1, getRootAndHumanoid())
    local door = getDoor()
    if not root or not door then return nil end
    return (root.Position - door.Position).Magnitude
end

local function stringify(value)
    if typeof(value) == "Instance" then
        local ok, name = pcall(function() return value:GetFullName() end)
        return ok and (name .. " <" .. value.ClassName .. ">") or value.Name
    end
    return tostring(value)
end

local function disconnectEventListeners()
    for _, c in ipairs(eventConnections) do pcall(function() c:Disconnect() end) end
    table.clear(eventConnections)
end

local function setListening(enabled)
    disconnectEventListeners()
    listening = enabled

    if not enabled then
        listen.Text = "LISTEN: OFF"
        listen.BackgroundColor3 = Color3.fromRGB(55, 95, 155)
        status.Text = "Listening stopped"
        log("Listening stopped")
        return
    end

    local ok, folder = pcall(function()
        return ReplicatedStorage:WaitForChild("Network", 8)
            :WaitForChild("TrickOrTreatService", 8)
            :WaitForChild("RE", 8)
    end)
    if not ok or not folder then
        listening = false
        status.Text = "ERROR — remotes not found"
        log("ERROR: Could not resolve TrickOrTreatService.RE")
        return
    end

    for _, eventName in ipairs({"Knocked", "Landed"}) do
        local remote = folder:FindFirstChild(eventName)
        if not remote or not remote:IsA("RemoteEvent") then
            listening = false
            disconnectEventListeners()
            status.Text = "ERROR — event missing"
            log("ERROR: " .. eventName .. " RemoteEvent missing")
            return
        end

        table.insert(eventConnections, remote.OnClientEvent:Connect(function(...)
            if not listening or destroyed then return end
            local args = table.pack(...)
            local out = {}
            for i = 1, args.n do
                out[#out + 1] = "[" .. i .. "]=" .. stringify(args[i])
            end
            local d = distanceToDoor()
            log(string.format("EVENT %s | distance=%s | %s",
                eventName,
                d and string.format("%.2f", d) or "unknown",
                #out > 0 and table.concat(out, " | ") or "(no arguments)"))
        end))
    end

    listen.Text = "LISTEN: ON"
    listen.BackgroundColor3 = Color3.fromRGB(45, 135, 75)
    status.Text = "LISTENING — door events will be logged"
    log("Listening to Knocked and Landed")
end

local function pressE()
    if type(keypress) == "function" and type(keyrelease) == "function" then
        local ok = pcall(function()
            keypress(0x45)
            task.wait(0.12)
            keyrelease(0x45)
        end)
        if ok then return true, "executor E input" end
        pcall(function() keyrelease(0x45) end)
    end

    local ok, err = pcall(function()
        local vim = game:GetService("VirtualInputManager")
        vim:SendKeyEvent(true, Enum.KeyCode.E, false, game)
        task.wait(0.12)
        vim:SendKeyEvent(false, Enum.KeyCode.E, false, game)
    end)
    if ok then return true, "VirtualInputManager E input" end
    return false, tostring(err)
end

local function approachDoor(token)
    local door = getDoor()
    local root, humanoid = getRootAndHumanoid()
    if not door then log("ERROR: target door not found"); return false end
    if not root or not humanoid then log("ERROR: character/root/humanoid unavailable"); return false end

    local offset = root.Position - door.Position
    local direction = offset.Magnitude > 0.1 and offset.Unit or Vector3.new(0, 0, 1)
    local destination = door.Position + direction * 3.5
    destination = Vector3.new(destination.X, door.Position.Y, destination.Z)

    log(string.format("Starting approach; current distance %.2f", (root.Position - door.Position).Magnitude))
    status.Text = "Walking toward door..."

    local path = PathfindingService:CreatePath({
        AgentRadius = 2,
        AgentHeight = 5,
        AgentCanJump = true,
        WaypointSpacing = 4
    })

    local pathOK = pcall(function()
        path:ComputeAsync(root.Position, destination)
    end)

    if pathOK and path.Status == Enum.PathStatus.Success then
        local waypoints = path:GetWaypoints()
        log("Path found: " .. #waypoints .. " waypoints")
        for _, waypoint in ipairs(waypoints) do
            if destroyed or token ~= walkToken then return false end
            root, humanoid = getRootAndHumanoid()
            if not root or not humanoid then log("Character unavailable during walk"); return false end
            if waypoint.Action == Enum.PathWaypointAction.Jump then humanoid.Jump = true end
            humanoid:MoveTo(waypoint.Position)
            local reached = humanoid.MoveToFinished:Wait()
            if not reached then
                log("Path waypoint not reached; stopping approach")
                return false
            end
            local d = distanceToDoor()
            if d and d <= 4.5 then break end
        end
    else
        log("Pathfinding unavailable; trying direct MoveTo")
        humanoid:MoveTo(destination)
        local reached = humanoid.MoveToFinished:Wait()
        if not reached then log("Direct MoveTo did not reach destination"); return false end
    end

    local d = distanceToDoor()
    log("Approach ended; distance=" .. (d and string.format("%.2f", d) or "unknown"))
    return d ~= nil and d <= 6
end

local function fireWalk()
    if running then log("FIRE ignored: already running"); return end
    running = true
    walkToken += 1
    local token = walkToken

    task.spawn(function()
        local ok, err = pcall(function()
            if not listening then setListening(true) end
            if not listening then log("Cannot proceed: LISTEN failed to start"); return end

            local arrived = approachDoor(token)
            if not arrived then
                log("Could not get within 6 studs. No E input sent.")
                return
            end

            task.wait(0.3)
            local sent, method = pressE()
            if sent then
                log("Attempted E input using " .. method)
                log("Waiting 4 seconds for event notifications...")
            else
                log("E input failed: " .. tostring(method))
                return
            end

            task.wait(4)
            log("FIRE check finished; event logs above show any notifications received")
            log("A notification alone does not confirm a reward")
        end)

        if not ok then log("FIRE ERROR: " .. tostring(err)) end
        running = false
    end)
end

fire.Activated:Connect(fireWalk)
listen.Activated:Connect(function() setListening(not listening) end)

copy.Activated:Connect(function()
    local content = table.concat(lines, "\n")
    if type(setclipboard) == "function" then
        local ok = pcall(setclipboard, content)
        log(ok and "Log copied" or "Clipboard copy failed")
    else
        status.Text = "Clipboard unavailable — select log text"
        log("Clipboard API unavailable")
    end
end)

stop.Activated:Connect(function()
    walkToken += 1
    local _, humanoid = getRootAndHumanoid()
    if humanoid then pcall(function() humanoid:MoveTo(select(1, getRootAndHumanoid()).Position) end) end
    running = false
    setListening(false)
    status.Text = "Stopped"
    log("STOP pressed")
end)

minimize.Activated:Connect(function()
    minimized = not minimized
    for _, obj in ipairs({status, logBox, fire, listen, copy, stop}) do
        obj.Visible = not minimized
    end
    frame.Size = minimized and UDim2.new(0, 430, 0, 40) or UDim2.new(0, 430, 0, 320)
    minimize.Text = minimized and "+" or "−"
end)

close.Activated:Connect(function()
    destroyed = true
    walkToken += 1
    setListening(false)
    for _, c in ipairs(uiConnections) do pcall(function() c:Disconnect() end) end
    gui:Destroy()
end)

local dragging, dragStart, startPos = false, nil, nil
table.insert(uiConnections, title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        local endConn
        endConn = input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
                if endConn then endConn:Disconnect() end
            end
        end)
    end
end))

table.insert(uiConnections, UIS.InputChanged:Connect(function(input)
    if not dragging then return end
    if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end))

log("V25 loaded successfully")
log("FIRE WALK auto-approaches the door, then attempts E")
log("LISTEN records event arguments; rewards are not assumed")
