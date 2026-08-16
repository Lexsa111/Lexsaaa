-- Favex Premium | HyperShot
-- Key: hidden license gate
-- INSERT ile menü, sağ tık aimbot

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera or workspace:WaitForChild("Camera")

-- [[ KEY SYSTEM ]] --
local realKey = "6202xevaf" -- reversed: favex2026

local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "FavexKeyGate"
KeyGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
KeyGui.ResetOnSpawn = false
KeyGui.IgnoreGuiInset = true

local KeyOverlay = Instance.new("Frame")
KeyOverlay.Parent = KeyGui
KeyOverlay.Size = UDim2.new(1, 0, 1, 0)
KeyOverlay.Position = UDim2.new(0, 0, 0, 0)
KeyOverlay.BackgroundColor3 = Color3.fromRGB(10, 5, 20)
KeyOverlay.BackgroundTransparency = 0.2
KeyOverlay.BorderSizePixel = 0
KeyOverlay.ZIndex = 1

local KeyFrame = Instance.new("Frame")
KeyFrame.Parent = KeyGui
KeyFrame.AnchorPoint = Vector2.new(0.5, 0.5)
KeyFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
KeyFrame.Size = UDim2.new(0, 360, 0, 220)
KeyFrame.BackgroundColor3 = Color3.fromRGB(25, 12, 42)
KeyFrame.BorderSizePixel = 0
KeyFrame.ZIndex = 2

local KF_Corner = Instance.new("UICorner")
KF_Corner.CornerRadius = UDim.new(0, 14)
KF_Corner.Parent = KeyFrame

local KF_Stroke = Instance.new("UIStroke")
KF_Stroke.Parent = KeyFrame
KF_Stroke.Thickness = 2
KF_Stroke.Color = Color3.fromRGB(200, 80, 255)
KF_Stroke.Transparency = 0.2

local KeyBanner = Instance.new("Frame")
KeyBanner.Parent = KeyFrame
KeyBanner.Size = UDim2.new(1, 0, 0, 50)
KeyBanner.Position = UDim2.new(0, 0, 0, 0)
KeyBanner.BackgroundColor3 = Color3.fromRGB(60, 25, 100)
KeyBanner.BorderSizePixel = 0

local KeyBannerCorner = Instance.new("UICorner")
KeyBannerCorner.CornerRadius = UDim.new(0, 14)
KeyBannerCorner.Parent = KeyBanner

local KeyBannerBottom = Instance.new("Frame")
KeyBannerBottom.Parent = KeyBanner
KeyBannerBottom.Size = UDim2.new(1, 0, 0, 8)
KeyBannerBottom.Position = UDim2.new(0, 0, 1, -8)
KeyBannerBottom.BackgroundColor3 = KeyBanner.BackgroundColor3
KeyBannerBottom.BorderSizePixel = 0

local KeyBannerGradient = Instance.new("UIGradient")
KeyBannerGradient.Parent = KeyBanner
KeyBannerGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 80, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 25, 150)),
})
KeyBannerGradient.Rotation = 90

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Parent = KeyBanner
KeyTitle.Size = UDim2.new(1, 0, 1, 0)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Text = "FAVEX PREMIUM"
KeyTitle.Font = Enum.Font.GothamBlack
KeyTitle.TextSize = 22
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.TextXAlignment = Enum.TextXAlignment.Center

local KeySub = Instance.new("TextLabel")
KeySub.Parent = KeyFrame
KeySub.Position = UDim2.new(0, 20, 0, 62)
KeySub.Size = UDim2.new(1, -40, 0, 20)
KeySub.BackgroundTransparency = 1
KeySub.Text = "LICENSE VERIFICATION"
KeySub.Font = Enum.Font.Code
KeySub.TextSize = 11
KeySub.TextColor3 = Color3.fromRGB(200, 160, 255)
KeySub.TextXAlignment = Enum.TextXAlignment.Center

