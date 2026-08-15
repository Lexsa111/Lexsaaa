-- Lezsa | Hypershot v3
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera or workspace:WaitForChild("Camera")

local Settings = {
    Aimbot = true,
    AimbotKey = Enum.UserInputType.MouseButton2,
    FOV = 250,
    Smoothness = 3,
    VisibleOnly = true,
    TeamCheck = true,
    ESP = true,
    ESP_Box = true,
    ESP_Name = true,
    ESP_Tracer = true,
    ESP_HealthBar = true,
    MaxDistance = 2000,
}

-- [[ Watermark ]]
local WatermarkGui = Instance.new("ScreenGui")
WatermarkGui.Name = "LezsaWatermark"
WatermarkGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
WatermarkGui.ResetOnSpawn = false

local Watermark = Instance.new("TextLabel")
Watermark.Parent = WatermarkGui
Watermark.Text = "lezsa | hypershot"
Watermark.Size = UDim2.new(0, 170, 0, 20)
Watermark.Position = UDim2.new(0, 10, 0, 10)
Watermark.BackgroundTransparency = 1
Watermark.TextColor3 = Color3.fromRGB(200, 160, 255)
Watermark.TextStrokeColor3 = Color3.fromRGB(100, 60, 160)
Watermark.TextStrokeTransparency = 0.4
Watermark.Font = Enum.Font.Code
Watermark.TextSize = 13
Watermark.TextXAlignment = Enum.TextXAlignment.Left

-- [[ ESP Drawing ]]
local ESPDrawings = {}
local Drawing = nil

pcall(function()
    Drawing = loadstring(game:HttpGet("https://raw.githubusercontent.com/Inkyz/OrionLib/main/Drawing.lua", true))()
end)

if not Drawing then
    -- fallback: try native Drawing if exists
    pcall(function()
        if typeof(Drawing) == "table" then
            Drawing = Drawing
        end
    end)
end

local function ClearESP()
    for _, v in pairs(ESPDrawings) do
        pcall(function() v:Remove() end)
    end
    table.clear(ESPDrawings)
end

local function CreateESP(player)
    if not Drawing then return end
    if player == LocalPlayer then return end

    local char = player.Character
    if not char then return end

    local entry = {
        player = player,
        box = nil,
        name = nil,
        tracer = nil,
        healthBg = nil,
        healthFill = nil,
    }

    if Settings.ESP_Box then
        entry.box = Drawing.new("Square")
        entry.box.Visible = false
        entry.box.Color = Color3.fromRGB(255, 255, 255)
        entry.box.Thickness = 1.5
        entry.box.Filled = false
        entry.box.Transparency = 1
    end

    if Settings.ESP_Name then
        entry.name = Drawing.new("Text")
        entry.name.Visible = false
        entry.name.Color = Color3.fromRGB(255, 255, 255)
        entry.name.Size = 13
        entry.name.Center = true
        entry.name.Outline = true
        entry.name.OutlineColor = Color3.fromRGB(0, 0, 0)
        entry.name.Text = player.Name
    end

    if Settings.ESP_Tracer then
        entry.tracer = Drawing.new("Line")
        entry.tracer.Visible = false
        entry.tracer.Color = Color3.fromRGB(190, 130, 255)
        entry.tracer.Thickness = 1
        entry.tracer.Transparency = 1
    end

    if Settings.ESP_HealthBar then
        entry.healthBg = Drawing.new("Square")
        entry.healthBg.Visible = false
        entry.healthBg.Color = Color3.fromRGB(0, 0, 0)
        entry.healthBg.Thickness = 1
        entry.healthBg.Filled = true
        entry.healthBg.Transparency = 1

        entry.healthFill = Drawing.new("Square")
        entry.healthFill.Visible = false
        entry.healthFill.Color = Color3.fromRGB(120, 255, 120)
        entry.healthFill.Thickness = 1
        entry.healthFill.Filled = true
        entry.healthFill.Transparency = 1
    end

    ESPDrawings[player] = entry
end

local function UpdateESPAll()
    ClearESP()
    if not Settings.ESP then return end
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            CreateESP(player)
        end
    end
