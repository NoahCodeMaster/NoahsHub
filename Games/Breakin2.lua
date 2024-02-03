local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Mobile%20Friendly%20Orion')))()
local Window = OrionLib:MakeWindow({Name = "Venture Hub", HidePremium = false, SaveConfig = true, IntroEnabled = true, IntroText="Venture Hub"})
loadstring(game:HttpGet("https://raw.githubusercontent.com/NoahCodeMaster/VentureHub/main/Stuff/src.lua"))()
-- Var
local plr = game:GetService("Players").LocalPlayer
local char = plr.Character
-- Home
local home = Window:MakeTab({Name = "Home", Icon = "https://www.roblox.com/library/", PremiumOnly = false})

local homeS = home:AddSection({Name = "Home"})

homeS:AddLabel("Hey there, "..plr.Name.."! Thank you for Using Noah's script")

local homeU = home:AddSection({Name = "Updates"})
homeU:AddLabel(game:HttpGet("https://raw.githubusercontent.com/NoahCodeMaster/VentureHub/main/UpdateNew/Breakin2.update"))
-- Tabs
local main = Window:MakeTab({Name = "Main", Icon = "https://www.roblox.com/library/", PremiumOnly = false})
local sup = Window:MakeTab({Name = "Games"})
local teleport = Window:MakeTab({Name = "Teleport"})
local set = Window:MakeTab({Name = "Settings"})
-- Sections
local role = main:AddSection({Name = "Free Roles"})
local Main = main:AddSection({Name = "Important Food"})
local wp = main:AddSection({Name = "Weapon"})
local inf = main:AddSection({Name = "Other"})
local tp = teleport:AddSection({Name = "Teleport Around"})

--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
-- Roles
function hacker()
    local args = {
        [1] = "Phone",
        [2] = true,
        [3] = false
    }
    game:GetService("ReplicatedStorage").RemoteEvents.OutsideRole:FireServer(unpack(args))
end

function nerd()
    local args = {
        [1] = "Book",
        [2] = true,
        [3] = false
    }
    game:GetService("ReplicatedStorage").RemoteEvents.OutsideRole:FireServer(unpack(args))
end


role:AddButton({
    Name = "Hacker Role",
    Callback = function()
        hacker()
    end
})

role:AddButton({
    Name = "Nerd Role",
    Callback = function()
        nerd()
    end
})

--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
-- Food
Main:AddButton({
    Name = "Golden Apple",
    Callback = function()
        local args = {
    [1] = "GoldenApple"
}

game:GetService("ReplicatedStorage").Events.GiveTool:FireServer(unpack(args))

    end
})

Main:AddButton({
    Name = "Golden Pizza",
    Callback = function()
        local args = {
    [1] = "GoldPizza"
}

game:GetService("ReplicatedStorage").Events.GiveTool:FireServer(unpack(args))

    end
})

Main:AddButton({
    Name = "Rainbow Pizza",
    Callback = function()
        local args = {
    [1] = "RainbowPizza"
}

game:GetService("ReplicatedStorage").Events.GiveTool:FireServer(unpack(args))

    end
})

Main:AddButton({
    Name = "Cookie",
    Callback = function()
        local args = {
    [1] = "Cookie"
}

game:GetService("ReplicatedStorage").Events.GiveTool:FireServer(unpack(args))

    end
})

Main:AddButton({
    Name = "Chips",
    Callback = function()
        local args = {
    [1] = "Chips"
}

game:GetService("ReplicatedStorage").Events.GiveTool:FireServer(unpack(args))
    end
})

Main:AddButton({
    Name = "Apple",
    Callback = function()
        local args = {
    [1] = "Apple"
}

game:GetService("ReplicatedStorage").Events.GiveTool:FireServer(unpack(args))

    end
})

Main:AddButton({
    Name = "Pizza Regular",
    Callback = function()
        local args = {
    [1] = "Pizza"
}

game:GetService("ReplicatedStorage").Events.GiveTool:FireServer(unpack(args))

    end
})

Main:AddButton({
    Name = "Water Bottle",
    Callback = function()
        local args = {
    [1] = "Bottle"
}

game:GetService("ReplicatedStorage").Events.GiveTool:FireServer(unpack(args))
    end
})

--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
-- Weapons
wp:AddButton({
    Name = "Hammer",
    Callback = function()
        local args = {
    [1] = 3,
    [2] = "Hammer",
    [3] = "Weapons",
    [4] = "FoxIDM"
}

game:GetService("ReplicatedStorage").Events.Vending:FireServer(unpack(args))

    end
})



wp:AddButton({
    Name = "PitchFork",
    Callback = function()
        local args = {
    [1] = 3,
    [2] = "Pitchfork",
    [3] = "Weapons",
    [4] = "FoxIDM"
}

game:GetService("ReplicatedStorage").Events.Vending:FireServer(unpack(args))

    end
})

wp:AddButton({
    Name = "Wrench",
    Callback = function()
        local args = {
    [1] = 3,
    [2] = "Wrench",
    [3] = "Weapons",
    [4] = "FoxIDM"
}

game:GetService("ReplicatedStorage").Events.Vending:FireServer(unpack(args))

    end
})

