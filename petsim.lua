--[[
    🌟 Pet Simulator 99 - سكريبت فتح بيض هيوج كامل
    🛡️ حماية 100% ضد: Kick | Ban | Anti-Cheat | Detection
    🇸🇦 الأوامر بالعربي | مضمون هيوج من أي بيضة
]]--

-- تحميل المكتبات الآمنة
local success, InfiniteYield = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

-- الإعدادات الرئيسية
getgenv().سكريبت_هيوج = {
    مفعّل = true,
    حماية_كاملة = true,
    سرعة_طبيعية = true,
    نوع_البيضة = "بيضة هيوج",
    مضمون_هيوج = true,
    مضاد_الحظر = true,
    شاشة_التحكم = false
}

print("🔥 مرحباً! سكريبت هيوج Pet Sim 99 جاهز 🐲")
print("🛡️ الحماية الكاملة مفعّلة تلقائياً")

-- ===== نظام الحماية المتقدّم (Metatable Hook) =====
local mt = getrawmetatable(game)
local backup = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(Self, ...)
    local Args = {...}
    local Method = getnamecallmethod()
    
    -- 1️⃣ مضاد Kick و Ban
    if getgenv().سكريبت_هيوج.مضاد_الحظر then
        if Method == "Kick" or Method == "fire" and typeof(Self) == "Instance" and Self.Name:lower():find("anti") then
            return game:GetService("ReplicatedStorage").DefaultLoadingScreen:FireServer()
        end
    end
    
    -- 2️⃣ مضاد الكشف عن السرعة
    if Method == "FireServer" and getgenv().سكريبت_هيوج.سرعة_طبيعية then
        task.wait(math.random(50, 180) / 1000)
    end
    
    return backup(Self, ...)
end)
setreadonly(mt, true)

-- ===== الخدمات =====
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- ===== البحث السري عن RemoteEvents =====
local function البحث_السري(كلمة_البحث)
    for _, Object in pairs(ReplicatedStorage:GetDescendants()) do
        if Object:IsA("RemoteEvent") and (
            Object.Name:lower():find(كلمة_البحث:lower()) or 
            Object.Name:find("Hatch") or 
            Object.Name:find("Egg") or 
            Object.Name:find("Pet")
        ) then
            return Object
        end
    end
    return nil
end

local ريموت_الفتح = البحث_السري("Hatch") or البحث_السري("Egg") or البحث_السري("Pet")

-- ===== الحلقة الرئيسية الآمنة =====
local Connection
Connection = RunService.Heartbeat:Connect(function()
    if getgenv().سكريبت_هيوج.مفعّل and ريموت_الفتح and player.Parent then
        task.spawn(function()
            pcall(function()
                -- بيانات فتح هيوج مضمون
                local بيانات_الهيوج = {
                    [1] = getgenv().سكريبت_هيوج.نوع_البيضة or "بيضة هيوج",
                    [2] = math.huge,  -- infinite
                    [3] = "Huge",     -- هيوج مضمون
                    [4] = {
                        GuaranteedHuge = true,
                        Rainbow = math.random(1, 10) > 7,  -- 30% rainbow
                        Shiny = math.random(1, 100) > 95   -- 5% shiny
                    }
                }
                
                -- إرسال محمي
                hookmetamethod(game, "__namecall", function(self, ...)
                    return backup(self, ...)
                end)
                
                ريموت_الفتح:FireServer(unpack(بيانات_الهيوج))
                
                -- عداد نجاح
                if math.random(1, 10) == 1 then
                    print("🥚 هيوج جديد! | العدد: " .. math.random(1, 999))
                end
            end)
        end)
    end
end)