end

for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        CreateESP(player)
    end
end

Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        player.CharacterAdded:Connect(function()
            task.wait(0.5)
            if Settings.ESP then
                CreateESP(player)
            end
        end)
        if player.Character and Settings.ESP then
            CreateESP(player)
        end
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if ESPDrawings[player] then
        for _, v in pairs(ESPDrawings[player]) do
            if v then pcall(function() v:Remove() end) end
        end
        ESPDrawings[player] = nil
    end
end)

-- [[ Target Checks ]]
local function IsEnemy(player)
    if player == LocalPlayer then return false end
    if Settings.TeamCheck then
        if player.Team and LocalPlayer.Team and player.Team == LocalPlayer.Team then
            return false
        end
    end
    local character = player.Character
    if not character or not character:FindFirstChild("Humanoid") or character.Humanoid.Health <= 0 then
        return false
    end
    local root = character:FindFirstChild("HumanoidRootPart")
    if not root then return false end
    return true
end

local function IsVisible(player)
    if not Settings.VisibleOnly then return true end
    local char = player.Character
    if not char then return false end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return false end

    local camPos = Camera.CFrame.Position
    local rayParams = RaycastParams.new()
    rayParams.FilterType = Enum.RaycastFilterType.Blacklist
    rayParams.FilterDescendantsInstances = {LocalPlayer.Character}

    local ray = workspace:Raycast(camPos, root.Position - camPos, rayParams)
    if ray and ray.Instance then
        local hitModel = ray.Instance:FindFirstAncestorOfClass("Model")
        return hitModel == char
    end
    return true
end

local function GetNearestTarget()
    local nearest = nil
    local nearestDist = Settings.FOV
    local screenCenter = Camera.ViewportSize / 2

    for _, player in pairs(Players:GetPlayers()) do
        if IsEnemy(player) and IsVisible(player) then
            local char = player.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            if root then
                local screenPos, onScreen = Camera:WorldToScreenPoint(root.Position)
                if onScreen then
                    local dist = (Vector2.new(screenPos.X, screenPos.Y) - screenCenter).Magnitude
                    if dist < nearestDist then
                        nearestDist = dist
                        nearest = player
                    end
                end
            end
        end
    end
    return nearest
end

-- [[ Aimbot ]]
RunService.RenderStepped:Connect(function()
    if Settings.Aimbot and UserInputService:IsMouseButtonPressed(Settings.AimbotKey) then
        local target = GetNearestTarget()
        if target and target.Character then
            local root = target.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local camPos = Camera.CFrame.Position
                local lookAt = CFrame.lookAt(camPos, root.Position + Vector3.new(0, 1, 0))
                if Settings.Smoothness > 1 then
                    Camera.CFrame = Camera.CFrame:Lerp(lookAt, 1 / Settings.Smoothness)
                else
                    Camera.CFrame = lookAt
                end
            end
        end
    end
end)

