-- Halloween Door Tool V30 — MANUAL REWARD OUTCOME TRACKER
-- Passive diagnostics only. Does not move the character, simulate input,
-- fire remotes, modify game state, or claim that a reward was granted.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
if not player then warn("[V30] LocalPlayer unavailable; run as a client script."); return end
local playerGui = player:WaitForChild("PlayerGui", 10)
if not playerGui then warn("[V30] PlayerGui unavailable."); return end

local GUI_NAME = "HalloweenDoorToolV30"
local old = playerGui:FindFirstChild(GUI_NAME)
if old then old:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name, gui.ResetOnSpawn, gui.DisplayOrder = GUI_NAME, false, 1000
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Name = "Panel"
frame.Size = UDim2.fromOffset(470, 420)
frame.Position = UDim2.new(0.5, -235, 0.5, -210)
frame.BackgroundColor3 = Color3.fromRGB(27, 27, 35)
frame.BorderSizePixel = 0
frame.Active = true
frame.Parent = gui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

local function label(name, text, size, pos, textSize)
    local o = Instance.new("TextLabel")
    o.Name, o.Text, o.Size, o.Position = name, text, size, pos
    o.BackgroundTransparency = 1
    o.TextColor3 = Color3.fromRGB(230, 230, 235)
    o.Font = Enum.Font.Gotham
    o.TextSize = textSize or 12
    o.TextXAlignment = Enum.TextXAlignment.Left
    o.Parent = frame
    return o
end

local title = label("Title", "Halloween Door Tool V30 — OUTCOME TRACKER",
    UDim2.new(1, -100, 0, 30), UDim2.fromOffset(12, 5), 14)
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 205, 120)

local function button(name, text, width, x, y, color)
    local b = Instance.new("TextButton")
    b.Name, b.Text = name, text
    b.Size = UDim2.fromOffset(width, 29)
    b.Position = UDim2.new(0, x, 1, y)
    b.BackgroundColor3 = color
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 10
    b.Parent = frame
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    return b
end

local minimize = Instance.new("TextButton")
minimize.Name, minimize.Text = "Minimize", "-"
minimize.Size = UDim2.fromOffset(28, 27)
minimize.Position = UDim2.new(1, -66, 0, 5)
minimize.BackgroundColor3 = Color3.fromRGB(75, 75, 90)
minimize.TextColor3 = Color3.new(1, 1, 1)
minimize.Font = Enum.Font.GothamBold
minimize.TextSize = 16
minimize.Parent = frame
Instance.new("UICorner", minimize).CornerRadius = UDim.new(0, 5)

local close = Instance.new("TextButton")
close.Name, close.Text = "Close", "X"
close.Size = UDim2.fromOffset(28, 27)
close.Position = UDim2.new(1, -34, 0, 5)
close.BackgroundColor3 = Color3.fromRGB(145, 55, 55)
close.TextColor3 = Color3.new(1, 1, 1)
close.Font = Enum.Font.GothamBold
close.TextSize = 13
close.Parent = frame
Instance.new("UICorner", close).CornerRadius = UDim.new(0, 5)

local status = label("Status", "PASSIVE MODE — mark attempt, interact manually",
    UDim2.new(1, -24, 0, 20), UDim2.fromOffset(12, 37), 11)

local logBox = Instance.new("TextBox")
logBox.Name = "Log"
logBox.Size = UDim2.new(1, -24, 1, -190)
logBox.Position = UDim2.fromOffset(12, 60)
logBox.BackgroundColor3 = Color3.fromRGB(14, 14, 19)
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

local markBtn = button("MarkAttempt", "MARK ATTEMPT", 125, 12, -108, Color3.fromRGB(130, 80, 35))
local listenBtn = button("Listen", "LISTEN: OFF", 105, 145, -108, Color3.fromRGB(55, 95, 155))
local summaryBtn = button("Summary", "SUMMARY", 95, 258, -108, Color3.fromRGB(110, 75, 130))
local yesBtn = button("RewardYes", "REWARD: YES", 115, 12, -72, Color3.fromRGB(45, 120, 70))
local noBtn = button("RewardNo", "REWARD: NO", 115, 135, -72, Color3.fromRGB(150, 65, 60))
local unsureBtn = button("RewardUnsure", "UNSURE", 100, 258, -72, Color3.fromRGB(100, 85, 115))
local copyBtn = button("Copy", "COPY LOG", 105, 12, -36, Color3.fromRGB(55, 95, 155))
local clearBtn = button("Clear", "CLEAR", 90, 125, -36, Color3.fromRGB(90, 85, 105))