local KeyInput = Instance.new("TextBox")
KeyInput.Parent = KeyFrame
KeyInput.Position = UDim2.new(0, 30, 0, 90)
KeyInput.Size = UDim2.new(1, -60, 0, 38)
KeyInput.BackgroundColor3 = Color3.fromRGB(35, 20, 55)
KeyInput.BorderSizePixel = 0
KeyInput.PlaceholderText = "Enter license key..."
KeyInput.Text = ""
KeyInput.Font = Enum.Font.Code
KeyInput.TextSize = 14
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.ZIndex = 3

local KI_Corner = Instance.new("UICorner")
KI_Corner.CornerRadius = UDim.new(0, 8)
KI_Corner.Parent = KeyInput

local KI_Stroke = Instance.new("UIStroke")
KI_Stroke.Parent = KeyInput
KI_Stroke.Thickness = 1
KI_Stroke.Color = Color3.fromRGB(200, 80, 255)
KI_Stroke.Transparency = 0.4

local KeyButton = Instance.new("TextButton")
KeyButton.Parent = KeyFrame
KeyButton.Position = UDim2.new(0, 30, 0, 140)
KeyButton.Size = UDim2.new(1, -60, 0, 38)
KeyButton.BackgroundColor3 = Color3.fromRGB(180, 60, 255)
KeyButton.BorderSizePixel = 0
KeyButton.Text = "VERIFY"
KeyButton.Font = Enum.Font.GothamBold
KeyButton.TextSize = 16
KeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyButton.AutoButtonColor = false
KeyButton.ZIndex = 3

local KB_Corner = Instance.new("UICorner")
KB_Corner.CornerRadius = UDim.new(0, 8)
KB_Corner.Parent = KeyButton

local KeyStatus = Instance.new("TextLabel")
KeyStatus.Parent = KeyFrame
KeyStatus.Position = UDim2.new(0, 20, 0, 186)
KeyStatus.Size = UDim2.new(1, -40, 0, 20)
KeyStatus.BackgroundTransparency = 1
KeyStatus.Text = ""
KeyStatus.Font = Enum.Font.Code
KeyStatus.TextSize = 11
KeyStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
KeyStatus.TextXAlignment = Enum.TextXAlignment.Center
KeyStatus.ZIndex = 3

local function reverse(s)
    return s:reverse()
end

local function TryKey()
    if reverse(KeyInput.Text) == reverse(realKey) then
        KeyStatus.Text = "License active."
        KeyStatus.TextColor3 = Color3.fromRGB(120, 255, 120)
        task.wait(0.4)
        KeyGui:Destroy()
        StartCheat()
    else
        KeyStatus.Text = "Invalid license key."
        KeyStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end

KeyButton.MouseButton1Click:Connect(TryKey)
KeyInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then TryKey() end
end)