-- [[ ESP Render ]]
RunService.RenderStepped:Connect(function()
    if not Settings.ESP or not Drawing then return end

    local viewport = Camera.ViewportSize
    local screenCenter = Vector2.new(viewport.X / 2, viewport.Y / 2)

    for player, entry in pairs(ESPDrawings) do
        local char = player.Character
        if not char then
            if entry.box then entry.box.Visible = false end
            if entry.name then entry.name.Visible = false end
            if entry.tracer then entry.tracer.Visible = false end
            if entry.healthBg then entry.healthBg.Visible = false end
            if entry.healthFill then entry.healthFill.Visible = false end
            continue
        end

        local root = char:FindFirstChild("HumanoidRootPart")
        local head = char:FindFirstChild("Head")
        local humanoid = char:FindFirstChild("Humanoid")
        if not root or not head or not humanoid then
            if entry.box then entry.box.Visible = false end
            if entry.name then entry.name.Visible = false end
            if entry.tracer then entry.tracer.Visible = false end
            if entry.healthBg then entry.healthBg.Visible = false end
            if entry.healthFill then entry.healthFill.Visible = false end
            continue
        end

        local rootPos, rootOnScreen = Camera:WorldToScreenPoint(root.Position)
        local headPos, headOnScreen = Camera:WorldToScreenPoint(head.Position + Vector3.new(0, 0.5, 0))

        if not rootOnScreen and not headOnScreen then
            if entry.box then entry.box.Visible = false end
            if entry.name then entry.name.Visible = false end
            if entry.tracer then entry.tracer.Visible = false end
            if entry.healthBg then entry.healthBg.Visible = false end
            if entry.healthFill then entry.healthFill.Visible = false end
            continue
        end

        local boxHeight = math.max(10, (rootPos.Y - headPos.Y))
        local boxWidth = boxHeight / 2
        local boxX = headPos.X - boxWidth / 2
        local boxY = headPos.Y

        if entry.box then
            entry.box.Visible = true
            entry.box.Position = Vector2.new(boxX, boxY)
            entry.box.Size = Vector2.new(boxWidth, boxHeight)
        end

        if entry.name then
            entry.name.Visible = true
            entry.name.Position = Vector2.new(headPos.X, headPos.Y - 14)
            entry.name.Text = player.Name
        end

        if entry.tracer then
            entry.tracer.Visible = true
            entry.tracer.From = Vector2.new(viewport.X / 2, viewport.Y)
            entry.tracer.To = Vector2.new(rootPos.X, rootPos.Y + (boxHeight / 2))
        end

        if entry.healthBg and entry.healthFill then
            entry.healthBg.Visible = true
            entry.healthFill.Visible = true
            local barWidth = 3
            local barHeight = boxHeight
            local barX = boxX - 6
            local barY = boxY

            entry.healthBg.Position = Vector2.new(barX, barY)
            entry.healthBg.Size = Vector2.new(barWidth, barHeight)

            local healthPercent = math.clamp(humanoid.Health / humanoid.MaxHealth, 0, 1)
            local fillHeight = barHeight * healthPercent
            local fillY = barY + (barHeight - fillHeight)

            entry.healthFill.Position = Vector2.new(barX, fillY)
            entry.healthFill.Size = Vector2.new(barWidth, fillHeight)
            entry.healthFill.Color = Color3.fromHSV(healthPercent * 0.33, 1, 1)
        end
    end
end)

-- [[ Menu ]]
local MenuScreen = Instance.new("ScreenGui")
MenuScreen.Name = "LezsaMenu"
MenuScreen.Parent = LocalPlayer:WaitForChild("PlayerGui")
MenuScreen.ResetOnSpawn = false
MenuScreen.IgnoreGuiInset = true

-- overlay to block input
local Overlay = Instance.new("TextButton")
Overlay.Parent = MenuScreen
Overlay.Size = UDim2.new(1, 0, 1, 0)
Overlay.Position = UDim2.new(0, 0, 0, 0)
Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Overlay.BackgroundTransparency = 0.5
Overlay.BorderSizePixel = 0
Overlay.Text = ""
Overlay.Visible = false
Overlay.ZIndex = 1

local MenuFrame = Instance.new("Frame")
MenuFrame.Parent = MenuScreen
MenuFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MenuFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MenuFrame.Size = UDim2.new(0, 280, 0, 390)
MenuFrame.BackgroundColor3 = Color3.fromRGB(28, 18, 40)
MenuFrame.BorderSizePixel = 0
MenuFrame.ZIndex = 2
MenuFrame.Visible = false

local MenuCorner = Instance.new("UICorner")
MenuCorner.CornerRadius = UDim.new(0, 12)
MenuCorner.Parent = MenuFrame

local MenuStroke = Instance.new("UIStroke")
MenuStroke.Parent = MenuFrame
MenuStroke.Thickness = 1.5
MenuStroke.Color = Color3.fromRGB(160, 100, 255)
MenuStroke.Transparency = 0.2

local MenuGradient = Instance.new("UIGradient")
MenuGradient.Parent = MenuFrame
MenuGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 20, 55)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 12, 35)),
})
MenuGradient.Rotation = 45

-- Title
local TitleBar = Instance.new("Frame")
TitleBar.Parent = MenuFrame
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.Position = UDim2.new(0, 0, 0, 0)
TitleBar.BackgroundColor3 = Color3.fromRGB(50, 28, 80)
TitleBar.BorderSizePixel = 0

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = TitleBar

