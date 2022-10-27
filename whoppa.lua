local DiscordLib = loadstring(game:HttpGet "https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/discord")()

_G.ff = DiscordLib
_G.sf = DiscordLib:Window("Whopper Hub")

local win = _G.sf

local serverUrl =  "https://raw.githubusercontent.com/AngeLz79/Whopper-Hub/main/"

coroutine.wrap(function()    
    local id = game.PlaceId
    print('loading game: '..id)
    local gameFile = loadstring(game:HttpGet(serverUrl.."assets/"..id..'.lua'))() or false
    if gameFile then
        gameFile()
        print("loaded game")
    else
        print("Game not supported")
    end
end)()

local whop = win:Server("Whopper Hub", "")
local main = whop:Channel("Main")
local misc = whop:Channel("Misc")

main:Button(
    "Get Player Coords",
    function ()
        -- get player position
        local playerPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        DiscordLib:Notification("AngeLz Utilities", "Player Coords: " .. playerPos.X .. ", " .. playerPos.Y .. ", " .. playerPos.Z, "Okay")
    end
)

-- makes a textbox
main:Textbox(
    "Teleport to Coords - UNSTABLE",
    "X Y Z",
    true,
    function(t)
        local coords = t:split(" ")
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(coords[1], coords[2], coords[3])
    end
)

main:Textbox(
    "Teleport to Player",
    "WhopperMan2000",
    true,
    function(target)
        -- gets the target CFrame
        local CFrame = game:GetService("Workspace")[target].HumanoidRootPart.CFrame
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame
    end
)

main:Button(
    "Infinite Yield Admin",
    function()
        local co = coroutine.wrap(
            function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
            end
        )
        local status, err = pcall(co)
        if not status then
            DiscordLib:Notification("Error While Starting Infinite Yield Admin", err, "Okay!")
        else
            DiscordLib:Notification("Notification", "Started Infinite Yield Admin", "Okay!")
        end
    end
)
main:Button(
    "CMD-X",
    function()
        local co = coroutine.wrap(
            function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source",true))()
            end
        )
        local status, err = pcall(co)
        if not status then
            DiscordLib:Notification("Error While Starting CMD-X", err, "Okay!")
        else
            DiscordLib:Notification("Notification", "Started CMD-X", "Okay!")
        end
    end
)
main:Button(
    "Copy Discord Link",
    function()
        setclipboard("https://discord.gg/2hwgsF2qaW")
        DiscordLib:Notification("Copied","Discord Invite Code Copied to clipboard.","Okay")
    end
)

-- makes a slider
local sldr =
misc:Slider(
    "Speed",
    16,
    250,
    0,
    function(t)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = t
    end
)

-- makes another slider to control jump height

local sldr2 =
misc:Slider(
    "Jump",
    50,
    250,
    0,
    function(t)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = t
    end
)
