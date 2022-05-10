# news
This script is a simple, image based newspaper script. Some of the main features are:

- Supports any number of pages
- Multiple locations (add more in config.lua file), or use qb-target on newspaper dispencer models.
- Supports image sources from web address, allowing updates without restarting script (see info in config.lua, replacing “weblocation” with the web address of your file folder).

Click to open the next page. Use Esc to stop viewing. It’s a pretty minimal, light-weight script that could easily be adapted for other uses (photo books, comic books, server rules, etc.).

# qb-target configuration
Edit commenting in client.lua
```lua
--[[Using qb-target]]--
exports['qb-target']:AddTargetModel(1211559620, { -- Red Daily Rag Dispenser
...
})
--[[]]--

--[[Using draw text based on locations
Citizen.CreateThread(function ()
...
end
]]--
```
# standalone configuration
Edit commenting in client.lua
```lua
--[[Using qb-target
exports['qb-target']:AddTargetModel(1211559620, { -- Red Daily Rag Dispenser
...
})
]]--

--[[Using draw text based on locations]]--
Citizen.CreateThread(function ()
...
end
--[[]]--
```
