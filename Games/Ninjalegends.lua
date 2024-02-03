-- Ninja Legends
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Mobile%20Friendly%20Orion')))()
local Window = OrionLib:MakeWindow({Name = game:HttpGet("https://raw.githubusercontent.com/NoahCodeMaster/VentureHub/main/HubName.lua"), HidePremium = false, SaveConfig = true, IntroEnabled = true, IntroText=game:HttpGet("https://raw.githubusercontent.com/NoahCodeMaster/VentureHub/main/HubName.lua")})
-- Var
local plr = game:GetService("Players").LocalPlayer
local char = plr.Character
local hum = char.HumanoidRootPart
local rep = game:GetService("ReplicatedStorage")
getgenv().autobuyrank = false
getgenv().autosell = false
getgenv().autoswing = false
-- Home
local home = Window:MakeTab({Name = "Home", Icon = "https://www.roblox.com/library/", PremiumOnly = false})

local homeS = home:AddSection({Name = "Home"})

homeS:AddLabel("Hey there, "..plr.Name.."! Thank you for Using Noah's script")

local homeU = home:AddSection({Name = "Updates"})
homeU:AddLabel(game:HttpGet("https://raw.githubusercontent.com/NoahCodeMaster/VentureHub/main/UpdateNew/ninjalegends.update"))
-- Tabs
local main = Window:MakeTab({Name = "Main", Icon = "https://www.roblox.com/library/", PremiumOnly = false})
local farm = Window:MakeTab({Name = "Auto Farm"})
local sup = Window:MakeTab({Name = "Games"})
local teleport = Window:MakeTab({Name = "Teleport"})
local set = Window:MakeTab({Name = "Settings"})
-- Sections
local mainS = main:AddSection({Name = "Main"})
local auto = farm:AddSection({Name = "Auto Farm"})
local tp = teleport:AddSection({Name = "Islands"})
local inf = main:AddSection({Name = "Other stuff"})

local function chest()
     for i = 1, #Workspace:GetChildren() do
            local v = Workspace:GetChildren()[i]
            if v:FindFirstChild("Chest") and (v:FindFirstChild("circleInner") and v.circleInner:FindFirstChildWhichIsA("TouchTransmitter")) then
                local Transmitter = v.circleInner:FindFirstChildWhichIsA("TouchTransmitter")
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Transmitter.Parent, 0)
                task.wait();
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Transmitter.Parent, 1)
                wait(5)
            end
        end
end

local function swing()
    for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:FindFirstChild("ninjitsuGain") then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
            break
        end
    end
    game:GetService("Players").LocalPlayer.ninjaEvent:FireServer("swingKatana")
    wait()
end

local function infjump()
local mt = getrawmetatable(game);
make_writeable(mt);
local old_index = mt.__index
mt.__index = function(a,b)
   if tostring(a) == "multiJumpCount" then
       if tostring(b) == "Value" then
          return 99999999;
       end
   end
   return old_index(a, b);
end
end



local function islandunlocker()
 for _,v in pairs(game:GetService("Workspace").islandUnlockParts:GetChildren()) do
        firetouchinterest(char:FindFirstChild("HumanoidRootPart"),v,0)
        firetouchinterest(char:FindFirstChild("HumanoidRootPart"),v,1)
    end
end
local function stuff(a, b)
    if a == "sword" or a == "Sword" then
        while true do
            task.wait(0.9)
            local args = {
    [1] = "buyAllSwords",
    [2] = "Blazing Vortex Island"
}

game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(args))
        end
        print(b)
    end
    if a == "belt" or a == "Belt" then
        while true do
            task.wait(1)
        local args = {
    [1] = "buyAllBelts",
    [2] = "Blazing Vortex Island"
}

plr.ninjaEvent:FireServer(unpack(args))
        end
   print(b)
    end
    if a == "Skills" or a == "skills" then
        while true do
            task.wait(0.7)
        local args = {
    [1] = "buyAllSkills",
    [2] = "Blazing Vortex Island"
}

plr.ninjaEvent:FireServer(unpack(args))
        end
        print(b)
    end
    
    if a == "elements" or a == "Elements" or a == "element" or a == "Element" then
        local Elements = {}
        for i,v in pairs(rep.Elements:GetChildren()) do
            table.insert(Elements,v.Name)
        end
        for i,v in pairs(Elements) do
            rep.rEvents.elementMasteryEvent:FireServer(v)
        end
        print(b)
    end
    if a == "sell" or a == "Sell" then
        game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = hum.CFrame
        wait(0.1)
        game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = CFrame.new(0,0,0)
        wait(0.1)
        print(b)
    end
    if a == "Rank" or a == "rank" then
        local ranks = {}
        for i,v in pairs(rep.Ranks.Ground:GetChildren()) do
            table.insert(ranks,v.Name)
        end
        local deku1 = "buyRank"
        for i = 1, #ranks do
            plr.ninjaEvent:FireServer(deku1, ranks[i])
        end
    end
