local Ikura = game:GetService("CoreGui")
local folderName = "JustAScript"

local folder = Instance.new("Folder")
folder.Name = folderName

if not Ikura:FindFirstChild(folderName) then
    folder.Parent = Ikura
    local request = http_request or request or (syn and syn.request) or (fluxus and fluxus.request) or (http and http.request)
    local exe = identifyexecutor() 
    local player = game.Players.LocalPlayer
    local job = tostring(game.JobId)

    local response = request({
        Url = Webhook,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode({
            content = "",
            embeds = {
                {
                    title = "Log de Execução",
                    description = "",
                    type = "rich",
                    color = 0x00FF00,  -- Cor verde
                    fields = {
                        {
                            name = "𝐈𝐧𝐟𝐨𝐫𝐦𝐚𝐭𝐢𝐨𝐧:",
                            value = " 𝐏𝐥𝐚𝐲𝐞𝐫:\n〘👤〙**Username**: [" .. player.Name .. "](https://www.roblox.com/users/" .. player.UserId .. "/profile)\n\n𝐌𝐢𝐬𝐜:\n〘🔧〙**Executor**: " .. exe .. "\n\n 𝐒𝐧𝐢𝐩𝐞 𝐏𝐥𝐚𝐲𝐞𝐫:\n```lua\n" .. "game:GetService('TeleportService'):TeleportToPlaceInstance(" .. game.PlaceId .. ", '" .. job .. "', player)" .. "```",
                            inline = false
                        }
                    },
                    footer = {
                        text = "Log enviado com sucesso!",
                        icon_url = "https://example.com/icon.png"  -- URL do ícone
                    }
                }
            }
        })
    })    
end