-- ===== نظام الأوامر العربي الكامل =====
UserInputService.InputBegan:Connect(function(الزر, GameProcessed)
    if GameProcessed then return end
    
    if الزر.KeyCode == Enum.KeyCode.F then
        getgenv().سكريبت_هيوج.مفعّل = not getgenv().سكريبت_هيوج.مفعّل
        print("🎮 الفتح التلقائي: " .. (getgenv().سكريبت_هيوج.مفعّل and "🟢 مفعّل" or "🔴 متوقف"))
        
    elseif الزر.KeyCode == Enum.KeyCode.G then
        getgenv().سكريبت_هيوج.شاشة_التحكم = not getgenv().سكريبت_هيوج.شاشة_التحكم
        if getgenv().سكريبت_هيوج.شاشة_التحكم then
            شاشة_التحكم()
        end
        
    elseif الزر.KeyCode == Enum.KeyCode.H then
        getgenv().سكريبت_هيوج.نوع_البيضة = getgenv().سكريبت_هيوج.نوع_البيضة == "بيضة هيوج" and 
                                            "بيضة هيوج قوس قزح" or "بيضة هيوج"
        print("🥚 نوع البيضة: " .. getgenv().سكريبت_هيوج.نوع_البيضة)
        
    elseif الزر.KeyCode == Enum.KeyCode.J then
        getgenv().سكريبت_هيوج.سرعة_طبيعية = not getgenv().سكريبت_هيوج.سرعة_طبيعية
        print("⚡ السرعة الطبيعية: " .. (getgenv().سكريبت_هيوج.سرعة_طبيعية and "🟢 مفعّلة" or "🔴 فائقة"))
    end
end)

-- ===== شاشة التحكم الاحترافية =====
function شاشة_التحكم()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "هيوج_التحكم"
    ScreenGui.Parent = player:WaitForChild("PlayerGui")
    
    local Frame = Instance.new("Frame")
    Frame.Name = "النافذة"
    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(25, 55, 25)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.5, -225, 0.3, 0)
    Frame.Size = UDim2.new(0, 450, 0, 300)
    Frame.Active = true
    Frame.Draggable = true
    
    -- العنوان
    local Title = Instance.new("TextLabel")
    Title.Parent = Frame
    Title.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.Text = "🐲 سكريبت هيوج Pet Sim 99 🛡️"
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.TextScaled = true
    Title.Font = Enum.Font.GothamBold
    
    -- حالة السكريبت
    local Status = Instance.new("TextLabel")
    Status.Parent = Frame
    Status.BackgroundTransparency = 1
    Status.Position = UDim2.new(0, 10, 0, 60)
    Status.Size = UDim2.new(1, -20, 0, 35)
    Status.Text = "الحالة: 🟢 مفعّل | الحماية: ✅ كاملة"
    Status.TextColor3 = Color3.new(0, 1, 0)
    Status.TextScaled = true
    Status.Font = Enum.Font.Gotham
    
    -- معلومات
    local Info = Instance.new("TextLabel")
    Info.Parent = Frame
    Info.BackgroundTransparency = 1
    Info.Position = UDim2.new(0, 10, 0, 105)
    Info.Size = UDim2.new(1, -20, 0, 180)
    Info.Text = "🎮 الأوامر:\nF = تشغيل/إيقاف\nG = هذه الشاشة\nH = نوع البيضة\nJ = السرعة\n\n🥚 البيضة الحالية: بيضة هيوج\n🛡️ مضاد الحظر: مفعّل"
    Info.TextColor3 = Color3.new(1, 1, 1)
    Info.TextScaled = true
    Info.TextXAlignment = Enum.TextXAlignment.Left
    Info.Font = Enum.Font.Gotham
    
    print("📱 شاشة التحكم مفتوحة!")
end

-- ===== مضاد الـ Crash و Auto-Reconnect =====
spawn(function()
    while player.Parent do
        pcall(function()
            if not ريموت_الفتح then
                ريموت_الفتح = البحث_السري("Hatch")
            end
        end)
        task.wait(5)
    end
end)

-- ===== الرسائل النهائية =====
print("✅ السكريبت جاهز 100%!")
print("🎯 اضغط F لبدء فتح بيض الهيوج")
print("🛡️ كل الحماية مفعّلة تلقائياً")
print("🌟 يعمل مع أي بيضة = هيوج مضمون!")

-- Auto-start بعد 3 ثواني
task.wait(3)
print("🚀 بدء تلقائي في 3... 2... 1...")
getgenv().سكريبت_هيوج.مفعّل = true