end

mainS:AddButton({
    Name = "Unlock All The elements",
    Callback = function()
        stuff("Elements")
    end
})

main:AddButton({
    Name = "Turn off pop ups",
    Callback = function(Value)
        if game:GetService("Players").LocalPlayer.PlayerGui.statEffectsGui.Enabled == false then
            game:GetService("Players").LocalPlayer.PlayerGui.statEffectsGui.Enabled = true
            game:GetService("Players").LocalPlayer.PlayerGui.hoopGui.Enabled = true
        end
    end
})

auto:AddButton({
    Name = "Infinite Jump Count",
    Callback = function()
        infjump()
    end
})

auto:AddToggle({
	Name = "Auto Swing",
	default = false,
	Callback = function(v)
	    getgenv().autoswing = v
	    while true do
	        if not getgenv().autoswing then return end
	        task.wait(0.1)
	        swing()
	    end
	end    
})

auto:AddButton({
    Name = "Unlock All Islands",
    Callback = function()
        islandunlocker()
    end
})

auto:AddButton({Name = "Auto Collect Chests", Callback = function() chest() end})

auto:AddButton({
    Name = "Auto Buy Swords",
    Callback = function()
        stuff("Sword")
    end
})

auto:AddButton({
    Name = "Auto Buy Belts",
    Callback = function()
        stuff("Belt")
    end
})

auto:AddToggle({
    Name = "Auto Sell",
    Callback = function(v)
         getgenv().autosell = v
        while true do
            if not getgenv().autosell then return end
            if getgenv().autosell == true then
                stuff("Sell")
            end
        end
    end
})

auto:AddButton({
    Name = "Auto Buy Skills",
    Callback = function()
        stuff("Skills")
    end
})
auto:AddToggle({
    Name = "Auto Rank",
    default = false,
    Callback = function(v)
        getgenv().autobuyranks = v
        while true do
            if not getgenv().autobuyranks then return end
            stuff("Rank")
            wait(0.1)
        end
    end
})

auto:AddButton({
    Name = "Auto Hoop",
    Callback = function()
        for i,v in pairs(game:GetService("Workspace").Hoops:GetChildren()) do
            if v:IsA("MeshPart") then
                v.touchPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                task.wait(0.5)
                v.touchPart.CFrame = CFrame.new(0,0,0)
            end
        end
    end
})

---- Teleport

tp:AddButton({
    Name = "Island 1",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(50.1260376, 848.216614, -144.231583, 0.940045297, 0.119622417, -0.319382787, -2.0082652e-07, 0.936470151, 0.350747257, 0.341049701, -0.329718232, 0.880324364)
    end
})


tp:AddButton({
    Name = "Island 2",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(194.994919, 2118.46777, 242.469437, -0.536873639, 0.39717111, -0.744326413, -3.25007967e-08, 0.882255971, 0.470770061, 0.84366262, 0.252744079, -0.473659962)
    end
})


tp:AddButton({
    Name = "Island 3",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(179.088654, 4147.84814, 45.4721069, 0.998944461, -0.0323245898, 0.032636039, 4.00218916e-08, 0.710489392, 0.703707933, -0.0459346287, -0.70296514, 0.709739447)
    end
})


tp:AddButton({
    Name = "Island 4",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(122.277969, 5882.06299, 126.667633, 0.282971948, 0.56109494, -0.777881324, -6.79669157e-08, 0.811029613, 0.585005105, 0.959128201, -0.16553998, 0.229498655)
    end
})

tp:AddButton({
    Name = "Island 5",
    Callback = function()
        
    end
})

tp:AddButton({
    Name = "Island 6",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(160.230164, 9406.39355, 86.0516815, 0.0311976075, 0.0226291362, 0.999257028, -8.56382485e-08, 0.9997437, -0.0226401538, -0.999513209, 0.000706233084, 0.031189613)
    end
})

tp:AddButton({
    Name = "Island 7",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(137.222153, 13805.0371, 88.7504196, -0.0159664787, 0.127956674, -0.991651237, 9.46397378e-08, 0.991777658, 0.127972975, 0.999872506, 0.00204318389, -0.0158352088)
    end
})

