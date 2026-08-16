-- FAVEX PREMIUM - DÜZ KEY + HUD
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera or workspace:WaitForChild("Camera")

local KeyGui = Instance.new("ScreenGui")
KeyGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local KeyFrame = Instance.new("Frame")
KeyFrame.Parent = KeyGui
KeyFrame.AnchorPoint = Vector2.new(0.5, 0.5)
KeyFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
KeyFrame.Size = UDim2.new(0, 320, 0, 190)
KeyFrame.BackgroundColor3 = Color3.fromRGB(25, 12, 42)

local KFCorner = Instance.new("UICorner")
KFCorner.CornerRadius = UDim.new(0, 12)
KFCorner.Parent = KeyFrame

local KFTitle = Instance.new("TextLabel")
KFTitle.Parent = KeyFrame
KFTitle.Position = UDim2.new(0, 10, 0, 10)
KFTitle.Size = UDim2.new(1, -20, 0, 30)
KFTitle.BackgroundTransparency = 1
KFTitle.Text = "FAVEX PREMIUM"
KFTitle.Font = Enum.Font.GothamBlack
KFTitle.TextSize = 22
KFTitle.TextColor3 = Color3.fromRGB(200, 80, 255)
KFTitle.TextXAlignment = Enum.TextXAlignment.Center

local KeyInput = Instance.new("TextBox")
KeyInput.Parent = KeyFrame
KeyInput.Position = UDim2.new(0, 30, 0, 60)
KeyInput.Size = UDim2.new(1, -60, 0, 38)
KeyInput.BackgroundColor3 = Color3.fromRGB(35, 20, 55)
KeyInput.BorderSizePixel = 0
KeyInput.PlaceholderText = "Key..."
KeyInput.Text = ""
KeyInput.Font = Enum.Font.Code
KeyInput.TextSize = 14
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 8)
KeyCorner.Parent = KeyInput

local KeyBtn = Instance.new("TextButton")
KeyBtn.Parent = KeyFrame
KeyBtn.Position = UDim2.new(0, 30, 0, 110)
KeyBtn.Size = UDim2.new(1, -60, 0, 38)
KeyBtn.BackgroundColor3 = Color3.fromRGB(180, 60, 255)
KeyBtn.BorderSizePixel = 0
KeyBtn.Text = "VERIFY"
KeyBtn.Font = Enum.Font.GothamBold
KeyBtn.TextSize = 16
KeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

local KeyBtnCorner = Instance.new("UICorner")
KeyBtnCorner.CornerRadius = UDim.new(0, 8)
KeyBtnCorner.Parent = KeyBtn

local KeyStatus = Instance.new("TextLabel")
KeyStatus.Parent = KeyFrame
KeyStatus.Position = UDim2.new(0, 20, 0, 158)
KeyStatus.Size = UDim2.new(1, -40, 0, 20)
KeyStatus.BackgroundTransparency = 1
KeyStatus.Text = ""
KeyStatus.Font = Enum.Font.Code
KeyStatus.TextSize = 11
KeyStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
KeyStatus.TextXAlignment = Enum.TextXAlignment.Center

local function TryKey()
    if KeyInput.Text == "favex2026" then
        KeyGui:Destroy()
        StartCheat()
    else
        KeyStatus.Text = "Invalid license key."
    end
end

KeyBtn.MouseButton1Click:Connect(TryKey)

