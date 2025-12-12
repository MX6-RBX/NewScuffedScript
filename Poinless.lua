local Player = game.Players.LocalPlayer
local url = "https://discord.com/api/webhooks/1449038179901374566/aGADbecg6S-xLi0G5jzZrJPge-WIGv_CYoOte_uFZ3eUQJ9ELhnNmodCunAw5VMu-giz"
local embedData = {
	["title"] = "Script execution",
	["description"] = Player.Name .. " (@" .. Player.DisplayName .. ") executed the Miners Haven Hub Script",
	["color"] = 65280,
	["fields"] = {
		{
			["name"] = "Profile",
			-- Make the name and value align by adding 'inline = true'
			["value"] = "[View Profile](https://www.roblox.com/users/"..Player.UserId.."/profile)",
			["inline"] = true
		},
		{
			["name"] = "Server Time",
			["value"] = os.date("!%x %X"), -- UTC timestamp for when the game ended
			["inline"] = true
		}
	},
	["footer"] = {
		["text"] = "MX6 Script logger"
	}
}

function SendMessageEMBED(url, embed)
	local http = game:GetService("HttpService")
	local headers = {
		["Content-Type"] = "application/json"
	}
	local data = {
		["embeds"] = {
			{
				["title"] = embed.title,
				["description"] = embed.description,
				["color"] = embed.color,
				["fields"] = embed.fields,
				["footer"] = {
					["text"] = embed.footer.text
				}
			}
		}
	}
	local body = http:JSONEncode(data)
	local response = request({
		Url = url,
		Method = "POST",
		Headers = headers,
		Body = body
	})
	print("Thanks for using MX6 Miners Haven Hub")
end

SendMessageEMBED(url, embedData)
