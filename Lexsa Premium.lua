-- Lexsa Premium | HyperShot
-- Xeno Executor Uyumlu
-- INSERT ile menü, sağ tık aimbot

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera or workspace:WaitForChild("Camera")

local Settings = {
    Aimbot = true,
    AimbotKey = Enum.UserInputType.MouseButton2,
    FOV = 400,
    Smoothness = 1,
    VisibleOnly = false,
    TeamCheck = true,
    TargetBots = true,
    ESP = true,
    ESP_Box = true,
    ESP_Name = true,
    ESP_HealthBar = true,
    MaxDistance = 3000,
}

-- [[ WATERMARK - PREMIUM ]]
local WatermarkGui = Instance.new("ScreenGui")
WatermarkGui.Name = "LexsaWatermark"
WatermarkGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
WatermarkGui.ResetOnSpawn = false

local WatermarkFrame = Instance.new("Frame")
WatermarkFrame.Parent = WatermarkGui
WatermarkFrame.Size = UDim2.new(0, 220, 0, 30)
WatermarkFrame.Position = UDim2.new(0, 10, 0, 10)
WatermarkFrame.BackgroundColor3 = Color3.fromRGB(25, 15, 5)
WatermarkFrame.BorderSizePixel = 0

local WMCorner = Instance.new("UICorner")
WMCorner.CornerRadius = UDim.new(0, 8)
WMCorner.Parent = WatermarkFrame

local WMGradient = Instance.new("UIGradient")
WMGradient.Parent = WatermarkFrame
WMGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 120, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 200, 50)),
})
WMGradient.Rotation = 90

local WMTitle = Instance.new("TextLabel")
WMTitle.Parent = WatermarkFrame
WMTitle.Size = UDim2.new(1, -20, 1, 0)
WMTitle.Position = UDim2.new(0, 10, 0, 0)
WMTitle.BackgroundTransparency = 1
WMTitle.Text = "⚡ Lexsa Premium"
WMTitle.Font = Enum.Font.Code
WMTitle.TextSize = 15
WMTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
WMTitle.TextXAlignment = Enum.TextXAlignment.Left

-- [[ MENU - PREMIUM ]]
local MenuScreen = Instance.new("ScreenGui")
MenuScreen.Name = "LexsaMenu"
MenuScreen.Parent = LocalPlayer:WaitForChild("PlayerGui")
MenuScreen.ResetOnSpawn = false
MenuScreen.IgnoreGuiInset = true

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
MenuFrame.Size = UDim2.new(0, 360, 0, 480)
MenuFrame.BackgroundColor3 = Color3.fromRGB(30, 18, 8)
MenuFrame.BorderSizePixel = 0
MenuFrame.ZIndex = 2
MenuFrame.Visible = false

local MenuCorner = Instance.new("UICorner")
MenuCorner.CornerRadius = UDim.new(0, 14)
MenuCorner.Parent = MenuFrame

local MenuStroke = Instance.new("UIStroke")
MenuStroke.Parent = MenuFrame
MenuStroke.Thickness = 2
MenuStroke.Color = Color3.fromRGB(255, 150, 0)
MenuStroke.Transparency = 0

local MenuGradient = Instance.new("UIGradient")
MenuGradient.Parent = MenuFrame
MenuGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 30, 5)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 12, 2)),
})
MenuGradient.Rotation = 45

-- Particle container (arka planda)
local ParticleContainer = Instance.new("Frame")
ParticleContainer.Parent = MenuFrame
ParticleContainer.Size = UDim2.new(1, 0, 1, 0)
ParticleContainer.BackgroundTransparency = 1
ParticleContainer.ZIndex = 0
ParticleContainer.ClipsDescendants = true

-- Title bar
local TitleBar = Instance.new("Frame")
TitleBar.Parent = MenuFrame
TitleBar.Size = UDim2.new(1, 0, 0, 46)
TitleBar.Position = UDim2.new(0, 0, 0, 0)
TitleBar.BackgroundColor3 = Color3.fromRGB(60, 35, 5)
TitleBar.BorderSizePixel = 0
TitleBar.ZIndex = 5

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 14)
TitleCorner.Parent = TitleBar

local TitleCover = Instance.new("Frame")
TitleCover.Parent = TitleBar
TitleCover.Size = UDim2.new(1, 0, 0, 10)
TitleCover.Position = UDim2.new(0, 0, 1, -10)
TitleCover.BackgroundColor3 = TitleBar.BackgroundColor3
TitleCover.BorderSizePixel = 0