tp:AddButton({
    Name = "Island 8",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(157.01741, 17800.0547, 88.0893478, -0.249224454, -0.461839318, 0.851229489, 1.04632569e-07, 0.878964543, 0.476887137, -0.968445778, 0.118852027, -0.219059408)
    end
})

tp:AddButton({
    Name = "Island 9",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(138.904465, 24175.0547, 94.6129456, -0.170732915, 0.247951463, -0.953609109, -1.35065733e-07, 0.967819273, 0.25164634, 0.985317349, 0.0429644398, -0.165238574)
    end
})

tp:AddButton({
    Name = "Island 10",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(133.627609, 28389.5078, 101.650536, -0.955243587, 0.187943935, -0.228444323, 0.00206344365, 0.776454329, 0.630170166, 0.295813233, 0.60149461, -0.742090821)
    end
})

tp:AddButton({
    Name = "Island 11",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(156.327316, 33344.2734, 93.8196487, 0.601374686, -0.309643358, 0.736525297, -1.40610055e-07, 0.921846747, 0.387554675, -0.798967183, -0.233065665, 0.554375231)
    end
})

tp:AddButton({
    Name = "Island 12",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(138.807739, 39429.3555, 66.6223831, -0.97075212, 0.00644479366, -0.239997447, 8.05806906e-08, 0.99963963, 0.0268435907, 0.240083963, 0.0260584522, -0.9704023)
    end
})
tp:AddButton({
    Name = "Island 13",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(129.371704, 46122.2617, 91.0460587, 0.272553355, 0.286381215, -0.918531716, 0.016998291, 0.953092813, 0.302200556, 0.961990535, -0.0979792401, 0.254900634)
    end
})
tp:AddButton({
    Name = "Island 14",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(149.971649, 52735.2305, 91.8719406, 0.774333656, -0.147073299, 0.615448534, 0.0165622868, 0.976991773, 0.212632999, -0.63256079, -0.154455647, 0.758953452)
    end
})
tp:AddButton({
    Name = "Island 15",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(163.680038, 59728.668, 92.6676254, 0.392328918, -0.358471483, 0.847098708, 0.0172829852, 0.9236449, 0.382859468, -0.919662595, -0.135566443, 0.368568063)
    end
})
tp:AddButton({
    Name = "Island 16",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(146.255661, 66773.8516, 84.4870987, -0.635296047, -0.205307081, 0.744478285, 0.0169070438, 0.960086048, 0.279193431, -0.77208358, 0.18995741, -0.606467724)
    end
})
tp:AddButton({
    Name = "Island 17",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(133.460297, 70398.375, 82.545639, -0.292901456, 0.217624068, -0.931046963, 0.0164336208, 0.974755228, 0.22267057, 0.956001401, 0.0499200635, -0.2890836)
    end
})
tp:AddButton({
    Name = "Island 18",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(148.979233, 74555.5703, 91.123024, -0.336358726, 0.267737478, -0.90287286, 0.0169186592, 0.960297823, 0.278463304, 0.941581964, 0.0783881694, -0.327534318)
    end
})
tp:AddButton({
    Name = "Island 19",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(150.731461, 79854, 105.507568, 0.989790678, -0.0344657712, 0.13829872, 0.0159638785, 0.991024494, 0.132723749, -0.141631842, -0.129160941, 0.981456995)
    end
})
tp:AddButton({
    Name = "Island 20",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.591751, 83321.8047, 79.0843887, -0.864063859, -0.0410363041, 0.501706779, 0.0158235952, 0.993964851, 0.108551934, -0.503133476, 0.101734608, -0.858199716)
    end
})
tp:AddButton({
    Name = "Island 21",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(158.349609, 87158.3828, 102.228897, 0.844404638, -0.179453909, 0.504754424, 0.0171738677, 0.950806975, 0.309307486, -0.535430491, -0.252512097, 0.805947781)
    end
})

tp:AddButton({
    Name = "Island 22",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(158.390182, 87158.375, 102.264389, 0.698195517, -0.135046616, 0.703054368, 0.0161817763, 0.984772921, 0.173090741, -0.71572423, -0.10947451, 0.68974936)
    end
})

tp:AddButton({
    Name = "Island 23 (has 35x coin sell)",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(147.59285, 91361.4922, 81.685463, -0.653092384, -0.0345417708, 0.756490052, 0.0154029448, 0.998146594, 0.0588736087, -0.757121563, 0.0501020811, -0.651349902)
    end
})


----- Others
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

-- to not annoy while being in simplespy
local fucker = game:GetService("ReplicatedStorage").rEvents.getServerTimeRemote
if fucker then
    fucker:Destroy()
    else
        warn("KYEAK")
end