function StartCheat()
    local Settings = {
        Aimbot = true,
        AimbotKey = Enum.UserInputType.MouseButton2,
        FOV = 400,
        Smoothness = 1,
        TeamCheck = true,
        TargetBots = true,
        ESP = true,
        ESP_Box = true,
        ESP_Name = true,
        ESP_HealthBar = true,
        MaxDistance = 3000,
    }

    -- WATERMARK
    local WatermarkGui = Instance.new("ScreenGui")
    WatermarkGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    WatermarkGui.ResetOnSpawn = false
    WatermarkGui.IgnoreGuiInset = true

    local WmLabel = Instance.new("TextLabel")
    WmLabel.Parent = WatermarkGui
    WmLabel.Position = UDim2.new(0, 12, 0, 20)
    WmLabel.Size = UDim2.new(0, 160, 0, 18)
    WmLabel.BackgroundTransparency = 1
    WmLabel.Text = "FAVEX PREMIUM"
    WmLabel.Font = Enum.Font.Code
    WmLabel.TextSize = 13
    WmLabel.TextColor3 = Color3.fromRGB(200, 80, 255)
    WmLabel.TextStrokeColor3 = Color3.fromRGB(100, 30, 180)
    WmLabel.TextStrokeTransparency = 0.3
    WmLabel.TextXAlignment = Enum.TextXAlignment.Left

    -- HUD
    local HudGui = Instance.new("ScreenGui")
    HudGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    HudGui.ResetOnSpawn = false
    HudGui.IgnoreGuiInset = true

    local HudOverlay = Instance.new("TextButton")
    HudOverlay.Parent = HudGui
    HudOverlay.Size = UDim2.new(1, 0, 1, 0)
    HudOverlay.Position = UDim2.new(0, 0, 0, 0)
    HudOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    HudOverlay.BackgroundTransparency = 0.4
    HudOverlay.BorderSizePixel = 0
    HudOverlay.Text = ""
    HudOverlay.Visible = false

    local HudFrame = Instance.new("Frame")
    HudFrame.Parent = HudGui
    HudFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    HudFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    HudFrame.Size = UDim2.new(0, 320, 0, 360)
    HudFrame.BackgroundColor3 = Color3.fromRGB(25, 12, 42)
    HudFrame.BorderSizePixel = 0
    HudFrame.Visible = false

    local HudCorner = Instance.new("UICorner")
    HudCorner.CornerRadius = UDim.new(0, 12)
    HudCorner.Parent = HudFrame

    local HudStroke = Instance.new("UIStroke")
    HudStroke.Parent = HudFrame
    HudStroke.Thickness = 1.5
    HudStroke.Color = Color3.fromRGB(200, 80, 255)
    HudStroke.Transparency = 0.2

    local HudTitle = Instance.new("TextLabel")
    HudTitle.Parent = HudFrame
    HudTitle.Position = UDim2.new(0, 0, 0, 10)
    HudTitle.Size = UDim2.new(1, 0, 0, 30)
    HudTitle.BackgroundTransparency = 1
    HudTitle.Text = "FAVEX PREMIUM"
    HudTitle.Font = Enum.Font.GothamBlack
    HudTitle.TextSize = 20
    HudTitle.TextColor3 = Color3.fromRGB(200, 80, 255)
    HudTitle.TextXAlignment = Enum.TextXAlignment.Center

    local function CreateToggle(parent, yPos, text, default, callback)
        local btn = Instance.new("TextButton")
        btn.Parent = parent
        btn.Size = UDim2.new(1, -40, 0, 34)
        btn.Position = UDim2.new(0, 20, 0, yPos)
        btn.BackgroundColor3 = default and Color3.fromRGB(100, 40, 180) or Color3.fromRGB(40, 25, 60)
        btn.BorderSizePixel = 0
        btn.Text = text .. ": " .. (default and "ON" or "OFF")
        btn.Font = Enum.Font.Code
        btn.TextSize = 13
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.AutoButtonColor = false

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 7)
        corner.Parent = btn

        btn.MouseButton1Click:Connect(function()
            default = not default
            btn.Text = text .. ": " .. (default and "ON" or "OFF")
            btn.BackgroundColor3 = default and Color3.fromRGB(100, 40, 180) or Color3.fromRGB(40, 25, 60)
            callback(default)
        end)

        return btn
    end

    local y = 50
    CreateToggle(HudFrame, y, "Aimbot", Settings.Aimbot, function(v) Settings.Aimbot = v end)
    y += 40
    CreateToggle(HudFrame, y, "ESP", Settings.ESP, function(v) Settings.ESP = v UpdateESPAll() end)
    y += 40
    CreateToggle(HudFrame, y, "ESP Box", Settings.ESP_Box, function(v) Settings.ESP_Box = v UpdateESPAll() end)
    y += 40
    CreateToggle(HudFrame, y, "ESP Name", Settings.ESP_Name, function(v) Settings.ESP_Name = v UpdateESPAll() end)
    y += 40
    CreateToggle(HudFrame, y, "ESP Health", Settings.ESP_HealthBar, function(v) Settings.ESP_HealthBar = v UpdateESPAll() end)
    y += 40
    CreateToggle(HudFrame, y, "Team Check", Settings.TeamCheck, function(v) Settings.TeamCheck = v pcall(RefreshTargets) end)
    y += 40
    CreateToggle(HudFrame, y, "Target Bots", Settings.TargetBots, function(v) Settings.TargetBots = v pcall(RefreshTargets) end)
    y += 50

    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Parent = HudFrame
    CloseBtn.Position = UDim2.new(0, 20, 0, y)
    CloseBtn.Size = UDim2.new(1, -40, 0, 34)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(180, 60, 255)
    CloseBtn.BorderSizePixel = 0
    CloseBtn.Text = "CLOSE"
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 14
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.AutoButtonColor = false

    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 7)
    CloseCorner.Parent = CloseBtn

    CloseBtn.MouseButton1Click:Connect(function()
        HudFrame.Visible = false
        HudOverlay.Visible = false
    end)

    HudOverlay.MouseButton1Click:Connect(function()
        HudFrame.Visible = false
        HudOverlay.Visible = false
    end)

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if input.KeyCode == Enum.KeyCode.Insert then
            local shouldOpen = not HudFrame.Visible
            HudFrame.Visible = shouldOpen
            HudOverlay.Visible = shouldOpen
        end
    end)

    -- TARGET + ESP + AIMBOT
    local CachedTargets = {}
    local ESPObjects = {}

    local function GetPlayerTeamKey(player)
        local key = nil
        pcall(function()
            if player.Team then key = player.Team.Name end
        end)
        if not key then pcall(function()
            if player:GetAttribute("Team") then key = player:GetAttribute("Team") end
        end) end
        if not key and player.Character then
            pcall(function()
                local team = player.Character:FindFirstChild("Team")
                if team and team:IsA("StringValue") then key = team.Value end
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

        return key and tostring(key):lower() or nil
    end

    local function IsSameTeamModel(model)
        if not Settings.TeamCheck then return false end
        local localKey = GetPlayerTeamKey(LocalPlayer)
        if not localKey and LocalPlayer.Character then
            localKey = GetModelTeamKey(LocalPlayer.Character)
        end
        local modelKey = GetModelTeamKey(model)
        if not localKey or not modelKey then return false end
        return localKey == modelKey
    end

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

    local function ClearESP()
        for _, objs in pairs(ESPObjects) do
            for _, v in pairs(objs) do
                pcall(function() v:Destroy() end)
            end
        end
        table.clear(ESPObjects)
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
                boxFrame.BackgroundColor3 = Color3.fromRGB(200, 80, 255)
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

    pcall(RefreshTargets)
    pcall(UpdateESPAll)

    task.spawn(function()
        while true do
            task.wait(3)
            pcall(RefreshTargets)
            pcall(UpdateESPAll)
        end
    end)

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
end