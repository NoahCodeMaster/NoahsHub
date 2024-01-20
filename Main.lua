local gameid = { 
    [1] = 1962086868, -- Tower Of Hell
    [2] = 13864661000, -- Break in 2 (lobby)
}

function notif(title, txt, dur)
    game.StarterGui:SetCore("SendNotification", {
    Title = title;
    Text = txt;
    Duration = dur;
})
end

if gameid then
    --- Tower Of Hell
    if game.PlaceId == gameid[1] or game.PlaceId == 5253186791 then
           loadstring(game:HttpGet("https://raw.githubusercontent.com/NoahCodeMaster/NoahsHub/main/Games/Toh.lua"))()
        else
    end
    ----- Break In 2
    if game.PlaceId == gameid[2] or game.PlaceId == 13864667823 then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/NoahCodeMaster/NoahsHub/main/Games/Breakin2.lua"))()
        else
    end
    -- Soon
end

if not gameid[game.PlaceId] then
    notif("Game Not Supported", "This Hub Isnt Supported for this game.", 5)
end
