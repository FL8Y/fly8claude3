-- Halloween Door Event Listener v11
-- Client-side diagnostic only. Does NOT FireServer, spoof events, or trigger a knock.
-- Paste into Delta while in the game. Use START LISTEN, then interact normally.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer

local TARGET_PATH = "Workspace.Halloween.HouseForTrickOrTreating1.DoorOpener.1S_Door"
local function resolveRemotes()
    local ok, folder = pcall(function()
        return ReplicatedStorage:WaitForChild("Network", 10)
            :WaitForChild("TrickOrTreatService", 10)
            :WaitForChild("RE", 10)
    end)
    if not ok then return nil, nil, "Could not resolve ReplicatedStorage.Network.TrickOrTreatService.RE" end
    local knocked = folder:FindFirstChild("Knocked")
    local landed = folder:FindFirstChild("Landed")
    if not knocked or not knocked:IsA("RemoteEvent") then
        return nil, nil, "Knocked RemoteEvent not found"
    end
    if not landed or not landed:IsA("RemoteEvent") then
        return nil, nil, "Landed RemoteEvent not found"
    end
    return knocked, landed, nil
end

local function getGuiParent()
    if typeof(gethui) == "function" then
        local ok, gui = pcall(gethui)
        if ok and gui then return gui end
    end
    local ok, core = pcall(function() return game:GetService("CoreGui") end)
    if ok and core then return core end
    return LocalPlayer:WaitForChild("PlayerGui")
end

local old
pcall(function()
    old = getGuiParent():FindFirstChild("HalloweenDoorListenerV11")
    if old then old:Destroy() end
end)

local gui = Instance.new("ScreenGui")
gui.Name = "HalloweenDoorListenerV11"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = getGuiParent()

local frame = Instance.new("Frame")
frame.Name = "Panel"
frame.Size = UDim2.new(0, 430, 0, 300)
frame.Position = UDim2.new(0.5, -215, 0.55, -150)
frame.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
frame.BorderSizePixel = 0
frame.Active = true
frame.Parent = gui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -44, 0, 32)
title.Position = UDim2.new(0, 12, 0, 4)
title.BackgroundTransparency = 1
title.Text = "Halloween Door Listener v11"
title.TextColor3 = Color3.fromRGB(255, 210, 120)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = frame

local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 30, 0, 28)
close.Position = UDim2.new(1, -36, 0, 5)
close.Text = "✕"
close.TextSize = 16
close.Font = Enum.Font.GothamBold
close.TextColor3 = Color3.new(1, 1, 1)
close.BackgroundColor3 = Color3.fromRGB(150, 55, 55)
close.Parent = frame
Instance.new("UICorner", close).CornerRadius = UDim.new(0, 6)

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -24, 0, 22)
status.Position = UDim2.new(0, 12, 0, 38)
status.BackgroundTransparency = 1
status.Text = "READY — press START LISTEN"
status.TextColor3 = Color3.fromRGB(210, 210, 220)
status.Font = Enum.Font.Gotham
status.TextSize = 12
status.TextXAlignment = Enum.TextXAlignment.Left
status.Parent = frame

local logBox = Instance.new("TextBox")
logBox.Size = UDim2.new(1, -24, 1, -116)
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
logBox.Text = "Ready. Listener only; no remote requests are sent.\n"
logBox.Parent = frame
Instance.new("UICorner", logBox).CornerRadius = UDim.new(0, 6)

local function makeButton(text, x, width, color)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, width, 0, 32)
    b.Position = UDim2.new(0, x, 1, -42)
    b.Text = text
    b.Font = Enum.Font.GothamBold
    b.TextSize = 12
    b.TextColor3 = Color3.new(1, 1, 1)
    b.BackgroundColor3 = color
    b.Parent = frame
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    return b
end

local startButton = makeButton("START LISTEN", 12, 120, Color3.fromRGB(45, 125, 75))
local copyButton = makeButton("COPY", 140, 70, Color3.fromRGB(55, 95, 155))
local stopButton = makeButton("STOP", 218, 70, Color3.fromRGB(150, 105, 45))