local TitleGradient = Instance.new("UIGradient")
TitleGradient.Parent = TitleBar
TitleGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 140, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 90, 0)),
})
TitleGradient.Rotation = 90

local TitleText = Instance.new("TextLabel")
TitleText.Parent = TitleBar
TitleText.Size = UDim2.new(1, -60, 1, 0)
TitleText.Position = UDim2.new(0, 16, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "Lexsa Premium"
TitleText.Font = Enum.Font.Code
TitleText.TextSize = 19
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.ZIndex = 6

local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TitleBar
CloseBtn.Size = UDim2.new(0, 32, 0, 32)
CloseBtn.Position = UDim2.new(1, -40, 0, 7)
CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 110, 0)
CloseBtn.BorderSizePixel = 0
CloseBtn.Text = "✕"
CloseBtn.Font = Enum.Font.Code
CloseBtn.TextSize = 16
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.AutoButtonColor = false
CloseBtn.ZIndex = 6

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

-- Tab bar
local TabBar = Instance.new("Frame")
TabBar.Parent = MenuFrame
TabBar.Size = UDim2.new(1, 0, 0, 40)
TabBar.Position = UDim2.new(0, 0, 0, 46)
TabBar.BackgroundColor3 = Color3.fromRGB(20, 10, 3)
TabBar.BorderSizePixel = 0
TabBar.ZIndex = 5

local AimbotTab = Instance.new("TextButton")
AimbotTab.Parent = TabBar
AimbotTab.Size = UDim2.new(0.5, -4, 1, -6)
AimbotTab.Position = UDim2.new(0, 3, 0, 3)
AimbotTab.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
AimbotTab.BorderSizePixel = 0
AimbotTab.Text = "AIMBOT"
AimbotTab.Font = Enum.Font.Code
AimbotTab.TextSize = 13
AimbotTab.TextColor3 = Color3.fromRGB(255, 255, 255)
AimbotTab.AutoButtonColor = false
AimbotTab.ZIndex = 6

local AimbotTabCorner = Instance.new("UICorner")
AimbotTabCorner.CornerRadius = UDim.new(0, 6)
AimbotTabCorner.Parent = AimbotTab

local ESPTab = Instance.new("TextButton")
ESPTab.Parent = TabBar
ESPTab.Size = UDim2.new(0.5, -4, 1, -6)
ESPTab.Position = UDim2.new(0.5, 1, 0, 3)
ESPTab.BackgroundColor3 = Color3.fromRGB(50, 30, 10)
ESPTab.BorderSizePixel = 0
ESPTab.Text = "ESP"
ESPTab.Font = Enum.Font.Code
ESPTab.TextSize = 13
ESPTab.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPTab.AutoButtonColor = false
ESPTab.ZIndex = 6

local ESPTabCorner = Instance.new("UICorner")
ESPTabCorner.CornerRadius = UDim.new(0, 6)
ESPTabCorner.Parent = ESPTab

-- Content containers
local AimbotContent = Instance.new("Frame")
AimbotContent.Parent = MenuFrame
AimbotContent.Size = UDim2.new(1, 0, 1, -86)
AimbotContent.Position = UDim2.new(0, 0, 0, 86)
AimbotContent.BackgroundTransparency = 1
AimbotContent.ZIndex = 5

local ESPContent = Instance.new("Frame")
ESPContent.Parent = MenuFrame
ESPContent.Size = UDim2.new(1, 0, 1, -86)
ESPContent.Position = UDim2.new(0, 0, 0, 86)
ESPContent.BackgroundTransparency = 1
ESPContent.ZIndex = 5
ESPContent.Visible = false

-- Tab switching
AimbotTab.MouseButton1Click:Connect(function()
    AimbotContent.Visible = true
    ESPContent.Visible = false
    AimbotTab.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
    ESPTab.BackgroundColor3 = Color3.fromRGB(50, 30, 10)
end)

ESPTab.MouseButton1Click:Connect(function()
    AimbotContent.Visible = false
    ESPContent.Visible = true
    AimbotTab.BackgroundColor3 = Color3.fromRGB(50, 30, 10)
    ESPTab.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
end)

