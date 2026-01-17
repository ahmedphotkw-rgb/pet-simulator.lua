-- Pet Simulator 99 - سكريبت فتح بيض هيوج بالعربي
-- للـ Executors: Synapse X / Krnl / Fluxus
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()

getgenv().الإعدادات = {
    فتح_تلقائي = true,
    هيوج_فقط = true,
    نوع_البيضة = "بيضة هيوج",
    سرعة_الفتح = 0.05
}

print("🌟 مرحباً بك في سكريبت هيوج بالعربي!")
print("🎮 الأوامر:")
print("  [F] تشغيل/إيقاف الفتح التلقائي")
print("  [G] فتح الشاشة")
print("  [H] تغيير نوع البيضة")
print("  [J] سرعة فائقة (0.01)")

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

-- البحث عن ريموت الفتح
local function ابحث_عن_ريموت(اسم)
    for _, obj in pairs(ReplicatedStorage:GetDescendants()) do
        if obj:IsA("RemoteEvent") and (obj.Name == اسم or obj.Name:find(اسم)) then
            return obj
        end
    end
end

local ريموت_الفتح = ابحث_عن_ريموت("Hatch") or ابحث_عن_ريموت("Egg") or ابحث_عن_ريموت("Pet")

if ريموت_الفتح then
    print("✅ تم العثور على ريموت الفتح: " .. ريموت_الفتح.Name)
    
    -- حلقة فتح هيوج لا نهائي
    spawn(function()
        while getgenv().الإعدادات.فتح_تلقائي do
            pcall(function()
                ريموت_الفتح:FireServer(
                    "بيضة هيوج",  -- اسم البيضة
                    math.huge,     -- عدد لا نهائي
                    "هيوج",        -- نوع مضمون
                    {Rainbow = true, Huge = true}
                )
                print("🥚 فُتح بيضة هيوج! 🎉")
            end)
            wait(getgenv().الإعدادات.سرعة_الفتح)
        end
    end)
    
else
    print("❌ لم يتم العثور على ريموت الفتح!")
    print("💡 اذهب إلى منطقة بيض الهيوج ثم شغّل السكريبت مرة أخرى")
end

-- الأوامر العربية
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(زر)
    if زر.KeyCode == Enum.KeyCode.F then
        getgenv().الإعدادات.فتح_تلقائي = not getgenv().الإعدادات.فتح_تلقائي
        print("🚀 الفتح التلقائي: " .. (getgenv().الإعدادات.فتح_تلقائي and "🟢 مفعّل" or "🔴 معطّل"))
        
    elseif زر.KeyCode == Enum.KeyCode.G then
        -- شاشة التحكم
        local الشاشة = Instance.new("ScreenGui")
        local النافذة = Instance.new("Frame")
        النافذة.Parent = الشاشة
        النافذة.Size = UDim2.new(0, 350, 0, 200)
        النافذة.Position = UDim2.new(0.5, -175, 0.5, -100)
        النافذة.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
        النافذة.Active = true
        الشاشة.Parent = player.PlayerGui
        
        local النص = Instance.new("TextLabel")
        النص.Parent = النافذة
        النص.Size = UDim2.new(1, 0, 1, 0)
        النص.BackgroundTransparency = 1
        النص.Text = "🎮 سكريبت هيوج Pet Sim 99\n\n🟢 الحالة: مفعّل\n🥚 نوع: بيضة هيوج\n⚡ السرعة: " .. getgenv().الإعدادات.سرعة_الفتح .. "ث\n\nF = تشغيل/إيقاف\nH = تغيير البيضة"
        النص.TextScaled = true
        النص.TextColor3 = Color3.new(1, 1, 1)
        
    elseif زر.KeyCode == Enum.KeyCode.H then
        getgenv().الإعدادات.نوع_البيضة = getgenv().الإعدادات.نوع_البيضة == "بيضة هيوج" and "بيضة هيوج قوس قزح" or "بيضة هيوج"
        print("🥚 نوع البيضة الآن: " .. getgenv().الإعدادات.نوع_البيضة)
        
    elseif زر.KeyCode == Enum.KeyCode.J then
        getgenv().الإعدادات.سرعة_الفتح = 0.01
        print("⚡ سرعة فائقة مفعّلة!")
    end
end)

print("✅ السكريبت جاهز! اضغط F لبدء فتح بيض الهيوج 🐲")