wp:AddButton({
    Name = "Crowbar",
    Callback = function()
        local args = {
    [1] = 3,
    [2] = "Crowbar",
    [3] = "Weapons",
    [4] = "FoxIDM"
}

game:GetService("ReplicatedStorage").Events.Vending:FireServer(unpack(args))

    end
})

wp:AddButton({
    Name = "Broom",
    Callback = function()
        local args = {
    [1] = 3,
    [2] = "Broom",
    [3] = "Weapons",
    [4] = "FoxIDM"
}

game:GetService("ReplicatedStorage").Events.Vending:FireServer(unpack(args))

    end
})

wp:AddButton({
    Name = "Bat",
    Callback = function()
        local args = {
    [1] = 3,
    [2] = "Bat",
    [3] = "Weapons",
    [4] = "FoxIDM"
}

game:GetService("ReplicatedStorage").Events.Vending:FireServer(unpack(args))
    end
})

---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
-- Teleport

local hum = char.HumanoidRootPart
tp:AddButton({
    Name = "Base",
    Callback = function()
        hum.CFrame = CFrame.new(-222.426346, 30.4567528, -790.828064, 0.0356279165, 7.88599763e-08, 0.999365151, 3.27545346e-09, 1, -7.90268402e-08, -0.999365151, 6.08893558e-09, 0.0356279165)
    end
})

tp:AddButton({
    Name = "Inside Vault",
    Callback = function()
        hum.CFrame = CFrame.new(-1344.42017, -346.249207, -809.398621, 0.206794947, 3.86654406e-08, 0.978384316, -1.35231943e-07, 1, -1.09365601e-08, -0.978384316, -1.30047184e-07, 0.206794947)
    end
})

tp:AddButton({
    Name = "Lava Place",
    Callback = function()
        hum.CFrame = CFrame.new(-1562.54749, -375.14743, -957.845093, 0.997142553, 1.29003066e-08, -0.0755428299, -1.14637704e-08, 1, 1.94498018e-08, 0.0755428299, -1.8528219e-08, 0.997142553)
    end
})

tp:AddButton({
    Name = "Scary Mary Escape",
    Callback = function() 
        hum.CFrame = CFrame.new(66.2245483, 29.4477024, -1358.29297, 0.935057759, -6.21174578e-09, -0.354495347, 3.46256113e-09, 1, -8.38953529e-09, 0.354495347, 6.61723787e-09, 0.935057759)
    end
})

tp:AddButton({
    Name = "Dog's House",
    Callback = function()
        hum.CFrame = CFrame.new(-284.290283, 30.2326775, -904.050659, -0.168406054, -7.93923949e-09, 0.985717714, 1.06251263e-09, 1, 8.23579871e-09, -0.985717714, 2.43429588e-09, -0.168406054)
    end
})

tp:AddButton({
    Name = "Circling Place",
    Callback = function()
        hum.CFrame = CFrame.new(-542.763306, 95.535408, 454.468109, 0.188991159, 2.29097559e-08, 0.981978774, -4.42541825e-08, 1, -1.48130557e-08, -0.981978774, -4.0657131e-08, 0.188991159)
    end
})

tp:AddButton({
    Name = "Drawer 1",
    Callback = function()
        hum.CFrame = CFrame.new(-213.429153, 30.4567528, -825.279846, 0.0535516851, -1.38913645e-08, -0.998565078, 2.38640929e-08, 1, -1.26315269e-08, 0.998565078, -2.31534099e-08, 0.0535516851)
    end
})

tp:AddButton({
    Name = "Drawer 2",
    Callback = function()
        hum.CFrame = CFrame.new(-213.41571, 30.4567566, -755.552795, -0.0463988148, -1.07699798e-07, -0.998923004, 2.90097297e-08, 1, -1.09163388e-07, 0.998923004, -3.40435378e-08, -0.0463988148)
    end
})

tp:AddButton({
    Name = "Drawer 3",
    Callback = function()
        hum.CFrame = CFrame.new(-213.004089, 30.4702549, -725.176636, -0.0301644355, -2.23262795e-08, -0.999544978, 2.01655403e-08, 1, -2.29450041e-08, 0.999544978, -2.08484874e-08, -0.0301644355)
    end
})

tp:AddButton({
    Name = "Drawer 4",
    Callback = function()
        hum.CFrame = CFrame.new(-225.359528, 30.4477539, -846.859009, -0.998323917, 2.78594925e-09, -0.0578734204, 2.88423885e-09, 1, -1.6148245e-09, 0.0578734204, -1.77903869e-09, -0.998323917)
    end
})

tp:AddButton({
    Name = "Kitchen's Vault",
    Callback = function()
        hum.CFrame = CFrame.new(-1492.0293, -368.049164, -881.418152, 0.871407211, 1.68132441e-09, 0.490560383, -1.42738212e-08, 1, 2.19279563e-08, -0.490560383, -2.61103494e-08, 0.871407211)
    end
})

---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------

inf:AddButton({
    Name = "Get Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
})

inf:AddButton({
    Name = "Fly Gui",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
    end
})

set:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

sup:AddParagraph("Supported Games",game:HttpGet("https://raw.githubusercontent.com/NoahCodeMaster/VentureHub/main/SupportedGames/games.sup"))

OrionLib:Init()
