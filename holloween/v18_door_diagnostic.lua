-- Halloween Door Diagnostic v18
-- OBSERVER ONLY: does not FireServer, spoof events, or award rewards.
-- FIRE starts a 12-second observation window. Walk to the target and interact normally.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local TARGET_PATH = "Workspace.Halloween.HouseForTrickOrTreating1.DoorOpener.1S_Door"
local GUI_NAME = "HalloweenDoorDiagnosticV18"
local WINDOW_SECONDS = 12
local MAX_LINES = 160

local function getParent()
    if typeof(gethui) == "function" then
        local ok, parent = pcall(gethui)
        if ok and parent then return parent end
    end
    local ok, core = pcall(function() return game:GetService("CoreGui") end)
    if ok and core then return core end
    return LocalPlayer:WaitForChild("PlayerGui")
end

local parent = getParent()
pcall(function()
    local old = parent:FindFirstChild(GUI_NAME)
    if old then old:Destroy() end
end)

local gui = Instance.new("ScreenGui")
gui.Name = GUI_NAME
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = parent

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 390, 0, 300)
frame.Position = UDim2.new(0.5, -195, 0.52, -150)
frame.BackgroundColor3 = Color3.fromRGB(27, 28, 36)
frame.BorderSizePixel = 0
frame.Active = true
frame.Parent = gui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

local function label(parentObj, name, text, size, pos, color, fontSize)
    local x = Instance.new("TextLabel")
    x.Name = name
    x.Size = size
    x.Position = pos
    x.BackgroundTransparency = 1
    x.Text = text
    x.TextColor3 = color or Color3.fromRGB(230, 230, 235)
    x.Font = Enum.Font.Gotham
    x.TextSize = fontSize or 12
    x.TextXAlignment = Enum.TextXAlignment.Left
    x.Parent = parentObj
    return x
end

local title = label(frame, "Title", "Halloween Door Diagnostic v18", UDim2.new(1, -100, 0, 30), UDim2.new(0, 12, 0, 4), Color3.fromRGB(255, 210, 125), 15)
title.Font = Enum.Font.GothamBold

local function button(name, text, width, x, color)
    local b = Instance.new("TextButton")
    b.Name = name
    b.Size = UDim2.new(0, width, 0, 28)
    b.Position = UDim2.new(0, x, 0, 5)
    b.Text = text
    b.Font = Enum.Font.GothamBold
    b.TextSize = 12
    b.TextColor3 = Color3.new(1,1,1)
    b.BackgroundColor3 = color
    b.Parent = frame
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    return b
end

local minimize = button("Minimize", "−", 28, 318, Color3.fromRGB(80, 80, 95))
local close = button("Close", "✕", 28, 352, Color3.fromRGB(145, 55, 55))

local status = label(frame, "Status", "READY — FIRE arms a 12s observation window", UDim2.new(1, -24, 0, 20), UDim2.new(0, 12, 0, 36), Color3.fromRGB(210, 210, 220), 11)

local logBox = Instance.new("TextBox")
logBox.Name = "Log"
logBox.Size = UDim2.new(1, -24, 1, -118)
logBox.Position = UDim2.new(0, 12, 0, 60)
logBox.BackgroundColor3 = Color3.fromRGB(14, 15, 20)
logBox.TextColor3 = Color3.fromRGB(220, 235, 220)
logBox.Font = Enum.Font.Code
logBox.TextSize = 10
logBox.TextXAlignment = Enum.TextXAlignment.Left
logBox.TextYAlignment = Enum.TextYAlignment.Top
logBox.TextWrapped = false
logBox.MultiLine = true
logBox.ClearTextOnFocus = false
logBox.TextEditable = false
logBox.Text = ""
logBox.Parent = frame
Instance.new("UICorner", logBox).CornerRadius = UDim.new(0, 6)

local function bottomButton(name, text, width, x, color)
    local b = Instance.new("TextButton")
    b.Name = name
    b.Size = UDim2.new(0, width, 0, 30)
    b.Position = UDim2.new(0, x, 1, -42)
    b.Text = text
    b.Font = Enum.Font.GothamBold
    b.TextSize = 11
    b.TextColor3 = Color3.new(1,1,1)
    b.BackgroundColor3 = color
    b.Parent = frame
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    return b
end

local fire = bottomButton("Fire", "FIRE / ARM TEST", 132, 12, Color3.fromRGB(155, 75, 45))
local copy = bottomButton("Copy", "COPY LOG", 88, 152, Color3.fromRGB(55, 95, 155))
local stop = bottomButton("Stop", "STOP", 70, 248, Color3.fromRGB(130, 90, 45))

local lines, connections = {}, {}
local armed, minimized = false, false
local armToken = 0
local originalSize = frame.Size