local lines = {}
local connections = {}
local listening = false
local startedAt = 0
local lastEventAt = nil
local MAX_LINES = 180

local function stringify(value, depth)
    depth = depth or 0
    local kind = typeof(value)
    if kind == "Instance" then
        return value:GetFullName() .. " <" .. value.ClassName .. ">"
    elseif kind == "string" then
        return string.format("%q", value)
    elseif kind == "table" then
        if depth >= 2 then return "{...}" end
        local parts = {}
        for k, v in pairs(value) do
            table.insert(parts, tostring(k) .. "=" .. stringify(v, depth + 1))
            if #parts >= 20 then
                table.insert(parts, "...")
                break
            end
        end
        return "{" .. table.concat(parts, ", ") .. "}"
    elseif kind == "Vector3" or kind == "Vector2" or kind == "CFrame" or kind == "Color3" then
        return tostring(value)
    else
        return tostring(value)
    end
end

local function append(message)
    local stamp = os.date("%H:%M:%S")
    table.insert(lines, stamp .. " | " .. message)
    while #lines > MAX_LINES do table.remove(lines, 1) end
    logBox.Text = table.concat(lines, "\n") .. "\n"
    logBox.CursorPosition = -1
end

local function disconnectAll()
    for _, connection in ipairs(connections) do
        pcall(function() connection:Disconnect() end)
    end
    table.clear(connections)
end

local function stopListening()
    listening = false
    disconnectAll()
    status.Text = "STOPPED"
    append("Listening stopped.")
end

local function onEvent(eventName, ...)
    if not listening then return end
    local now = os.clock()
    local sinceStart = now - startedAt
    local sinceLast = lastEventAt and (now - lastEventAt) or nil
    lastEventAt = now
    local args = table.pack(...)
    local formatted = {}
    for i = 1, args.n do
        formatted[i] = "[" .. i .. "]=" .. stringify(args[i])
    end
    append(string.format("%s | +%.3fs%s | %s",
        eventName,
        sinceStart,
        sinceLast and string.format(" | gap=%.3fs", sinceLast) or "",
        #formatted > 0 and table.concat(formatted, " | ") or "(no arguments)"
    ))
end

startButton.MouseButton1Click:Connect(function()
    if listening then
        append("Already listening.")
        return
    end
    local knocked, landed, err = resolveRemotes()
    if err then
        status.Text = "ERROR — see log"
        append("ERROR: " .. err)
        return
    end
    disconnectAll()
    listening = true
    startedAt = os.clock()
    lastEventAt = nil
    table.insert(connections, knocked.OnClientEvent:Connect(function(...) onEvent("Knocked", ...) end))
    table.insert(connections, landed.OnClientEvent:Connect(function(...) onEvent("Landed", ...) end))
    status.Text = "LISTENING — interact with door normally"
    append("Listening started.")
    append("Target: " .. TARGET_PATH)
    append("Connected: Knocked")
    append("Connected: Landed")
    append("No remote requests will be sent by this script.")
end)

copyButton.MouseButton1Click:Connect(function()
    local content = table.concat(lines, "\n")
    local copied = false
    if typeof(setclipboard) == "function" then
        copied = pcall(setclipboard, content)
    end
    if copied then
        status.Text = "LOG COPIED"
        append("COPY: log sent to clipboard.")
    else
        status.Text = "SELECT LOG TEXT TO COPY"
        logBox.TextEditable = true
        logBox:CaptureFocus()
        logBox.CursorPosition = #logBox.Text
        append("Clipboard API unavailable; select and copy the log text manually.")
    end
end)

stopButton.MouseButton1Click:Connect(stopListening)
close.MouseButton1Click:Connect(function()
    stopListening()
    gui:Destroy()
end)

-- Drag the panel by its title bar.
local UserInputService = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos
title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

append("UI ready. Press START LISTEN.")