-- [[ MAIN CHEAT ]] --
function StartCheat()
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
        ShowFOV = false,
        Watermark = true,
    }

    -- [[ WATERMARK - FAVEX PREMIUM ]] --
    local WatermarkGui = Instance.new("ScreenGui")
    WatermarkGui.Name = "FavexWatermark"
    WatermarkGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    WatermarkGui.ResetOnSpawn = false
    WatermarkGui.IgnoreGuiInset = true

    local WmBanner = Instance.new("Frame")
    WmBanner.Parent = WatermarkGui
    WmBanner.AnchorPoint = Vector2.new(0.5, 0)
    WmBanner.Position = UDim2.new(0.5, 0, 0, 8)
    WmBanner.Size = UDim2.new(0.7, 0, 0, 85)
    WmBanner.BackgroundColor3 = Color3.fromRGB(25, 10, 45)
    WmBanner.BorderSizePixel = 0

    local WmCorner = Instance.new("UICorner")
    WmCorner.CornerRadius = UDim.new(0, 16)
    WmCorner.Parent = WmBanner

    local WmStroke = Instance.new("UIStroke")
    WmStroke.Parent = WmBanner
    WmStroke.Thickness = 2
    WmStroke.Color = Color3.fromRGB(200, 80, 255)
    WmStroke.Transparency = 0.2

    local WmGradient = Instance.new("UIGradient")
    WmGradient.Parent = WmBanner
    WmGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(160, 50, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(80, 20, 160)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(160, 50, 255)),
    })
    WmGradient.Rotation = 0

    local WmLogo = Instance.new("ImageLabel")
    WmLogo.Parent = WmBanner
    WmLogo.AnchorPoint = Vector2.new(0, 0.5)
    WmLogo.Position = UDim2.new(0, 12, 0.5, 0)
    WmLogo.Size = UDim2.new(0, 60, 0, 60)
    WmLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    WmLogo.BackgroundTransparency = 1
    WmLogo.Image = "rbxassetid://129547721505622"

    local WmLogoCorner = Instance.new("UICorner")
    WmLogoCorner.CornerRadius = UDim.new(0, 12)
    WmLogoCorner.Parent = WmLogo

    local WmTitle = Instance.new("TextLabel")
    WmTitle.Parent = WmBanner
    WmTitle.Position = UDim2.new(0, 80, 0, 12)
    WmTitle.Size = UDim2.new(1, -160, 0, 36)
    WmTitle.BackgroundTransparency = 1
    WmTitle.Text = "FAVEX PREMIUM"
    WmTitle.Font = Enum.Font.GothamBlack
    WmTitle.TextSize = 30
    WmTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    WmTitle.TextStrokeColor3 = Color3.fromRGB(140, 40, 220)
    WmTitle.TextStrokeTransparency = 0.4
    WmTitle.TextXAlignment = Enum.TextXAlignment.Left

    local WmLicense = Instance.new("TextLabel")
    WmLicense.Parent = WmBanner
    WmLicense.Position = UDim2.new(0, 80, 0, 48)
    WmLicense.Size = UDim2.new(1, -160, 0, 18)
    WmLicense.BackgroundTransparency = 1
    WmLicense.Text = "LICENSE: ACTIVE | HYPERSHOT EDITION"
    WmLicense.Font = Enum.Font.Code
    WmLicense.TextSize = 11
    WmLicense.TextColor3 = Color3.fromRGB(120, 255, 120)
    WmLicense.TextXAlignment = Enum.TextXAlignment.Left

    local WmUser = Instance.new("TextLabel")
    WmUser.Parent = WmBanner
    WmUser.Position = UDim2.new(0, 80, 0, 64)
    WmUser.Size = UDim2.new(1, -160, 0, 14)
    WmUser.BackgroundTransparency = 1
    WmUser.Text = "WELCOME: " .. LocalPlayer.Name
    WmUser.Font = Enum.Font.Code
    WmUser.TextSize = 9
    WmUser.TextColor3 = Color3.fromRGB(200, 160, 255)
    WmUser.TextXAlignment = Enum.TextXAlignment.Left

    local WmSideGlow = Instance.new("Frame")
    WmSideGlow.Parent = WmBanner
    WmSideGlow.AnchorPoint = Vector2.new(1, 0.5)
    WmSideGlow.Position = UDim2.new(1, -16, 0.5, 0)
    WmSideGlow.Size = UDim2.new(0, 3, 0, 55)
    WmSideGlow.BackgroundColor3 = Color3.fromRGB(200, 80, 255)
    WmSideGlow.BorderSizePixel = 0

    -- [[ MENU - SEKMELİ ]] --
    local MenuScreen = Instance.new("ScreenGui")
    MenuScreen.Name = "FavexMenu"
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
    MenuFrame.Size = UDim2.new(0, 400, 0, 500)
    MenuFrame.BackgroundColor3 = Color3.fromRGB(25, 12, 42)
    MenuFrame.BorderSizePixel = 0
    MenuFrame.ZIndex = 2
    MenuFrame.Visible = false

    local MenuCorner = Instance.new("UICorner")
    MenuCorner.CornerRadius = UDim.new(0, 14)
    MenuCorner.Parent = MenuFrame

    local MenuStroke = Instance.new("UIStroke")
    MenuStroke.Parent = MenuFrame
    MenuStroke.Thickness = 2
    MenuStroke.Color = Color3.fromRGB(200, 80, 255)
    MenuStroke.Transparency = 0.2

    -- Banner
    local Banner = Instance.new("Frame")
    Banner.Parent = MenuFrame
    Banner.Size = UDim2.new(1, 0, 0, 80)
    Banner.Position = UDim2.new(0, 0, 0, 0)
    Banner.BackgroundColor3 = Color3.fromRGB(50, 20, 90)
    Banner.BorderSizePixel = 0

    local BannerCorner = Instance.new("UICorner")
    BannerCorner.CornerRadius = UDim.new(0, 14)
    BannerCorner.Parent = Banner

    local BannerBottom = Instance.new("Frame")
    BannerBottom.Parent = Banner
    BannerBottom.Size = UDim2.new(1, 0, 0, 8)
    BannerBottom.Position = UDim2.new(0, 0, 1, -8)
    BannerBottom.BackgroundColor3 = Banner.BackgroundColor3
    BannerBottom.BorderSizePixel = 0

    local BannerGradient = Instance.new("UIGradient")
    BannerGradient.Parent = Banner
    BannerGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 80, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 25, 150)),
    })
    BannerGradient.Rotation = 90

    local BannerLogo = Instance.new("ImageLabel")
    BannerLogo.Parent = Banner
    BannerLogo.Position = UDim2.new(0, 14, 0, 18)
    BannerLogo.Size = UDim2.new(0, 44, 0, 44)
    BannerLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    BannerLogo.BackgroundTransparency = 1
    BannerLogo.Image = "rbxassetid://129547721505622"

    local BannerLogoCorner = Instance.new("UICorner")
    BannerLogoCorner.CornerRadius = UDim.new(0, 10)
    BannerLogoCorner.Parent = BannerLogo

    local BannerTitle = Instance.new("TextLabel")
    BannerTitle.Parent = Banner
    BannerTitle.Position = UDim2.new(0, 66, 0, 10)
    BannerTitle.Size = UDim2.new(1, -110, 0, 30)
    BannerTitle.BackgroundTransparency = 1
    BannerTitle.Text = "FAVEX PREMIUM"
    BannerTitle.Font = Enum.Font.GothamBlack
    BannerTitle.TextSize = 22
    BannerTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    BannerTitle.TextXAlignment = Enum.TextXAlignment.Left

    local BannerSub = Instance.new("TextLabel")
    BannerSub.Parent = Banner
    BannerSub.Position = UDim2.new(0, 66, 0, 42)
    BannerSub.Size = UDim2.new(1, -110, 0, 15)
    BannerSub.BackgroundTransparency = 1
    BannerSub.Text = "HYPERSHOT EDITION"
    BannerSub.Font = Enum.Font.Code
    BannerSub.TextSize = 10
    BannerSub.TextColor3 = Color3.fromRGB(200, 160, 255)
    BannerSub.TextXAlignment = Enum.TextXAlignment.Left

    local BannerLicense = Instance.new("TextLabel")
    BannerLicense.Parent = Banner
    BannerLicense.Position = UDim2.new(0, 66, 0, 58)
    BannerLicense.Size = UDim2.new(1, -110, 0, 14)
    BannerLicense.BackgroundTransparency = 1
    BannerLicense.Text = "LICENSE: ACTIVE"
    BannerLicense.Font = Enum.Font.Code
    BannerLicense.TextSize = 9
    BannerLicense.TextColor3 = Color3.fromRGB(120, 255, 120)
    BannerLicense.TextXAlignment = Enum.TextXAlignment.Left

    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Parent = Banner
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Position = UDim2.new(1, -40, 0, 25)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(180, 60, 255)
    CloseBtn.BorderSizePixel = 0
    CloseBtn.Text = "X"
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 15
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.AutoButtonColor = false

    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 7)
    CloseCorner.Parent = CloseBtn

    CloseBtn.MouseButton1Click:Connect(function()
        MenuFrame.Visible = false
        Overlay.Visible = false
    end)

    Overlay.MouseButton1Click:Connect(function()
        MenuFrame.Visible = false
        Overlay.Visible = false
    end)

    -- Tab sistemi
    local Tabs = {}
    local TabButtons = {}
    local TabPages = {}

    local TabHolder = Instance.new("Frame")
    TabHolder.Parent = MenuFrame
    TabHolder.Position = UDim2.new(0, 0, 0, 80)
    TabHolder.Size = UDim2.new(1, 0, 0, 42)
    TabHolder.BackgroundColor3 = Color3.fromRGB(20, 10, 35)
    TabHolder.BorderSizePixel = 0

    local tabWidth = 100
    local tabNames = {"Aimbot", "ESP", "Visuals", "Misc"}

    local function CreateTab(name)
        local index = #Tabs + 1

        local btn = Instance.new("TextButton")
        btn.Parent = TabHolder
        btn.Size = UDim2.new(0, tabWidth, 0, 42)
        btn.Position = UDim2.new(0, (index - 1) * tabWidth, 0, 0)
        btn.BackgroundColor3 = Color3.fromRGB(30, 15, 50)
        btn.BorderSizePixel = 0
        btn.Text = name
        btn.Font = Enum.Font.Code
        btn.TextSize = 13
        btn.TextColor3 = Color3.fromRGB(180, 140, 220)
        btn.AutoButtonColor = false
        btn.ZIndex = 3

        local stroke = Instance.new("UIStroke")
        stroke.Parent = btn
        stroke.Thickness = 1
        stroke.Color = Color3.fromRGB(200, 80, 255)
        stroke.Transparency = 0.6

        local page = Instance.new("ScrollingFrame")
        page.Parent = MenuFrame
        page.Position = UDim2.new(0, 0, 0, 122)
        page.Size = UDim2.new(1, 0, 1, -122)
        page.BackgroundTransparency = 1
        page.BorderSizePixel = 0
        page.ScrollBarThickness = 3
        page.ScrollBarImageColor3 = Color3.fromRGB(200, 80, 255)
        page.CanvasSize = UDim2.new(0, 0, 0, 450)
        page.Visible = false
        page.ZIndex = 3

        btn.MouseButton1Click:Connect(function()
            for _, b in pairs(TabButtons) do
                b.BackgroundColor3 = Color3.fromRGB(30, 15, 50)
                b.TextColor3 = Color3.fromRGB(180, 140, 220)
                b.UIStroke.Transparency = 0.6
            end
            btn.BackgroundColor3 = Color3.fromRGB(80, 30, 160)
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            btn.UIStroke.Transparency = 0.2

            for n, p in pairs(TabPages) do
                p.Visible = (n == name)
            end
        end)

        Tabs[#Tabs + 1] = {name = name, btn = btn, page = page}
        TabButtons[#TabButtons + 1] = btn
        TabPages[name] = page

        return page
    end

    local function SelectTab(name)
        for _, tab in pairs(Tabs) do
            if tab.name == name then
                tab.btn.MouseButton1Click:Fire()
                break
            end
        end
    end

    local function CreateToggle(parent, yPos, text, default, callback)
        local btn = Instance.new("TextButton")
        btn.Parent = parent
        btn.Size = UDim2.new(1, -32, 0, 36)
        btn.Position = UDim2.new(0, 16, 0, yPos)
        btn.BackgroundColor3 = default and Color3.fromRGB(100, 40, 180) or Color3.fromRGB(40, 25, 60)
        btn.BorderSizePixel = 0
        btn.Text = text .. ": " .. (default and "ON" or "OFF")
        btn.Font = Enum.Font.Code
        btn.TextSize = 13
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.AutoButtonColor = false
        btn.ZIndex = 4

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent = btn

        local stroke = Instance.new("UIStroke")
        stroke.Parent = btn
        stroke.Thickness = 1
        stroke.Color = default and Color3.fromRGB(200, 80, 255) or Color3.fromRGB(90, 55, 140)
        stroke.Transparency = 0.2

        local function UpdateVisual()
            btn.Text = text .. ": " .. (default and "ON" or "OFF")
            btn.BackgroundColor3 = default and Color3.fromRGB(100, 40, 180) or Color3.fromRGB(40, 25, 60)
            stroke.Color = default and Color3.fromRGB(200, 80, 255) or Color3.fromRGB(90, 55, 140)
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
        label.Size = UDim2.new(1, -32, 0, 22)
        label.Position = UDim2.new(0, 16, 0, yPos)
        label.BackgroundTransparency = 1
        label.Text = text
        label.Font = Enum.Font.Code
        label.TextSize = 12
        label.TextColor3 = Color3.fromRGB(200, 80, 255)
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.ZIndex = 4
        return label
    end

    local function CreateSlider(parent, yPos, text, minVal, maxVal, default, callback)
        local label = Instance.new("TextLabel")
        label.Parent = parent
        label.Size = UDim2.new(1, -32, 0, 20)
        label.Position = UDim2.new(0, 16, 0, yPos)
        label.BackgroundTransparency = 1
        label.Text = text .. ": " .. default
        label.Font = Enum.Font.Code
        label.TextSize = 12
        label.TextColor3 = Color3.fromRGB(200, 80, 255)
        label.TextXAlignment = Enum.TextXAlignment.Center
        label.ZIndex = 4

        local minus = Instance.new("TextButton")
        minus.Parent = parent
        minus.Size = UDim2.new(0.5, -20, 0, 32)
        minus.Position = UDim2.new(0, 16, 0, yPos + 24)
        minus.BackgroundColor3 = Color3.fromRGB(60, 30, 100)
        minus.BorderSizePixel = 0
        minus.Text = "-"
        minus.Font = Enum.Font.Code
        minus.TextSize = 18
        minus.TextColor3 = Color3.fromRGB(255, 255, 255)
        minus.AutoButtonColor = false
        minus.ZIndex = 4

        local minusCorner = Instance.new("UICorner")
        minusCorner.CornerRadius = UDim.new(0, 8)
        minusCorner.Parent = minus

        local plus = Instance.new("TextButton")
        plus.Parent = parent
        plus.Size = UDim2.new(0.5, -20, 0, 32)
        plus.Position = UDim2.new(0.5, 4, 0, yPos + 24)
        plus.BackgroundColor3 = Color3.fromRGB(60, 30, 100)
        plus.BorderSizePixel = 0
        plus.Text = "+"
        plus.Font = Enum.Font.Code
        plus.TextSize = 18
        plus.TextColor3 = Color3.fromRGB(255, 255, 255)
        plus.AutoButtonColor = false
        plus.ZIndex = 4

        local plusCorner = Instance.new("UICorner")
        plusCorner.CornerRadius = UDim.new(0, 8)
        plusCorner.Parent = plus

        minus.MouseButton1Click:Connect(function()
            default = math.max(minVal, default - math.ceil((maxVal - minVal) / 20))
            label.Text = text .. ": " .. default
            callback(default)
        end)

        plus.MouseButton1Click:Connect(function()
            default = math.min(maxVal, default + math.ceil((maxVal - minVal) / 20))
            label.Text = text .. ": " .. default
            callback(default)
        end)
    end

    -- AIMBOT SEKMESİ
    local AimbotPage = CreateTab("Aimbot")
    local ay = 10

    CreateSectionLabel(AimbotPage, ay, "AIM SETTINGS")
    ay += 24

    CreateToggle(AimbotPage, ay, "Aimbot", Settings.Aimbot, function(val)
        Settings.Aimbot = val
    end)
    ay += 42

    CreateToggle(AimbotPage, ay, "Visible Only", Settings.VisibleOnly, function(val)
        Settings.VisibleOnly = val
    end)
    ay += 42

    CreateToggle(AimbotPage, ay, "Team Check", Settings.TeamCheck, function(val)
        Settings.TeamCheck = val
    end)
    ay += 42

    CreateToggle(AimbotPage, ay, "Target Bots", Settings.TargetBots, function(val)
        Settings.TargetBots = val
    end)
    ay += 48

    CreateSectionLabel(AimbotPage, ay, "FOV")
    ay += 24

    CreateSlider(AimbotPage, ay, "FOV", 50, 800, Settings.FOV, function(val)
        Settings.FOV = val
    end)
    ay += 64

    CreateSlider(AimbotPage, ay, "Smoothness", 1, 20, Settings.Smoothness, function(val)
        Settings.Smoothness = val
    end)
    ay += 64

    AimbotPage.CanvasSize = UDim2.new(0, 0, 0, ay + 40)

    -- ESP SEKMESİ
    local ESPPage = CreateTab("ESP")
    local ey = 10

    CreateSectionLabel(ESPPage, ey, "ESP SETTINGS")
    ey += 24

    CreateToggle(ESPPage, ey, "ESP", Settings.ESP, function(val)
        Settings.ESP = val
        UpdateESPAll()
    end)
    ey += 42

    CreateToggle(ESPPage, ey, "ESP Box", Settings.ESP_Box, function(val)
        Settings.ESP_Box = val
        UpdateESPAll()
    end)
    ey += 42

    CreateToggle(ESPPage, ey, "ESP Name", Settings.ESP_Name, function(val)
        Settings.ESP_Name = val
        UpdateESPAll()
    end)
    ey += 42

    CreateToggle(ESPPage, ey, "ESP Health", Settings.ESP_HealthBar, function(val)
        Settings.ESP_HealthBar = val
        UpdateESPAll()
    end)
    ey += 48

    CreateSectionLabel(ESPPage, ey, "DISTANCE")
    ey += 24

    CreateSlider(ESPPage, ey, "Max Distance", 100, 10000, Settings.MaxDistance, function(val)
        Settings.MaxDistance = val
        UpdateESPAll()
    end)
    ey += 64

    ESPPage.CanvasSize = UDim2.new(0, 0, 0, ey + 40)

    -- VISUALS SEKMESİ
    local VisualsPage = CreateTab("Visuals")
    local vy = 10

    CreateSectionLabel(VisualsPage, vy, "VISUAL SETTINGS")
    vy += 24

    CreateToggle(VisualsPage, vy, "Watermark", Settings.Watermark, function(val)
        Settings.Watermark = val
        WmBanner.Visible = val
    end)
    vy += 42

    CreateToggle(VisualsPage, vy, "Show FOV Circle", Settings.ShowFOV, function(val)
        Settings.ShowFOV = val
        -- FOV circle drawing would go here
    end)
    vy += 42

    VisualsPage.CanvasSize = UDim2.new(0, 0, 0, vy + 40)

    -- MISC SEKMESİ
    local MiscPage = CreateTab("Misc")
    local my = 10

    CreateSectionLabel(MiscPage, my, "MISC SETTINGS")
    my += 24

    local LicenseLabel = Instance.new("TextLabel")
    LicenseLabel.Parent = MiscPage
    LicenseLabel.Size = UDim2.new(1, -32, 0, 40)
    LicenseLabel.Position = UDim2.new(0, 16, 0, my)
    LicenseLabel.BackgroundTransparency = 1
    LicenseLabel.Text = "LICENSE: ACTIVE\nKEY: VERIFIED"
    LicenseLabel.Font = Enum.Font.Code
    LicenseLabel.TextSize = 12
    LicenseLabel.TextColor3 = Color3.fromRGB(120, 255, 120)
    LicenseLabel.TextXAlignment = Enum.TextXAlignment.Center
    LicenseLabel.ZIndex = 4
    my += 48

    MiscPage.CanvasSize = UDim2.new(0, 0, 0, my + 40)

    -- ilk sekmeyi aç
    SelectTab("Aimbot")

    -- [[ MENU TOGGLE ]]
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if input.KeyCode == Enum.KeyCode.Insert then
            local shouldOpen = not MenuFrame.Visible
            MenuFrame.Visible = shouldOpen
            Overlay.Visible = shouldOpen
        end
    end)

    -- [[ TEAM DETECTION ]] --
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

    -- [[ CACHED TARGETS ]] --
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

    -- [[ ESP ]] --
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

    -- [[ AIMBOT ]] --
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