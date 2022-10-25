return function()
    if not _G.sf then
        print("Don't run directly")
    end

    local win = _G.sf
    local DiscordLib = _G.ff
    local serv = win:Server("Refinery Caves", "")
    local main = serv:Channel("Main")
    local misc = serv:Channel("Misc")
    local afarm = serv:Channel("Auto Farm")
    local timeout = 0.05 -- 50ms
    local teleports = serv:Channel("Teleports")
    misc:Slider("Speed",16,250,0,
        function(t)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = t
        end
    )
    misc:Slider("Jump",50,250,0,
        function(t)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = t
        end
    )
    local function teleportBTN(x,y,z, name)
        teleports:Button(
            name,
            function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x,y,z)
            end
        )    
    end
    teleportBTN(-913,3,-671,"Spawn")
    teleports:Button(
        "Plot",
        function()
            for i, v in next, game:GetService("Workspace").Plots:GetChildren() do
                if v.Owner.Value == game.Players.LocalPlayer then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Base.CFrame + Vector3.new(0, 25, 0)
                end
            end
        end
    )
    teleportBTN(-1005,3,-613,"UCS")
    teleportBTN(-1007,4.74,-728,"Land Agency")
    teleportBTN(-1028,4,-589.5,"Delivery Man")
    teleportBTN(-822.2,60,-609,"Green Block")
    teleportBTN(-1574,-6.4,-518.75,"Dock")
    teleportBTN(-1333,-3.3,-437,"Shore")
    teleportBTN(-1412,-14,-285.2,"Rusty Boat")
    teleportBTN(-1225, 78.7, -103, "Bloxy Cola")
    teleportBTN(-466,5.75,13,"Wood Store")
    teleportBTN(-460,3.85,-95.5,"Sell Area")
    teleportBTN(-1018.8,4.25,690.5,"Furniture Store")
    teleportBTN(709.9,8.25,-966.97,"Dealership")
    teleportBTN(734, 2.25, 55,"Pickaxe Store")
    teleportBTN(-108.75,240,1128.46,"Logic Store")
    teleportBTN(-496, 4.25, -655,"Secret Stash")
    teleportBTN(130, 88, 1073, "Trusty Pickaxe Area")
    teleportBTN(-795, -4.25, 2750, "Facility")
    teleportBTN(-763, -55, 2529, "RadiRug")
    teleportBTN(-3475, 17.9, 1040,"Meteor Rug")
    teleportBTN(-2153, -12.9, -1622,"Island")
    teleportBTN(-596, 194, 1058, "Cable Railway")
    teleportBTN(480, 300, 708, "Meteor Bowl")
    teleportBTN(612, 986, 1519, "Mountain Chair")
    main:Button(
        "Spawn Meteor",
        function()
            -- justs makes sure its not in the ground
            if game:GetService("Workspace").Grabable["Meteorite Totem"].Ball.CFrame.Y < 2 then
                return
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Grabable["Meteorite Totem"].Ball.CFrame
            task.wait(0.1) 
            local args = {
                [1] = game:GetService("Workspace").Grabable["Meteorite Totem"].Ball,
                [2] = {}
            }
            
            game:GetService("ReplicatedStorage").Events.Grab:InvokeServer(unpack(args))
            task.wait(0.5)
            game:GetService("Workspace").Grabable["Meteorite Totem"].Ball.CFrame = CFrame.new(490.649658203125, 303.3324890136719, 710.9194946289062)
            task.wait(0.3)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Grabable["Meteorite Totem"].Ball.CFrame + Vector3.new(0,10,0)
            DiscordLib:Notification("Notification", "Meteor Spawning soon...", "Okay!")
        end
    )
    main:Button(
        "Spawn Meteor V2",
        function()
            -- get player location
            local playerPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
            if game:GetService("Workspace").Grabable["Meteorite Totem"].Ball.CFrame.Y < 2 then
                return
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Grabable["Meteorite Totem"].Ball.CFrame
            task.wait(0.1) 
            game:GetService("ReplicatedStorage").Events.Grab:InvokeServer(game:GetService("Workspace").Grabable["Meteorite Totem"].Ball,{})
            task.wait(0.5)
            game:GetService("Workspace").Grabable["Meteorite Totem"].Ball.CFrame = CFrame.new(490.649658203125, 303.3324890136719, 710.9194946289062)
            task.wait(0.3)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(playerPos.X, playerPos.Y, playerPos.Z)
            DiscordLib:Notification("Notification", "Meteor Spawning soon...", "Okay!")
        end
    )
    main:Button(
        "Fix Meteor Totem",
        function()
            game:GetService("Workspace").Grabable["Meteorite Totem"].Ball.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            task.wait(0.5)
            game:GetService("Workspace").Grabable["Meteorite Totem"].Ball.CFrame = CFrame.new(0, -900,0)
            DiscordLib:Notification("Notification", "Meteor Totem Fixed", "Okay!")
        end
    )
    local function getTrusty(noError)
        noError = noError or false
        -- 135, 88, 1088 outside of give area
        -- 
        local notS, notR, notI = false, false, false
        -- pre check if all 3 pickaxes are existing
        for i, v in next, game:GetService("Workspace").Grabable:GetChildren() do
            if v.Name == "Boxed Stone Pickaxe" then
                notS = true
            elseif v.Name == "Boxed Rusty Pickaxe" then
                notR = true
            elseif v.Name == "Boxed Iron Pickaxe" then
                notI = true
            end
        end
        if not notS or not notR or not notI and not noError then
            DiscordLib:Notification("Notification", "Pickaxes Haven't Regenerated yet!", "Okay!")
            return
        end
        for i,v in next, game:GetService("Workspace").Grabable:GetChildren() do
            if ((v.Name == "Boxed Stone Pickaxe" and notS) or (v.Name == "Boxed Rusty Pickaxe" and notR) or (v.Name == "Boxed Iron Pickaxe" and notI)) and v:FindFirstChild("Part") then
                if v.Name == "Boxed Stone Pickaxe" then
                    notS = false
                elseif v.Name == "Boxed Rusty Pickaxe" then
                    notR = false
                elseif v.Name == "Boxed Iron Pickaxe" then
                    notI = false
                end
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Part.CFrame
                game:GetService("ReplicatedStorage").Events.Grab:InvokeServer(v.Part,{})
                task.wait(0.1)
                v:FindFirstChild("Part").CFrame = CFrame.new(143, 83, 1105)
                task.wait(1)
            end
        end
        task.wait(0.1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135, 88, 1088)
    end
    main:Button(
        "Give Trusty Pickaxe",
        getTrusty
    )
    
    local teleportOre = serv:Channel("Teleports: Ore")
    local function teleportToOreBTN(rockType) 
        teleportOre:Button(
            rockType,
            function()
                for i, v in next, game:GetDescendants() do
                    if v.Name == "RockString" and v:IsA("StringValue") and v.Value == rockType then
                        for i2, v2 in next, v.Parent:GetDescendants() do
                            if v2.Name == "Hitbox" then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v2.CFrame + Vector3.new(0, 5, 0)
                                return
                            end
                        end
                    end
                end
                DiscordLib:Notification("Notification", "Could not find ore", "Okay!")
            end
        )
    end
    
    -- get all ores
    local array = {
        "Rock",
        "Stone",
        "Sandstone",
        "Limestone",
        "Granite",
        "Marble",
        "Copper",
        "Silver",
        "Iron",
        "Gold",
        "Emerald",
        "Ruby",
        "Amethyst",
        "Sapphire",
        "Oddstone",
        "Sunstone",
        "Crystal",
        "Cloudnite",
        "Obsidian",
        "Volcanium",
        "Moonstone",
        "Tolmedit",
        "Dumortierite"
    }
    teleportOre:Button(
        "Teleport Ores to Plot",
        function()
            local pos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
            for _, v in next, game:GetService("Workspace").Grabable:GetChildren() do
                if v:FindFirstChild("Owner") and v:FindFirstChild("Configuration") and v.Configuration:FindFirstChild("Data") 
                and v.Configuration.Data:FindFirstChild("MatInd") and v.Configuration.Data:FindFirstChild("Size") then
                    if v.Owner.Value == game.Players.LocalPlayer then
                        -- finds the plot
                        for _, l in next, game:GetService("Workspace").Plots:GetChildren() do
                            if l.Owner.Value == game.Players.LocalPlayer then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Part.CFrame
                                task.wait(timeout)
                                v.Part.CFrame = l.Base.CFrame + Vector3.new(0, 25, 0)
                            end
                        end
                    end
                end
            end
            task.wait(timeout)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos.X, pos.Y, pos.Z)
        end
    )
    teleportOre:Button(
        "Teleport Ores to Current Pos",
        function()
            local pos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
            for _, v in next, game:GetService("Workspace").Grabable:GetChildren() do
                if v:FindFirstChild("Owner") and v:FindFirstChild("Configuration") and v.Configuration:FindFirstChild("Data") 
                and v.Configuration.Data:FindFirstChild("MatInd") and v.Configuration.Data:FindFirstChild("Size") then
                    if v.Owner.Value == game.Players.LocalPlayer then
                        for _, l in next, game:GetService("Workspace").Plots:GetChildren() do
                            if l.Owner.Value == game.Players.LocalPlayer then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Part.CFrame
                                v.Part.CFrame = CFrame.new(pos.X, pos.Y, pos.Z)
                                task.wait(timeout)
                            end
                        end
                    end
                end
            end
            task.wait(timeout)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos.X, pos.Y+3, pos.Z)
        end
    )
    teleportOre:Button(
        "Teleport Ores to Sell",
        function()
            for _, v in next, game:GetService("Workspace").Grabable:GetChildren() do
                if v:FindFirstChild("Owner") and v:FindFirstChild("Configuration") and v.Configuration:FindFirstChild("Data") 
                and v.Configuration.Data:FindFirstChild("MatInd") and v.Configuration.Data:FindFirstChild("Size") then
                    if v.Owner.Value == game.Players.LocalPlayer then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Part.CFrame
                        task.wait(timeout)
                        -- places the ore in the sell area
                        -- v.Part.CFrame = CFrame.new(-420, 12, -75)
                        -- places it somewhere randomly inside from -404, 8,-85 to -439, 8,-67
                        v.Part.CFrame = CFrame.new(math.random(404, 436)*-1, 8, math.random(67,85)*-1)
                    end
                end
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-455,5.75,-57.7)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Map.Sellary.Keeper.IPart.CFrame
            task.wait(1)
            workspace.Map.Sellary.Keeper.IPart.Interact:FireServer()
            task.wait(1)
            for i, v in pairs(
                getconnections(
                    game:GetService("Players").LocalPlayer.PlayerGui.UserGui.Dialog:WaitForChild("Yes").MouseButton1Click
                )
            ) do
                v:Fire()
            end
        end
    )
    local time = 0.05
    teleportOre:Slider(
        "Teleport Ores Speed",
        0,
        500,
        5,
        function(value)
            time = value/100
        end
    )
    coroutine.wrap(
        function()
            while true do
                -- get user ping
                task.wait(1)
                local ping = math.floor((game.Players.LocalPlayer:GetNetworkPing()*3))
                timeout = ping+time    
            end
        end
    )()
    teleportOre:Seperator()
    for i,v in next, array do
        teleportToOreBTN(v)
    end
    -- checks if a player presses the F key
    local function checkF()
        local plr = game.Players.LocalPlayer
        local mouse = plr:GetMouse()
        mouse.KeyDown:Connect(
            function(key)
                if key == "f" then
                    for r, i in next, game:GetService("Workspace").Grabable:GetDescendants() do
                        if i.Name == "Grab" then
                            if i:FindFirstChild("Plr") then
                                for t, b in next, game:GetService("Workspace").Plots:GetChildren() do
                                    if b.Owner.Value == game.Players.LocalPlayer then
                                        i.Parent.CFrame = b.Base.CFrame + Vector3.new(0, 25, 0)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        )
    end
    checkF()
    -- checks if a player presses the G key
    local function checkG()
        local plr = game.Players.LocalPlayer
        local mouse = plr:GetMouse()
        mouse.KeyDown:Connect(
            function(key)
                if key == "g" then
                    for r, i in next, game:GetService("Workspace").Grabable:GetDescendants() do
                        if i.Name == "Grab" then
                            if i:FindFirstChild("Plr") then
                                i.Parent.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                            end
                        end
                    end
                end
            end
        )
    end
    local function checkH()
        local plr = game.Players.LocalPlayer
        local mouse = plr:GetMouse()
        mouse.KeyDown:Connect(
            function(key)
                if key == "h" then
                    for r, i in next, game:GetService("Workspace").Grabable:GetDescendants() do
                        if i.Name == "Grab" then
                            if i:FindFirstChild("Plr") then
                                i.Parent.CFrame = CFrame.new(-455,5.75,-57.7)
                            end
                        end
                    end
                end
            end
        )
    end
    checkH()
    checkG()
    -- -- Auto farm scripts
    -- local onTp = false
    -- coroutine.wrap(function()
    --     while true do 
    --         if onTp then
    --             getTrusty(true)                
    --             task.wait(10)
    --             -- moves the trusty pickaxe to the plot
    --             for _, v in next, game:GetService("Workspace").Plots:GetChildren() do
    --                 if v.Owner.Value == game.Players.LocalPlayer then
    --                     -- places player on the trusty pickaxe
    --                     for i, v in next, game:GetService("Workspace").Grabable:GetChildren() do
    --                         if v:FindFirstChild("Owner") and v:FindFirstChild("Configuration") and v.Configuration:FindFirstChild("Data") 
    --                         and v.Configuration.Data:FindFirstChild("MatInd") and v.Configuration.Data:FindFirstChild("Size") then
    --                             if v.Owner.Value == game.Players.LocalPlayer then
    --                                 if v.Configuration.Data.MatInd.Value == 1 then
    --                                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Part.CFrame
    --                                     task.wait(timeout)
    --                                     v.Part.CFrame = l.Base.CFrame + Vector3.new(0, 25, 0)
    --                                 end
    --                             end
    --                         end
    --                     end
    --                     for i,v in next, game:GetService("Workspace").Grabable:GetChildren() do
    --                         if v.Name == "Trusty Pickaxe" and v:FindFirstChild("Part") and v:FindFirstChild("Owner") then
    --                             for t, b in next, game:GetService("Workspace").Plots:GetChildren() do
    --                                 if b.Owner.Value == game.Players.LocalPlayer then
    --                                     if v.Owner.Value == game.Players.LocalPlayer then
    --                                         v.Part.CFrame = v.Base.CFrame + Vector3.new(0, 25, 0)
    --                                     end
    --                                 end
    --                             end
    --                         end
    --                     end
    --                 end
    --             end
    --         end
    --         task.wait(10)
    --     end
    -- end)()
    -- -- spawn car that player is in
    -- local function spawnCarStand()
    -- end
    -- -- auto farm neon car that player is standing on top of
    -- local onNc = false
    -- coroutine.wrap(function()
    --     while true do
    --         if onNc then
    --             for i, v in next, game:GetService("Workspace").Vehicles:GetChildren() do
    --                 if v:FindFirstChild("Owner") and v:FindFirstChild("Configuration") and v.Configuration:FindFirstChild("Data") 
    --                 and v.Configuration.Data:FindFirstChild("MatInd") and v.Configuration.Data:FindFirstChild("Size") then
    --                 end
    --             end
    --         end
    --         task.wait(1)
    --     end
    -- end)()
    -- game:GetService("Workspace").Vehicles
    afarm:Label("This is a work in progress")
    afarm:Label("Current Build Doesn't Support Auto Farm")
    -- afarm:Toggle("Trusty Pickaxe", false,function(on)
    --     onTp = on
    -- end)
    -- afarm:Toggle("Neon Car Farm", false,function(on)
    --     onNc = on
    -- end)
    main:Label("Hotkeys")
    main:Label("F - Teleport ores to plot")
    main:Label("G - Teleport ores to you")
    main:Label("H - Teleport ores to sell")    
end