-- Toggle creation helper
local function CreateToggle(parent, yPos, text, default, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Size = UDim2.new(1, -32, 0, 40)
    btn.Position = UDim2.new(0, 16, 0, yPos)
    btn.BackgroundColor3 = default and Color3.fromRGB(255, 140, 0) or Color3.fromRGB(45, 30, 12)
    btn.BorderSizePixel = 0
    btn.Text = text .. ": " .. (default and "ON" or "OFF")
    btn.Font = Enum.Font.Code
    btn.TextSize = 13
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.AutoButtonColor = false
    btn.ZIndex = 6

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    local stroke = Instance.new("UIStroke")
    stroke.Parent = btn
    stroke.Thickness = 1
    stroke.Color = default and Color3.fromRGB(255, 200, 80) or Color3.fromRGB(80, 55, 20)
    stroke.Transparency = 0.2

    local state = default

    local function UpdateVisual()
        btn.Text = text .. ": " .. (state and "ON" or "OFF")
        btn.BackgroundColor3 = state and Color3.fromRGB(255, 140, 0) or Color3.fromRGB(45, 30, 12)
        stroke.Color = state and Color3.fromRGB(255, 200, 80) or Color3.fromRGB(80, 55, 20)
    end

    btn.MouseButton1Click:Connect(function()
        state = not state
        UpdateVisual()
        callback(state)
    end)

    return btn
end

local function SectionLabel(parent, yPos, text)
    local label = Instance.new("TextLabel")
    label.Parent = parent
    label.Size = UDim2.new(1, -32, 0, 22)
    label.Position = UDim2.new(0, 16, 0, yPos)
    label.BackgroundTransparency = 1
    label.Text = text
    label.Font = Enum.Font.Code
    label.TextSize = 13
    label.TextColor3 = Color3.fromRGB(255, 180, 60)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.ZIndex = 6
    return label
end

-- Aimbot tab content
local ay = 10
SectionLabel(AimbotContent, ay, "AIMBOT SETTINGS")
ay += 26

CreateToggle(AimbotContent, ay, "Aimbot", Settings.Aimbot, function(val)
    Settings.Aimbot = val
end)
ay += 46

CreateToggle(AimbotContent, ay, "Visible Only", Settings.VisibleOnly, function(val)
    Settings.VisibleOnly = val
end)
ay += 46

CreateToggle(AimbotContent, ay, "Team Check", Settings.TeamCheck, function(val)
    Settings.TeamCheck = val
end)
ay += 46

CreateToggle(AimbotContent, ay, "Target Bots", Settings.TargetBots, function(val)
    Settings.TargetBots = val
end)
ay += 52

-- FOV
local FOVLabel = Instance.new("TextLabel")
FOVLabel.Parent = AimbotContent
FOVLabel.Size = UDim2.new(1, -32, 0, 20)
FOVLabel.Position = UDim2.new(0, 16, 0, ay)
FOVLabel.BackgroundTransparency = 1
FOVLabel.Text = "FOV: " .. Settings.FOV
FOVLabel.Font = Enum.Font.Code
FOVLabel.TextSize = 12
FOVLabel.TextColor3 = Color3.fromRGB(255, 180, 60)
FOVLabel.TextXAlignment = Enum.TextXAlignment.Center
FOVLabel.ZIndex = 6

ay += 24

local FOVMinus = Instance.new("TextButton")
FOVMinus.Parent = AimbotContent
FOVMinus.Size = UDim2.new(0.5, -20, 0, 32)
FOVMinus.Position = UDim2.new(0, 16, 0, ay)
FOVMinus.BackgroundColor3 = Color3.fromRGB(80, 50, 15)
FOVMinus.BorderSizePixel = 0
FOVMinus.Text = "-"
FOVMinus.Font = Enum.Font.Code
FOVMinus.TextSize = 18
FOVMinus.TextColor3 = Color3.fromRGB(255, 255, 255)
FOVMinus.AutoButtonColor = false
FOVMinus.ZIndex = 6

local FOVMinusCorner = Instance.new("UICorner")
FOVMinusCorner.CornerRadius = UDim.new(0, 8)
FOVMinusCorner.Parent = FOVMinus

local FOVPlus = Instance.new("TextButton")
FOVPlus.Parent = AimbotContent
FOVPlus.Size = UDim2.new(0.5, -20, 0, 32)
FOVPlus.Position = UDim2.new(0.5, 4, 0, ay)
FOVPlus.BackgroundColor3 = Color3.fromRGB(80, 50, 15)
FOVPlus.BorderSizePixel = 0
FOVPlus.Text = "+"
FOVPlus.Font = Enum.Font.Code
FOVPlus.TextSize = 18
FOVPlus.TextColor3 = Color3.fromRGB(255, 255, 255)
FOVPlus.AutoButtonColor = false
FOVPlus.ZIndex = 6

local FOVPlusCorner = Instance.new("UICorner")
FOVPlusCorner.CornerRadius = UDim.new(0, 8)
FOVPlusCorner.Parent = FOVPlus

FOVMinus.MouseButton1Click:Connect(function()
    Settings.FOV = math.max(50, Settings.FOV - 25)
    FOVLabel.Text = "FOV: " .. Settings.FOV
end)

FOVPlus.MouseButton1Click:Connect(function()
    Settings.FOV = math.min(800, Settings.FOV + 25)
    FOVLabel.Text = "FOV: " .. Settings.FOV
end)

-- ESP tab content
local ey = 10
SectionLabel(ESPContent, ey, "ESP SETTINGS")
ey += 26

CreateToggle(ESPContent, ey, "ESP", Settings.ESP, function(val)
    Settings.ESP = val
    UpdateESPAll()
end)
ey += 46

CreateToggle(ESPContent, ey, "ESP Box", Settings.ESP_Box, function(val)
    Settings.ESP_Box = val
    UpdateESPAll()
end)
ey += 46

CreateToggle(ESPContent, ey, "ESP Name", Settings.ESP_Name, function(val)
    Settings.ESP_Name = val
    UpdateESPAll()
end)
ey += 46

CreateToggle(ESPContent, ey, "ESP Health", Settings.ESP_HealthBar, function(val)
    Settings.ESP_HealthBar = val
    UpdateESPAll()
end)

-- Particles (sadece menü açıkken görünür)
local ParticleList = {}
local function SpawnParticle()
    if not MenuFrame.Visible then return end
    local size = math.random(4, 8)
    local particle = Instance.new("Frame")
    particle.Parent = ParticleContainer
    particle.Size = UDim2.new(0, size, 0, size)
    particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
    particle.BackgroundColor3 = Color3.fromRGB(255, math.random(140, 220), 0)
    particle.BorderSizePixel = 0
    particle.ZIndex = 1

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = particle

    local goalX = math.random()
    local goalY = math.random()
    local tween = TweenService:Create(particle, TweenInfo.new(math.random(2, 4), Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true), {Position = UDim2.new(goalX, 0, goalY, 0)})
    tween:Play()

    ParticleList[#ParticleList + 1] = {frame = particle, tween = tween}
end

-- Spawn limited particles
for i = 1, 12 do
    SpawnParticle()
end

-- Menu toggle
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.Insert then
        local shouldOpen = not MenuFrame.Visible
        MenuFrame.Visible = shouldOpen
        Overlay.Visible = shouldOpen
        UserInputService.MouseIconEnabled = shouldOpen
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    MenuFrame.Visible = false
    Overlay.Visible = false
    UserInputService.MouseIconEnabled = false
end)

Overlay.MouseButton1Click:Connect(function()
    MenuFrame.Visible = false
    Overlay.Visible = false
    UserInputService.MouseIconEnabled = false
end)

-- [[ TEAM DETECTION ]] (aynı)
local function GetPlayerTeamKey(player)
    local key = nil
    pcall(function()
        if player.Team then key = player.Team.Name end
    end)
    if not key then pcall(function()
        if player:GetAttribute("Team") then key = player:GetAttribute("Team") end
    end) end
    if not key then pcall(function()
        if player:GetAttribute("TeamColor") then key = player:GetAttribute("TeamColor") end
    end) end
    if not key and player.Character then
        pcall(function()
            local team = player.Character:FindFirstChild("Team")
            if team and team:IsA("StringValue") then key = team.Value end
        end)
    end
    if not key and player.Character then
        pcall(function()
            if player.Character:GetAttribute("Team") then key = player.Character:GetAttribute("Team") end
        end)
    end
    if not key and player.Character then
        pcall(function()
            if player.Character:GetAttribute("TeamColor") then key = player.Character:GetAttribute("TeamColor") end
        end)
    end
    return key and tostring(key):lower() or nil
end

local function GetModelTeamKey(model)
    for _, p in pairs(Players:GetPlayers()) do
        if p.Character == model and p ~= LocalPlayer then
            return GetPlayerTeamKey(p)
        end
    end

    local key = nil
    pcall(function()
        if model:GetAttribute("Team") then key = model:GetAttribute("Team") end
    end)
    if not key then pcall(function()
        if model:GetAttribute("TeamColor") then key = model:GetAttribute("TeamColor") end
    end) end
    if not key then pcall(function()
        local team = model:FindFirstChild("Team")
        if team and team:IsA("StringValue") then key = team.Value end
    end) end
    if not key then pcall(function()
        local team = model:FindFirstChild("Team")
        if team and team:IsA("Folder") then key = team.Name end
    end) end

    if not key then
        local parent = model.Parent
        while parent do
            local n = parent.Name:lower()
            if n:find("red") or n:find("blue") or n:find("green") or n:find("yellow") or n:find("team") then
                key = parent.Name
                break
            end
            parent = parent.Parent
        end
    end

    if not key then
        local n = model.Name:lower()
        for _, color in pairs({"red", "blue", "green", "yellow", "purple", "orange"}) do
            if n:find(color) then key = color break end
        end
    end

    return key and tostring(key):lower() or nil
end

local function GetLocalTeamKey()
    local key = GetPlayerTeamKey(LocalPlayer)
    if not key and LocalPlayer.Character then
        key = GetModelTeamKey(LocalPlayer.Character)
    end
    return key and tostring(key):lower() or nil
end

local function IsSameTeamModel(model)
    if not Settings.TeamCheck then return false end
    local localKey = GetLocalTeamKey()
    if not localKey then return false end
    local modelKey = GetModelTeamKey(model)
    if not modelKey then return false end
    return localKey == modelKey
end

-- [[ CACHED TARGETS ]] (aynı)
local CachedTargets = {}

local function RefreshTargets()
    local newCache = {}

    local function addModel(model, name)
        if model == LocalPlayer.Character then return end
        if not model:FindFirstChild("Head") then return end
        local humanoid = model:FindFirstChild("Humanoid")
        if not humanoid or humanoid.Health <= 0 then return end
        if IsSameTeamModel(model) then return end

        for _, p in pairs(Players:GetPlayers()) do
            if p.Character == model and p ~= LocalPlayer then
                if Settings.TeamCheck then
                    if p.Team and LocalPlayer.Team and p.Team == LocalPlayer.Team then
                        return
                    end
                end
                break
            end
        end

        table.insert(newCache, {model = model, name = name or model.Name})
    end

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            addModel(player.Character, player.Name)
        end
    end

    if Settings.TargetBots then
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("Model") and obj ~= LocalPlayer.Character then
                if obj:FindFirstChild("Humanoid") and obj:FindFirstChild("Head") and obj:FindFirstChild("HumanoidRootPart") then
                    local isPlayer = false
                    for _, p in pairs(Players:GetPlayers()) do
                        if p.Character == obj then isPlayer = true break end
                    end
                    if not isPlayer then
                        addModel(obj, obj.Name)
                    end
                end
            end
        end
    end

    CachedTargets = newCache
end

RefreshTargets()

task.spawn(function()
    while true do
        task.wait(3)
        pcall(RefreshTargets)
    end
end)

-- [[ ESP ]] (aynı)
local ESPObjects = {}

local function ClearESP()
    for _, objs in pairs(ESPObjects) do
        for _, v in pairs(objs) do
            pcall(function() v:Destroy() end)
        end
    end
    table.clear(ESPObjects)
end

local function RemoveESP(model)
    if ESPObjects[model] then
        for _, v in pairs(ESPObjects[model]) do
            pcall(function() v:Destroy() end)
        end
        ESPObjects[model] = nil
    end
end

local function CreateESP(entry)
    local model = entry.model
    local name = entry.name
    if not Settings.ESP then return end
    if model == LocalPlayer.Character then return end
    if ESPObjects[model] then return end

    local head = model:FindFirstChild("Head")
    if not head then return end

    local objs = {}

    if Settings.ESP_Box then
        pcall(function()
            local boxGui = Instance.new("BillboardGui")
            boxGui.Parent = model
            boxGui.Adornee = head
            boxGui.Size = UDim2.new(0, 60, 0, 80)
            boxGui.StudsOffset = Vector3.new(0, 1, 0)
            boxGui.AlwaysOnTop = true
            boxGui.MaxDistance = Settings.MaxDistance

            local boxFrame = Instance.new("Frame")
            boxFrame.Parent = boxGui
            boxFrame.Size = UDim2.new(1, 0, 1, 0)
            boxFrame.BackgroundColor3 = Color3.fromRGB(160, 80, 255)
            boxFrame.BackgroundTransparency = 0.85
            boxFrame.BorderColor3 = Color3.fromRGB(255, 255, 255)
            boxFrame.BorderSizePixel = 1

            table.insert(objs, boxGui)
        end)
    end

    if Settings.ESP_Name then
        pcall(function()
            local billboard = Instance.new("BillboardGui")
            billboard.Parent = model
            billboard.Adornee = head
            billboard.Size = UDim2.new(0, 200, 0, 24)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = true
            billboard.MaxDistance = Settings.MaxDistance

            local nameLabel = Instance.new("TextLabel")
            nameLabel.Parent = billboard
            nameLabel.Size = UDim2.new(1, 0, 1, 0)
            nameLabel.BackgroundTransparency = 1
            nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            nameLabel.TextStrokeTransparency = 0.3
            nameLabel.Font = Enum.Font.SourceSansBold
            nameLabel.TextSize = 13
            nameLabel.Text = name or "Bot"
            table.insert(objs, billboard)
        end)
    end

    if Settings.ESP_HealthBar then
        pcall(function()
            local humanoid = model:FindFirstChild("Humanoid")
            if not humanoid then return end
            local healthGui = Instance.new("BillboardGui")
            healthGui.Parent = model
            healthGui.Adornee = head
            healthGui.Size = UDim2.new(0, 40, 0, 6)
            healthGui.StudsOffset = Vector3.new(0, 3.5, 0)
            healthGui.AlwaysOnTop = true
            healthGui.MaxDistance = Settings.MaxDistance

            local healthBg = Instance.new("Frame")
            healthBg.Parent = healthGui
            healthBg.Size = UDim2.new(1, 0, 1, 0)
            healthBg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            healthBg.BorderSizePixel = 0

            local healthFill = Instance.new("Frame")
            healthFill.Parent = healthBg
            healthFill.Size = UDim2.new(1, 0, 1, 0)
            healthFill.BackgroundColor3 = Color3.fromRGB(120, 255, 120)
            healthFill.BorderSizePixel = 0

            humanoid.HealthChanged:Connect(function()
                healthFill.Size = UDim2.new(math.clamp(humanoid.Health / humanoid.MaxHealth, 0, 1), 0, 1, 0)
                healthFill.BackgroundColor3 = Color3.fromHSV(math.clamp(humanoid.Health / humanoid.MaxHealth, 0, 1) * 0.33, 1, 1)
            end)

            table.insert(objs, healthGui)
        end)
    end

    ESPObjects[model] = objs
end

function UpdateESPAll()
    ClearESP()
    if not Settings.ESP then return end
    for _, entry in pairs(CachedTargets) do
        CreateESP(entry)
    end
end

UpdateESPAll()

Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        player.CharacterAdded:Connect(function(char)
            task.wait(0.5)
            pcall(RefreshTargets)
            pcall(UpdateESPAll)
        end)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if player.Character then
        RemoveESP(player.Character)
    end
end)

