--// 🔷 XPERIA GAG MASTER GUI – lengkap, minimize, drag //
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "XPERIA_GAG_GUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 420, 0, 350)
frame.Position = UDim2.new(0.5, -210, 0.5, -175)
frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
frame.BorderColor3 = Color3.fromRGB(0, 255, 255)
frame.BorderSizePixel = 2
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
title.Text = "🔷 XPERIA GAG MASTER GUI"
title.TextColor3 = Color3.fromRGB(0, 0, 0)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 24

local minimize = Instance.new("TextButton", frame)
minimize.Size = UDim2.new(0, 30, 0, 30)
minimize.Position = UDim2.new(1, -35, 0, 5)
minimize.Text = "-"
minimize.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
minimize.Font = Enum.Font.SourceSansBold
minimize.TextSize = 20

local container = Instance.new("ScrollingFrame", frame)
container.Position = UDim2.new(0, 5, 0, 45)
container.Size = UDim2.new(1, -10, 1, -80)
container.CanvasSize = UDim2.new(0, 0, 3, 0)
container.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
container.ScrollBarThickness = 6

local status = Instance.new("TextLabel", frame)
status.Size = UDim2.new(1, 0, 0, 30)
status.Position = UDim2.new(0, 0, 1, -30)
status.Text = "🔄 Auto Refresh: 5s"
status.TextColor3 = Color3.fromRGB(0, 255, 0)
status.BackgroundTransparency = 1
status.Font = Enum.Font.Code
status.TextSize = 18

-- Data Dummy (karena Roblox gak bisa fetch JSON luar)
local items = {
    {name = "Golden Tomato", stock = 2, rarity = "Legendary", weather = "Rain"},
    {name = "Blood Onion", stock = 0, rarity = "Mythic", weather = "Storm"},
    {name = "Purple Potato", stock = 8, rarity = "Epic", weather = "Sunny"},
    {name = "Ghost Carrot", stock = 1, rarity = "Mythic", weather = "Windy"},
}

local function refresh()
    container:ClearAllChildren()
    for i, item in pairs(items) do
        local text = Instance.new("TextLabel", container)
        text.Size = UDim2.new(1, 0, 0, 30)
        text.Position = UDim2.new(0, 0, 0, (i - 1) * 32)
        text.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        text.BorderSizePixel = 0
        text.Text = item.name.." | Stock: "..item.stock.." | "..item.rarity.." | Weather: "..item.weather
        text.TextColor3 = Color3.fromRGB(0, 255, 0)
        text.Font = Enum.Font.Code
        text.TextSize = 16
        text.TextXAlignment = Enum.TextXAlignment.Left
    end
end

refresh()
while true do
    task.wait(5)
    refresh()
end

-- Minimize toggle
local minimized = false
minimize.MouseButton1Click:Connect(function()
    minimized = not minimized
    container.Visible = not minimized
    status.Visible = not minimized
    if minimized then
        minimize.Text = "+"
    else
        minimize.Text = "-"
    end
end)
