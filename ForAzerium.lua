-- Ro-Exec Script | Improved UI with Animations
-- By lol_pogi & joe_, Modified by Ivan

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local AFlow = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local AFlowLabel = Instance.new("TextLabel")
local StatusLabel = Instance.new("TextLabel")
local ScriptBox = Instance.new("TextBox")
local ScriptList = Instance.new("ScrollingFrame")
local ListLabel = Instance.new("TextLabel")

local ExecuteButton = Instance.new("TextButton")
local ClearButton = Instance.new("TextButton")
local OpenFileButton = Instance.new("TextButton")
local SaveFileButton = Instance.new("TextButton")

local Attached = true -- already injected

AFlow.Name = "AFlow"
AFlow.Parent = game.CoreGui
AFlow.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = AFlow
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Size = UDim2.new(0, 600, 0, 350)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -175)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
MainFrame.BackgroundTransparency = 1
MainFrame.Size = UDim2.new(0, 0, 0, 0)

-- Rounded corners
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 15)

Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Font = Enum.Font.GothamBold
Title.Text = "Ro-Exec | v. improved"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16

AFlowLabel.Name = "AFlowLabel"
AFlowLabel.Parent = MainFrame
AFlowLabel.BackgroundTransparency = 1
AFlowLabel.Position = UDim2.new(0, 10, 0, 5)
AFlowLabel.Size = UDim2.new(0, 50, 0, 20)
AFlowLabel.Font = Enum.Font.Gotham
AFlowLabel.Text = "R-E |"
AFlowLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
AFlowLabel.TextSize = 14

-- Status Indicator (always ready)
StatusLabel.Name = "StatusLabel"
StatusLabel.Parent = MainFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 60, 0, 5)
StatusLabel.Size = UDim2.new(0, 100, 0, 20)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.Text = "🟢 ready!"
StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
StatusLabel.TextSize = 14

ScriptBox.Name = "ScriptBox"
ScriptBox.Parent = MainFrame
ScriptBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScriptBox.BorderSizePixel = 0
ScriptBox.Position = UDim2.new(0, 10, 0, 40)
ScriptBox.Size = UDim2.new(0, 400, 0, 250)
ScriptBox.Font = Enum.Font.Code
ScriptBox.Text = 'print("hello!, user")'
ScriptBox.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptBox.TextSize = 14
ScriptBox.TextXAlignment = Enum.TextXAlignment.Left
ScriptBox.TextYAlignment = Enum.TextYAlignment.Top
ScriptBox.MultiLine = true
ScriptBox.ClearTextOnFocus = false

ScriptList.Name = "ScriptList"
ScriptList.Parent = MainFrame
ScriptList.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ScriptList.BorderSizePixel = 0
ScriptList.Position = UDim2.new(0, 420, 0, 40)
ScriptList.Size = UDim2.new(0, 170, 0, 250)
ScriptList.ScrollBarThickness = 6
ScriptList.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
ScriptList.CanvasSize = UDim2.new(0, 0, 1, 0)
ScriptList.AutomaticCanvasSize = Enum.AutomaticSize.Y

ListLabel.Name = "ListLabel"
ListLabel.Parent = ScriptList
ListLabel.BackgroundTransparency = 1
ListLabel.Size = UDim2.new(1, 0, 0, 20)
ListLabel.Font = Enum.Font.GothamBold
ListLabel.Text = "Scripts"
ListLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ListLabel.TextSize = 14

local function CreateScriptButton(name, parent, exec, position)
    local Button = Instance.new("TextButton")
    Button.Parent = parent
    Button.BackgroundTransparency = 1
    Button.Size = UDim2.new(1, 0, 0, 30)
    Button.Position = UDim2.new(0, 0, 0, position)
    Button.Font = Enum.Font.Gotham
    Button.Text = name
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 14
    Button.MouseButton1Click:Connect(function()
        loadstring(exec)()
    end)
    return Button
end

CreateScriptButton("IY.lua", ScriptList, "loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()", 30)
CreateScriptButton("Owl Hub.lua", ScriptList, "loadstring(game:HttpGet('https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt'))()", 70)
CreateScriptButton("Dark Dex.lua", ScriptList, "loadstring(game:HttpGet('https://gist.githubusercontent.com/Toon-arch/6401445/raw/darkdexv4.lua'))()", 110)

local function CreateButton(name, parent, position, callback)
    local Button = Instance.new("TextButton")
    Button.Parent = parent
    Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Button.Position = position
    Button.Size = UDim2.new(0, 100, 0, 30)
    Button.Font = Enum.Font.Gotham
    Button.Text = name
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 14
    Button.MouseButton1Click:Connect(callback)
    Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 6)
    return Button
end

ExecuteButton = CreateButton("Execute", MainFrame, UDim2.new(0, 70, 1, -40), function()
    loadstring(ScriptBox.Text)()
end)

ClearButton = CreateButton("Clear", MainFrame, UDim2.new(0, 180, 1, -40), function()
    ScriptBox.Text = ""
end)

OpenFileButton = CreateButton("Open File", MainFrame, UDim2.new(0, 290, 1, -40), function()
    print("Open File not implemented.")
end)

SaveFileButton = CreateButton("Save File", MainFrame, UDim2.new(0, 400, 1, -40), function()
    print("Save File not implemented.")
end)

-- ANIMATIONS

-- Startup animation
MainFrame:TweenSizeAndPosition(
    UDim2.new(0, 600, 0, 350),
    UDim2.new(0.5, -300, 0.5, -175),
    Enum.EasingDirection.Out,
    Enum.EasingStyle.Quad,
    0.6,
    true
)
TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()

-- Toggle UI with Insert
local open = true
UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.Insert then
        open = not open
        if open then
            TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0,600,0,350), BackgroundTransparency = 0}):Play()
        else
            TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0,0,0,0), BackgroundTransparency = 1}):Play()
        end
    end
end)