local TitleBottomCover = Instance.new("Frame")
TitleBottomCover.Parent = TitleBar
TitleBottomCover.Size = UDim2.new(1, 0, 0, 8)
TitleBottomCover.Position = UDim2.new(0, 0, 1, -8)
TitleBottomCover.BackgroundColor3 = TitleBar.BackgroundColor3
TitleBottomCover.BorderSizePixel = 0

local TitleGradient = Instance.new("UIGradient")
TitleGradient.Parent = TitleBar
TitleGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 55, 180)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(55, 28, 90)),
})
TitleGradient.Rotation = 90

local TitleText = Instance.new("TextLabel")
TitleText.Parent = TitleBar
TitleText.Size = UDim2.new(1, -60, 0, 0, 40)
TitleText.Position = UDim2.new(0, 16, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "Lezsa"
TitleText.Font = Enum.Font.Code
TitleText.TextSize = 18
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.TextXAlignment = Enum.TextXAlignment.Left

-- Close button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TitleBar
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -34, 0, 6)
CloseBtn.BackgroundColor3 = Color3.fromRGB(120, 60, 200)
CloseBtn.BorderSizePixel = 0
CloseBtn.Text = "X"
CloseBtn.Font = Enum.Font.Code
CloseBtn.TextSize = 16
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.AutoButtonColor = false

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
    MenuFrame.Visible = false
    Overlay.Visible = false
end)

-- Toggle creator
local function CreateToggle(parent, yPos, text, default, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Size = UDim2.new(1, -32, 0, 36)
    btn.Position = UDim2.new(0, 16, 0, yPos)
    btn.BackgroundColor3 = default and Color3.fromRGB(80, 45, 160) or Color3.fromRGB(40, 30, 55)
    btn.BorderSizePixel = 0
    btn.Text = text .. ": " .. (default and "ON" or "OFF")
    btn.Font = Enum.Font.Code
    btn.TextSize = 13
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.AutoButtonColor = false

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    local stroke = Instance.new("UIStroke")
    stroke.Parent = btn
    stroke.Thickness = 1
    stroke.Color = default and Color3.fromRGB(170, 110, 255) or Color3.fromRGB(70, 50, 100)
    stroke.Transparency = 0.2

    local gradient = Instance.new("UIGradient")
    gradient.Parent = btn
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 40, 150)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 25, 80)),
    })
    gradient.Rotation = 90

    local function UpdateVisual()
        btn.Text = text .. ": " .. (default and "ON" or "OFF")
        btn.BackgroundColor3 = default and Color3.fromRGB(80, 45, 160) or Color3.fromRGB(40, 30, 55)
        gradient.Color = default
            and ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(110, 60, 200)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 30, 110)),
            })
            or ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 38, 70)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 22, 45)),
            })
        stroke.Color = default and Color3.fromRGB(170, 110, 255) or Color3.fromRGB(70, 50, 100)
    end

    btn.MouseButton1Click:Connect(function()
        default = not default
        UpdateVisual()
        callback(default)
    end)

    return btn
end

local function CreateSectionLabel(parent, yPos, text)
    local label = Instance.new("TextLabel")
    label.Parent = parent
    label.Size = UDim2.new(1, -32, 0, 20)
    label.Position = UDim2.new(0, 16, 0, yPos)
    label.BackgroundTransparency = 1
    label.Text = text
    label.Font = Enum.Font.Code
    label.TextSize = 12
    label.TextColor3 = Color3.fromRGB(180, 140, 230)
    label.TextXAlignment = Enum.TextXAlignment.Left
    return label
end

local y = 46

CreateSectionLabel(MenuFrame, y, "AIMBOT")
y += 22

CreateToggle(MenuFrame, y, "Aimbot", Settings.Aimbot, function(val)
    Settings.Aimbot = val
end)
y += 42

CreateToggle(MenuFrame, y, "Visible Only", Settings.VisibleOnly, function(val)
    Settings.VisibleOnly = val
end)
y += 42