local lines, connections = {}, {}
local listening, minimized, closed = false, false, false
local attemptNumber, attemptStart, lastEventClock = 0, nil, nil
local totalCounts = {Knocked = 0, Landed = 0}
local attemptCounts = {Knocked = 0, Landed = 0}
local outcome = "UNRECORDED"
local lastEventSummary = "none"

local function log(message)
    table.insert(lines, os.date("%H:%M:%S") .. " | " .. tostring(message))
    while #lines > 350 do table.remove(lines, 1) end
    logBox.Text = table.concat(lines, "\n") .. "\n"
    logBox.CursorPosition = -1
    print("[V30 PASSIVE] " .. tostring(message))
end

local function distanceToDoor()
    local ok, door = pcall(function()
        return workspace.Halloween.HouseForTrickOrTreating1.DoorOpener["1S_Door"]
    end)
    if not ok or not door then return nil end
    local character = player.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")
    if not root then return nil end
    local okPos, pos = pcall(function() return door.Position end)
    if not okPos then return nil end
    return (root.Position - pos).Magnitude
end

local function describe(value)
    if typeof(value) == "Instance" then
        local ok, fullName = pcall(function() return value:GetFullName() end)
        return (ok and fullName or value.Name) .. " <" .. value.ClassName .. ">"
    end
    return typeof(value) .. ":" .. tostring(value)
end

local function disconnectAll()
    listening = false
    for _, c in ipairs(connections) do pcall(function() c:Disconnect() end) end
    table.clear(connections)
    listenBtn.Text = "LISTEN: OFF"
    listenBtn.BackgroundColor3 = Color3.fromRGB(55, 95, 155)
end

