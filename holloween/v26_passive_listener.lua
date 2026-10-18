-- Halloween Door Tool V26 — PASSIVE DIAGNOSTICS ONLY
-- No movement, teleporting, simulated key presses, FireServer, or interaction attempts.
-- Enable LISTEN, interact with the door manually in-game, then COPY LOG.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local GUI_NAME = "HalloweenDoorToolV26"
local MAX_LINES = 180

local function getGuiParent()
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

local parent = getGuiParent()
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

local function makeLabel(name, text, size, position, textSize)
    local item = Instance.new("TextLabel")
    item.Name = name
    item.Size = size
    item.Position = position
    item.BackgroundTransparency = 1
    item.Text = text
    item.TextColor3 = Color3.fromRGB(225, 225, 230)
    item.Font = Enum.Font.Gotham
    item.TextSize = textSize or 12
    item.TextXAlignment = Enum.TextXAlignment.Left
    item.Parent = frame
    return item
end

local title = makeLabel(
    "Title", "Halloween Door Tool V26 — PASSIVE",
    UDim2.new(1, -110, 0, 32), UDim2.new(0, 12, 0, 4), 15
)
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 210, 120)
title.Active = true

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

local status = makeLabel(
    "Status", "SAFE MODE — manual interaction only",
    UDim2.new(1, -24, 0, 22), UDim2.new(0, 12, 0, 38), 12
)

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

local function makeButton(name, text, width, x, color)
    local item = Instance.new("TextButton")
    item.Name = name
    item.Size = UDim2.new(0, width, 0, 30)
    item.Position = UDim2.new(0, x, 1, -40)
    item.Text = text
    item.Font = Enum.Font.GothamBold
    item.TextSize = 11
    item.TextColor3 = Color3.new(1, 1, 1)
    item.BackgroundColor3 = color
    item.Parent = frame
    Instance.new("UICorner", item).CornerRadius = UDim.new(0, 6)
    return item
end

local listenButton = makeButton("Listen", "LISTEN: OFF", 110, 12, Color3.fromRGB(55, 95, 155))
local copyButton = makeButton("Copy", "COPY LOG", 100, 130, Color3.fromRGB(55, 95, 155))
local clearButton = makeButton("Clear", "CLEAR LOG", 100, 238, Color3.fromRGB(90, 85, 105))

local lines = {}
local eventConnections = {}
local uiConnections = {}
local listening = false
local minimized = false
local destroyed = false

local function log(message)
    table.insert(lines, os.date("%H:%M:%S") .. " | " .. tostring(message))
    while #lines > MAX_LINES do
        table.remove(lines, 1)
    end
    logBox.Text = table.concat(lines, "\n") .. "\n"
    logBox.CursorPosition = -1
    print("[V26 PASSIVE] " .. tostring(message))
end

local function findDoor()
    local ok, door = pcall(function()
        return workspace.Halloween.HouseForTrickOrTreating1.DoorOpener["1S_Door"]
    end)
    if ok and door then return door end
    return nil
end

local function getDistance()
    local door = findDoor()
    local character = player.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")
    if not door or not root then return nil end
    local ok, position = pcall(function()
        return door.Position
    end)
    if not ok or not position then return nil end
    return (root.Position - position).Magnitude
end

local function describe(value)
    if typeof(value) == "Instance" then
        local ok, fullName = pcall(function()
            return value:GetFullName()
        end)
        if ok then return fullName .. " <" .. value.ClassName .. ">" end
        return value.Name
    end
    return tostring(value)
end

local function stopListening()
    listening = false
    for _, connection in ipairs(eventConnections) do
        pcall(function() connection:Disconnect() end)
    end
    table.clear(eventConnections)
    listenButton.Text = "LISTEN: OFF"
    listenButton.BackgroundColor3 = Color3.fromRGB(55, 95, 155)
end

local function startListening()
    stopListening()

    local ok, folder = pcall(function()
        return ReplicatedStorage:WaitForChild("Network", 8)
            :WaitForChild("TrickOrTreatService", 8)
            :WaitForChild("RE", 8)
    end)

    if not ok or not folder then
        status.Text = "ERROR — event folder not found"
        log("ERROR: Could not resolve Network.TrickOrTreatService.RE")
        return
    end

    for _, eventName in ipairs({"Knocked", "Landed"}) do
        local remote = folder:FindFirstChild(eventName)

        if not remote or not remote:IsA("RemoteEvent") then
            stopListening()
            status.Text = "ERROR — event missing"
            log("ERROR: " .. eventName .. " RemoteEvent not found")
            return
        end

        table.insert(eventConnections, remote.OnClientEvent:Connect(function(...)
            if not listening or destroyed then return end

            local args = table.pack(...)
            local formatted = {}

            for index = 1, args.n do
                formatted[#formatted + 1] =
                    "[" .. index .. "]=" .. describe(args[index])
            end

            local distance = getDistance()
            log(string.format(
                "EVENT %s | distance=%s | %s",
                eventName,
                distance and string.format("%.2f", distance) or "unknown",
                #formatted > 0 and table.concat(formatted, " | ") or "(no arguments)"
            ))
        end))
    end

    listening = true
    listenButton.Text = "LISTEN: ON"
    listenButton.BackgroundColor3 = Color3.fromRGB(45, 135, 75)
    status.Text = "LISTENING — interact manually in-game"
    log("Listening to Knocked and Landed; no actions will be automated")
end

listenButton.Activated:Connect(function()
    if listening then
        stopListening()
        status.Text = "Listening stopped"
        log("Listening stopped")
    else
        startListening()
    end
end)

copyButton.Activated:Connect(function()
    local content = table.concat(lines, "\n")
    if type(setclipboard) == "function" then
        local ok = pcall(setclipboard, content)
        if ok then
            status.Text = "Log copied"
            log("Log copied to clipboard")
        else
            status.Text = "Clipboard copy failed"
            log("Clipboard copy failed")
        end
    else
        status.Text = "Clipboard unavailable — select log text"
        log("Clipboard API unavailable; log remains visible for manual copying")
    end
end)

clearButton.Activated:Connect(function()
    table.clear(lines)
    logBox.Text = ""
    log("Log cleared")
end)

minimize.Activated:Connect(function()
    minimized = not minimized
    for _, item in ipairs({status, logBox, listenButton, copyButton, clearButton}) do
        item.Visible = not minimized
    end
    frame.Size = minimized
        and UDim2.new(0, 430, 0, 40)
        or UDim2.new(0, 430, 0, 320)
    minimize.Text = minimized and "+" or "−"
end)

close.Activated:Connect(function()
    destroyed = true
    stopListening()
    for _, connection in ipairs(uiConnections) do
        pcall(function() connection:Disconnect() end)
    end
    gui:Destroy()
end)

local dragging, dragStart, startPosition = false, nil, nil

table.insert(uiConnections, title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPosition = frame.Position
        local ended
        ended = input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
                if ended then ended:Disconnect() end
            end
        end)
    end
end))

table.insert(uiConnections, UserInputService.InputChanged:Connect(function(input)
    if not dragging then return end
    if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(
            startPosition.X.Scale, startPosition.X.Offset + delta.X,
            startPosition.Y.Scale, startPosition.Y.Offset + delta.Y
        )
    end
end))

log("V26 loaded successfully")
log("PASSIVE ONLY: no movement, key simulation, or remote requests")
log("Press LISTEN, interact with the door normally, then COPY LOG")
