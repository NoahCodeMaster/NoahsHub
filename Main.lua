local gameid = {
    [1] = 1962086868, -- Tower Of Hell
}

if gameid then
    if game.PlaceId == gameid[1] or game.PlaceId == 5253186791 then -- id 2 is for tower of hell appeal
           loadstring(game:HttpGet("https://raw.githubusercontent.com/NoahCodeMaster/NoahsHub/main/Games/Toh.lua"))()
        else
            game.Players.LocalPlayer:Kick("The Game Isnt Supported to the script")
    end
end