local function startListening()
    disconnectAll()
    local ok, folder = pcall(function()
        local network = ReplicatedStorage:WaitForChild("Network", 8)
        if not network then error("Network folder not found") end
        local service = network:WaitForChild("TrickOrTreatService", 8)
        if not service then error("TrickOrTreatService not found") end
        local re = service:WaitForChild("RE", 8)
        if not re then error("RE folder not found") end
        return re
    end)
    if not ok then
        status.Text = "Could not locate event folder"
        log("ERROR resolving event folder: " .. tostring(folder))
        return
    end

    for _, name in ipairs({"Knocked", "Landed"}) do
        local remote = folder:FindFirstChild(name)
        if not remote or not remote:IsA("RemoteEvent") then
            disconnectAll()
            status.Text = "Missing event: " .. name
            log("ERROR: expected RemoteEvent " .. name)
            return
        end

        table.insert(connections, remote.OnClientEvent:Connect(function(...)
            if not listening or closed then return end
            totalCounts[name] = totalCounts[name] + 1
            if attemptStart then attemptCounts[name] = attemptCounts[name] + 1 end
            local now = os.clock()
            local gap = lastEventClock and (now - lastEventClock) or nil
            lastEventClock = now
            local args, parts = table.pack(...), {}
            for i = 1, args.n do parts[#parts + 1] = "[" .. i .. "] " .. describe(args[i]) end
            local d = distanceToDoor()
            local elapsed = attemptStart and (now - attemptStart) or nil
            lastEventSummary = name .. " args=" .. (#parts > 0 and table.concat(parts, " | ") or "none")
            log(string.format("EVENT %s | total=%d | attempt=%s | since-mark=%s | distance=%s | gap=%s | %s",
                name, totalCounts[name], attemptStart and tostring(attemptNumber) or "unmarked",
                elapsed and string.format("%.2fs", elapsed) or "n/a",
                d and string.format("%.2f studs", d) or "unknown",
                gap and string.format("%.2fs", gap) or "first",
                #parts > 0 and table.concat(parts, " | ") or "(no args)"))
        end))
    end

    listening = true
    listenBtn.Text = "LISTEN: ON"
    listenBtn.BackgroundColor3 = Color3.fromRGB(45, 135, 75)
    status.Text = "Listening — manually interact; record outcome afterward"
    log("V30 listening to Knocked and Landed; passive only")
end

markBtn.Activated:Connect(function()
    attemptNumber = attemptNumber + 1
    attemptStart = os.clock()
    attemptCounts.Knocked, attemptCounts.Landed = 0, 0
    outcome = "UNRECORDED"
    local d = distanceToDoor()
    log(string.format("ATTEMPT #%d MARKED | distance=%s",
        attemptNumber, d and string.format("%.2f studs", d) or "unknown"))
    status.Text = "Attempt #" .. attemptNumber .. " — interact manually"
end)

local function recordOutcome(value)
    if not attemptStart then
        status.Text = "Mark an attempt first"
        log("OUTCOME NOT RECORDED: press MARK ATTEMPT first")
        return
    end
    outcome = value
    local elapsed = os.clock() - attemptStart
    log(string.format("MANUAL OUTCOME for attempt #%d: %s | elapsed=%.2fs | events: Knocked=%d, Landed=%d",
        attemptNumber, outcome, elapsed, attemptCounts.Knocked, attemptCounts.Landed))
    log("Outcome is user-reported, not independently verified by this tool.")
    status.Text = "Attempt #" .. attemptNumber .. " outcome: " .. outcome
end

yesBtn.Activated:Connect(function() recordOutcome("YES — REWARD OBSERVED") end)
noBtn.Activated:Connect(function() recordOutcome("NO — NO REWARD OBSERVED") end)
unsureBtn.Activated:Connect(function() recordOutcome("UNSURE") end)

listenBtn.Activated:Connect(function()
    if listening then
        disconnectAll()
        status.Text = "Listening stopped"
        log("Listening stopped")
    else
        startListening()
    end
end)

summaryBtn.Activated:Connect(function()
    log(string.format("TOTALS: Knocked=%d, Landed=%d", totalCounts.Knocked, totalCounts.Landed))
    if attemptStart then
        log(string.format("ATTEMPT #%d SUMMARY: Knocked=%d, Landed=%d, outcome=%s, elapsed=%.2fs",
            attemptNumber, attemptCounts.Knocked, attemptCounts.Landed, outcome, os.clock() - attemptStart))
    else
        log("No attempt marked yet")
    end
end)

copyBtn.Activated:Connect(function()
    if type(setclipboard) == "function" then
        local ok = pcall(setclipboard, table.concat(lines, "\n"))
        status.Text = ok and "Log copied" or "Clipboard failed"
    else
        status.Text = "Clipboard unavailable; select log text to copy"
    end
end)

clearBtn.Activated:Connect(function()
    table.clear(lines)
    totalCounts.Knocked, totalCounts.Landed = 0, 0
    attemptCounts.Knocked, attemptCounts.Landed = 0, 0
    attemptNumber, attemptStart, lastEventClock = 0, nil, nil
    outcome, lastEventSummary = "UNRECORDED", "none"
    logBox.Text = ""
    log("Log and counters reset")
end)

minimize.Activated:Connect(function()
    minimized = not minimized
    for _, obj in ipairs({status, logBox, markBtn, listenBtn, summaryBtn, yesBtn, noBtn, unsureBtn, copyBtn, clearBtn}) do
        obj.Visible = not minimized
    end
    frame.Size = minimized and UDim2.fromOffset(470, 38) or UDim2.fromOffset(470, 420)
    minimize.Text = minimized and "+" or "-"
end)

close.Activated:Connect(function()
    closed = true
    disconnectAll()
    gui:Destroy()
end)

local dragging, dragStart, startPos = false, nil, nil
title.Active = true
title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging, dragStart, startPos = true, input.Position, frame.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

log("V30 loaded — manual reward outcome tracker ready")
log("Press LISTEN, MARK ATTEMPT, interact manually, then record observed outcome")
