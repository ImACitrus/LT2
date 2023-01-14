local module = {}

local Ws = game:GetService("Workspace")
local players = game:GetService("Players")

local player = players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:FindFirstChildWhichIsA("Humanoid")


function module:TeleportToRegion(region, callback: (selected_location: string?)->())
    local regions = {
        swamp = {
            Name = "Swamp",
            Position = {80, -20, -74.2999
                CFrame = {x = 80, y = -20, z = -74},
                Offset = {x = 0, y = 15, z = 0}
            },
            Offset = {x = 0, y = 0, z = 0}
            accessable = true
        },
        sandislands = {
            Name = "SandIslands",
            Position = {
                CFrame = {x = 0, y = 0, z = 0},
                Offset = {x = 0, y = 0, z = 0}
            },
            accessable = true
        },
        main = {
            Name = "Main",
            Position = {
                CFrame = {x = 0, y = 0, z = 0},
                Offset = {x = 0, y = 0, z = 0}
            },
            accessable = true
        },
        underbridge = {
            Name = "Underbridge",
            Position = {
                CFrame = {x = 0, y = 0, z = 0},
                Offset = {x = 0, y = 0, z = 0}
            },
            accessable = false
        },
        snowpeak = {
            Name = "SnowPeak",
            Position = {
                CFrame = {x = 0, y = 0, z = 0},
                Offset = {x = 0, y = 0, z = 0}
            },
            accessable = true
        },
        mountainside = {
            Name = "Mountainside",
            Position = {
                CFrame = {x = 0, y = 0, z = 0},
                Offset = {x = 0, y = 0, z = 0}
            },
            accessable = true
        },
        littlemeadow = {
            Name = "LittleMeadow",
            Position = {
                CFrame = {x = 0, y = 0, z = 0},
                Offset = {x = 0, y = 0, z = 0}
            },
            accessable = false
        },
        volcano = {
            Name = "Volcano",
            Position = {
                CFrame = {x = 0, y = 0, z = 0},
                Offset = {x = 0, y = 0, z = 0}
            },
            accessable = true
        },
        plains = {
            Name = "Plains",
            Position = {
                CFrame = {x = 0, y = 0, z = 0},
                Offset = {x = 0, y = 0, z = 0}
            },
            accessable = true
        },
        mazecave = {
            Name = "MazeCave",
            Position = {
                CFrame = {x = 0, y = 0, z = 0},
                Offset = {x = 0, y = 0, z = 0}
            },
            accessable = true
        },
        watercave = {
            Name = "WaterCave",
            Position = {
                CFrame = {x = 0, y = 0, z = 0},
                Offset = {x = 0, y = 0, z = 0}
            },
            accessable = true
        },
        snow = {
            Name = "Snow",
            Position = {
                CFrame = {x = 0, y = 0, z = 0},
                Offset = {x = 0, y = 0, z = 0}
            },
            accessable = true
        },
    }
    
    local regionDict = regions[string.lower(region)].accessable and regions[string.lower(region)]
    local location = Ws[regionDict.Name]

    local position = regionDict.Position
    local cframe, offset = position.CFrame, position.Offset

    if location then
        character:PivotTo( CFrame.new(cframe.x, cframe.y, cframe.z) * CFrame.new(offset.x, offset.y, offset.z) )
        callback(location.Name)
    else
        callback()
    end
end

return module