-- [[ AIMBOT ]] (aynı)
local function GetNearestTarget()
    local nearest = nil
    local nearestDist = math.huge
    local screenCenter = Camera.ViewportSize / 2

    for _, entry in pairs(CachedTargets) do
        local model = entry.model
        local head = model:FindFirstChild("Head")
        if head then
            local screenPos, onScreen = Camera:WorldToScreenPoint(head.Position)
            if onScreen then
                local dist = (Vector2.new(screenPos.X, screenPos.Y) - screenCenter).Magnitude
                if dist < nearestDist and dist < Settings.FOV then
                    nearestDist = dist
                    nearest = model
                end
            end
        end
    end
    return nearest
end

RunService.RenderStepped:Connect(function()
    if Settings.Aimbot and UserInputService:IsMouseButtonPressed(Settings.AimbotKey) then
        local target = GetNearestTarget()
        if target then
            local head = target:FindFirstChild("Head")
            if head then
                local camPos = Camera.CFrame.Position
                local lookAt = CFrame.lookAt(camPos, head.Position)
                if Settings.Smoothness > 1 then
                    Camera.CFrame = Camera.CFrame:Lerp(lookAt, 1 / Settings.Smoothness)
                else
                    Camera.CFrame = lookAt
                end
            end
        end
    end
end)