local function append(msg)
    table.insert(lines, os.date("%H:%M:%S") .. " | " .. msg)
    while #lines > MAX_LINES do table.remove(lines, 1) end
    logBox.Text = table.concat(lines, "\n") .. "\n"
    logBox.CursorPosition = -1
end

local function disconnectAll()
    for _, c in ipairs(connections) do pcall(function() c:Disconnect() end) end
    table.clear(connections)
end

local function getTarget()
    local ok, target = pcall(function()
        return workspace.Halloween.HouseForTrickOrTreating1.DoorOpener["1S_Door"]
    end)
    if ok and target and target:IsA("BasePart") then return target end
    return nil
end

local function distance()
    local target = getTarget()
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if target and root then return (root.Position - target.Position).Magnitude end
    return nil
end

local function describeInput(input, processed)
    if not armed then return end
    local kind = input.UserInputType.Name
    local key = input.KeyCode and input.KeyCode.Name or "Unknown"
    if input.UserInputType == Enum.UserInputType.Keyboard then
        append("INPUT key=" .. key .. " processed=" .. tostring(processed) .. " distance=" .. (distance() and string.format("%.2f", distance()) or "n/a"))
    elseif input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        append("INPUT type=" .. kind .. " processed=" .. tostring(processed) .. " distance=" .. (distance() and string.format("%.2f", distance()) or "n/a"))
    end
end

local function connectEvents()
    disconnectAll()
    local ok, remotes = pcall(function()
        return ReplicatedStorage:WaitForChild("Network", 5):WaitForChild("TrickOrTreatService", 5):WaitForChild("RE", 5)
    end)
    if not ok or not remotes then
        append("ERROR: Could not resolve TrickOrTreatService.RE")
        return
    end
    for _, name in ipairs({"Knocked", "Landed"}) do
        local remote = remotes:FindFirstChild(name)
        if remote and remote:IsA("RemoteEvent") then
            table.insert(connections, remote.OnClientEvent:Connect(function(...)
                if not armed then return end
                local args = table.pack(...)
                local parts = {}
                for i = 1, args.n do
                    local v = args[i]
                    if typeof(v) == "Instance" then v = v:GetFullName() .. " <" .. v.ClassName .. ">" end
                    parts[#parts+1] = "[" .. i .. "]=" .. tostring(v)
                end
                local d = distance()
                append("EVENT " .. name .. " distance=" .. (d and string.format("%.2f", d) or "n/a") .. " " .. (#parts > 0 and table.concat(parts, " | ") or "(no args)"))
            end))
            append("Connected observer: " .. name)
        else
            append("WARNING: " .. name .. " RemoteEvent not found")
        end
    end
end

local function disarm(reason)
    armed = false
    armToken += 1
    status.Text = reason or "STOPPED"
    append(reason or "Observation stopped.")
end

fire.MouseButton1Click:Connect(function()
    if armed then
        append("Already armed; interact with the door normally.")
        return
    end
    armed = true
    armToken += 1
    local thisToken = armToken
    status.Text = "ARMED — walk to door and interact normally"
    append("FIRE pressed: observation window armed for " .. WINDOW_SECONDS .. " seconds.")
    append("Target: " .. TARGET_PATH)
    append("This button does NOT trigger the door or send remote requests.")
    local d = distance()
    append("Starting distance: " .. (d and string.format("%.2f", d) or "n/a"))
    connectEvents()
    task.delay(WINDOW_SECONDS, function()
        if armed and armToken == thisToken then
            armed = false
            status.Text = "WINDOW ENDED — copy log"
            append("Observation window ended.")
        end
    end)
end)

table.insert(connections, UserInputService.InputBegan:Connect(describeInput))
stop.MouseButton1Click:Connect(function() disarm("STOPPED") end)
copy.MouseButton1Click:Connect(function()
    local content = table.concat(lines, "\n")
    local ok = false
    if typeof(setclipboard) == "function" then ok = pcall(setclipboard, content) end
    if ok then
        status.Text = "LOG COPIED"
        append("Log copied to clipboard.")
    else
        status.Text = "Clipboard unavailable — select log manually"
        logBox.TextEditable = true
        logBox:CaptureFocus()
        append("Clipboard API unavailable; select and copy the log manually.")
    end
end)

minimize.MouseButton1Click:Connect(function()
    minimized = not minimized
    logBox.Visible = not minimized
    fire.Visible = not minimized
    copy.Visible = not minimized
    stop.Visible = not minimized
    frame.Size = minimized and UDim2.new(0, 390, 0, 40) or originalSize
end)

close.MouseButton1Click:Connect(function()
    disarm("CLOSED")
    disconnectAll()
    gui:Destroy()
end)

-- Drag by title bar (mouse and touch).
local dragging, dragStart, startPos, dragInput
title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging, dragStart, startPos = true, input.Position, frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
end)
table.insert(connections, UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end))

append("V18 ready. FIRE arms observation only; it does not trigger a reward.")