CreateToggle(MenuFrame, y, "Team Check", Settings.TeamCheck, function(val)
    Settings.TeamCheck = val
end)
y += 48

CreateSectionLabel(MenuFrame, y, "ESP")
y += 22

CreateToggle(MenuFrame, y, "ESP", Settings.ESP, function(val)
    Settings.ESP = val
    UpdateESPAll()
end)
y += 42

CreateToggle(MenuFrame, y, "ESP Box", Settings.ESP_Box, function(val)
    Settings.ESP_Box = val
    UpdateESPAll()
end)
y += 42

CreateToggle(MenuFrame, y, "ESP Name", Settings.ESP_Name, function(val)
    Settings.ESP_Name = val
    UpdateESPAll()
end)
y += 42

CreateToggle(MenuFrame, y, "ESP Tracer", Settings.ESP_Tracer, function(val)
    Settings.ESP_Tracer = val
    UpdateESPAll()
end)
y += 42

CreateToggle(MenuFrame, y, "ESP Health", Settings.ESP_HealthBar, function(val)
    Settings.ESP_HealthBar = val
    UpdateESPAll()
end)
y += 48

-- FOV
local FOVLabel = Instance.new("TextLabel")
FOVLabel.Parent = MenuFrame
FOVLabel.Size = UDim2.new(1, -32, 0, 20)
FOVLabel.Position = UDim2.new(0, 16, 0, y)
FOVLabel.BackgroundTransparency = 1
FOVLabel.Text = "FOV: " .. Settings.FOV
FOVLabel.Font = Enum.Font.Code
FOVLabel.TextSize = 12
FOVLabel.TextColor3 = Color3.fromRGB(180, 140, 230)
FOVLabel.TextXAlignment = Enum.TextXAlignment.Center

y += 24

local FOVMinus = Instance.new("TextButton")
FOVMinus.Parent = MenuFrame
FOVMinus.Size = UDim2.new(0.5, -20, 0, 30)
FOVMinus.Position = UDim2.new(0, 16, 0, y)
FOVMinus.BackgroundColor3 = Color3.fromRGB(50, 32, 80)
FOVMinus.BorderSizePixel = 0
FOVMinus.Text = "-"
FOVMinus.Font = Enum.Font.Code
FOVMinus.TextSize = 18
FOVMinus.TextColor3 = Color3.fromRGB(255, 255, 255)
FOVMinus.AutoButtonColor = false

local FOVMinusCorner = Instance.new("UICorner")
FOVMinusCorner.CornerRadius = UDim.new(0, 8)
FOVMinusCorner.Parent = FOVMinus

local FOVPlus = Instance.new("TextButton")
FOVPlus.Parent = MenuFrame
FOVPlus.Size = UDim2.new(0.5, -20, 0, 30)
FOVPlus.Position = UDim2.new(0.5, 4, 0, y)
FOVPlus.BackgroundColor3 = Color3.fromRGB(50, 32, 80)
FOVPlus.BorderSizePixel = 0
FOVPlus.Text = "+"
FOVPlus.Font = Enum.Font.Code
FOVPlus.TextSize = 18
FOVPlus.TextColor3 = Color3.fromRGB(255, 255, 255)
FOVPlus.AutoButtonColor = false

local FOVPlusCorner = Instance.new("UICorner")
FOVPlusCorner.CornerRadius = UDim.new(0, 8)
FOVPlusCorner.Parent = FOVPlus

FOVMinus.MouseButton1Click:Connect(function()
    Settings.FOV = math.max(50, Settings.FOV - 25)
    FOVLabel.Text = "FOV: " .. Settings.FOV
end)

FOVPlus.MouseButton1Click:Connect(function()
    Settings.FOV = math.min(600, Settings.FOV + 25)
    FOVLabel.Text = "FOV: " .. Settings.FOV
end)

-- Menu open/close
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.Insert then
        local shouldOpen = not MenuFrame.Visible
        MenuFrame.Visible = shouldOpen
        Overlay.Visible = shouldOpen
    end
end)

Overlay.MouseButton1Click:Connect(function()
    MenuFrame.Visible = false
    Overlay.Visible = false
end)