set:AddButton({
    Name = "Discord Invite Link",
    Callback = function()
      setclipboard("https://discord.gg/m4jMgc8pga")
    end
})

set:AddButton({
    Name = "File Loader Setup (Soon)",
    Callback = function()
      
    end
})

set:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})
