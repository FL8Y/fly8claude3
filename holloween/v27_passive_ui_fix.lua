-- Halloween Door Tool V27 — PASSIVE UI FIX
-- Uses LocalPlayer.PlayerGui directly so the ScreenGui is parented to the player's UI.
-- Passive only: no movement, simulated input, FireServer, or interaction attempts.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
if not player then
    warn("[V27] LocalPlayer unavailable; run this as a client LocalScript.")
    return
end

local playerGui = player:WaitForChild("PlayerGui", 10)
if not playerGui then
    warn("[V27] PlayerGui did not load.")
    return
end

local GUI_NAME = "HalloweenDoorToolV27"
local old = playerGui:FindFirstChild(GUI_NAME)
if old then old:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = GUI_NAME
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = false
gui.DisplayOrder = 1000
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Name = "Panel"
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Size = UDim2.fromOffset(430, 320)
frame.Position = UDim2.new(0.5, 0, 0.55, 0)
frame.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
frame.BorderSizePixel = 0
frame.Active = true
frame.Visible = true
frame.Parent = gui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

local function label(name, text, size, pos, textSize)
    local obj = Instance.new("TextLabel")
    obj.Name = name
    obj.Size = size
    obj.Position = pos
    obj.BackgroundTransparency = 1
    obj.Text = text
    obj.TextColor3 = Color3.fromRGB(225, 225, 230)
    obj.Font = Enum.Font.Gotham
    obj.TextSize = textSize or 12
    obj.TextXAlignment = Enum.TextXAlignment.Left
    obj.Parent = frame
    return obj
end

local title = label("Title", "Halloween Door Tool V27 — PASSIVE", UDim2.new(1, -110, 0, 32), UDim2.fromOffset(12, 4), 15)
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 210, 120)
title.Active = true

local function makeButton(name, text, width, x, color)
    local obj = Instance.new("TextButton")
    obj.Name = name
    obj.Size = UDim2.fromOffset(width, 30)
    obj.Position = UDim2.new(0, x, 1, -40)
    obj.Text = text
    obj.Font = Enum.Font.GothamBold
    obj.TextSize = 11
    obj.TextColor3 = Color3.new(1, 1, 1)
    obj.BackgroundColor3 = color
    obj.Parent = frame
    Instance.new("UICorner", obj).CornerRadius = UDim.new(0, 6)
    return obj
end

local minimize = Instance.new("TextButton")
minimize.Name = "Minimize"
minimize.Size = UDim2.fromOffset(30, 28)
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
close.Size = UDim2.fromOffset(30, 28)
close.Position = UDim2.new(1, -36, 0, 5)
close.Text = "✕"
close.Font = Enum.Font.GothamBold
close.TextSize = 15
close.TextColor3 = Color3.new(1, 1, 1)
close.BackgroundColor3 = Color3.fromRGB(150, 55, 55)
close.Parent = frame
Instance.new("UICorner", close).CornerRadius = UDim.new(0, 6)

local status = label("Status", "SAFE MODE — manual interaction only", UDim2.new(1, -24, 0, 22), UDim2.fromOffset(12, 38), 12)

local logBox = Instance.new("TextBox")
logBox.Name = "Log"
logBox.Size = UDim2.new(1, -24, 1, -122)
logBox.Position = UDim2.fromOffset(12, 64)
logBox.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
logBox.TextColor3 = Color3.fromRGB(220, 235, 220)
logBox.Font = Enum.Font.Code
logBox.TextSize = 11
logBox.TextXAlignment = Enum.TextXAlignment.Left
logBox.TextYAlignment = Enum.TextYAlignment.Top
logBox.TextWrapped = false
logBox.MultiLine = true
logBox.ClearTextOnFocus = false
logBox.Text = ""
logBox.Parent = frame
Instance.new("UICorner", logBox).CornerRadius = UDim.new(0, 6)

local listenButton = makeButton("Listen", "LISTEN: OFF", 110, 12, Color3.fromRGB(55, 95, 155))
local copyButton = makeButton("Copy", "COPY LOG", 100, 130, Color3.fromRGB(55, 95, 155))
local clearButton = makeButton("Clear", "CLEAR LOG", 100, 238, Color3.fromRGB(90, 85, 105))

local lines, eventConnections, uiConnections = {}, {}, {}
local listening, minimized, destroyed = false, false, false

local function log(message)
    table.insert(lines, os.date("%H:%M:%S") .. " | " .. tostring(message))
    while #lines > 180 do table.remove(lines, 1) end
    logBox.Text = table.concat(lines, "\n") .. "\n"
    logBox.CursorPosition = -1
    print("[V27 PASSIVE] " .. tostring(message))
end

local function findDoor()
    local ok, door = pcall(function()
        return workspace.Halloween.HouseForTrickOrTreating1.DoorOpener["1S_Door"]
    end)
    return ok and door or nil
end

local function distanceToDoor()
    local door = findDoor()
    local character = player.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")
    if not door or not root then return nil end
    local ok, position = pcall(function() return door.Position end)
    if not ok then return nil end
    return (root.Position - position).Magnitude
end

local function describe(value)
    if typeof(value) == "Instance" then
        local ok, name = pcall(function() return value:GetFullName() end)
        return ok and (name .. " <" .. value.ClassName .. ">") or value.Name
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
        local network = ReplicatedStorage:WaitForChild("Network", 8)
        if not network then error("Network folder timeout") end
        local service = network:WaitForChild("TrickOrTreatService", 8)
        if not service then error("TrickOrTreatService timeout") end
        local remotes = service:WaitForChild("RE", 8)
        if not remotes then error("RE folder timeout") end
        return remotes
    end)

    if not ok or not folder then
        status.Text = "ERROR — event folder not found"
        log("ERROR resolving event folder: " .. tostring(folder))
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
            for i = 1, args.n do
                formatted[#formatted + 1] = "[" .. i .. "]=" .. describe(args[i])
            end
            local d = distanceToDoor()
            log(string.format("EVENT %s | distance=%s | %s",
                eventName,
                d and string.format("%.2f", d) or "unknown",
                #formatted > 0 and table.concat(formatted, " | ") or "(no arguments)"))
        end))
    end

    listening = true
    listenButton.Text = "LISTEN: ON"
    listenButton.BackgroundColor3 = Color3.fromRGB(45, 135, 75)
    status.Text = "LISTENING — interact manually"
    log("Listening to Knocked and Landed; passive mode only")
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
    local text = table.concat(lines, "\n")
    if type(setclipboard) == "function" then
        local ok = pcall(setclipboard, text)
        status.Text = ok and "Log copied" or "Clipboard copy failed"
        log(ok and "Log copied to clipboard" or "Clipboard copy failed")
    else
        status.Text = "Clipboard unavailable — select log text"
        log("Clipboard API unavailable")
    end
end)

clearButton.Activated:Connect(function()
    table.clear(lines)
    logBox.Text = ""
    log("Log cleared")
end)

minimize.Activated:Connect(function()
    minimized = not minimized
    for _, obj in ipairs({status, logBox, listenButton, copyButton, clearButton}) do
        obj.Visible = not minimized
    end
    frame.Size = minimized and UDim2.fromOffset(430, 40) or UDim2.fromOffset(430, 320)
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
            startPosition.Y.Scale, startPosition.Y.Offset + delta.Y)
    end
end))

gui.Enabled = true
frame.Visible = true
log("V27 loaded — GUI parented to PlayerGui")
log("PASSIVE ONLY: no movement, key simulation, or remote requests")
log("If this panel does not appear, check the executor console for [V27] errors")
