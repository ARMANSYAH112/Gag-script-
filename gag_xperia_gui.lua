local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "XPERIA_GAG_GUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 460, 0, 380)
frame.Position = UDim2.new(0.5, -230, 0.5, -190)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
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
container.CanvasSize = UDim2.new(0, 0, 5, 0)
container.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
container.ScrollBarThickness = 6

local status = Instance.new("TextLabel", frame)
status.Size = UDim2.new(1, 0, 0, 30)
status.Position = UDim2.new(0, 0, 1, -30)
status.Text = "🔄 Auto Refresh: 5s"
status.TextColor3 = Color3.fromRGB(0, 255, 0)
status.BackgroundTransparency = 1
status.Font = Enum.Font.Code
status.TextSize = 18

local function rarityColor(rarity)
    local colors = {
        ["Common"] = Color3.fromRGB(255, 255, 255),
        ["Uncommon"] = Color3.fromRGB(0, 255, 0),
        ["Rare"] = Color3.fromRGB(0, 120, 255),
        ["Epic"] = Color3.fromRGB(180, 0, 255),
        ["Legendary"] = Color3.fromRGB(255, 170, 0),
        ["Mythic"] = Color3.fromRGB(255, 0, 0)
    }
    return colors[rarity] or Color3.fromRGB(255,255,255)
end

local items = {
    {name = "Golden Tomato", stock = 3, rarity = "Legendary", weather = "Rain"},
    {name = "Blood Onion", stock = 1, rarity = "Mythic", weather = "Storm"},
    {name = "Ghost Carrot", stock = 0, rarity = "Epic", weather = "Sunny"},
    {name = "Green Bean", stock = 7, rarity = "Uncommon", weather = "Cloudy"},
    {name = "Black Radish", stock = 2, rarity = "Rare", weather = "Night"},
    {name = "White Lettuce", stock = 9, rarity = "Common", weather = "Clear"}
}

local function refresh()
    container:ClearAllChildren()
    for i, item in pairs(items) do
        local holder = Instance.new("Frame", container)
        holder.Size = UDim2.new(1, -10, 0, 32)
        holder.Position = UDim2.new(0, 0, 0, (i-1)*35)
        holder.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        holder.BorderSizePixel = 0

        local label = Instance.new("TextLabel", holder)
        label.Size = UDim2.new(0.75, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = item.name.." | Stock: "..item.stock.." | "..item.rarity.." | "..item.weather
        label.TextColor3 = rarityColor(item.rarity)
        label.Font = Enum.Font.Code
        label.TextSize = 16
        label.TextXAlignment = Enum.TextXAlignment.Left

        local buy = Instance.new("TextButton", holder)
        buy.Size = UDim2.new(0.2, 0, 0.8, 0)
        buy.Position = UDim2.new(0.75, 5, 0.1, 0)
        buy.Text = "BUY"
        buy.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        buy.TextColor3 = Color3.fromRGB(0, 0, 0)
        buy.Font = Enum.Font.SourceSansBold
        buy.TextSize = 16

        buy.MouseButton1Click:Connect(function()
            print("[XPERIA] Bought "..item.name.." (simulasi)")
        end)
    end
end

refresh()
task.spawn(function()
    while true do
        task.wait(5)
        refresh()
    end
end)

local minimized = false
minimize.MouseButton1Click:Connect(function()
    minimized = not minimized
    container.Visible = not minimized
    status.Visible = not minimized
    if minimized then minimize.Text = "+" else minimize.Text = "-" end
end)
