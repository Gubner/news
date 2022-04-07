Config = {}

Config.NewsLocations = {
	[1] = {NewsLocation = vector3(257.38, -631.322, 40.54)}, -- Integrity Apartments
	[2] = {NewsLocation = vector3(-232.10, -972.23, 28.79)}, -- Alta Apartments
	[3] = {NewsLocation = vector3(392.96, -986.07, 28.92)}, -- LSPD (across the street)
	[4] = {NewsLocation = vector3(-476.88, -248.84, 35.44)}, -- City Hall
	[5] = {NewsLocation = vector3(-54.94, -1755.62, 28.94)}, -- Davis/Grove Gas Station
	[6] = {NewsLocation = vector3(-1243.94, -914.98, 11.02)}, -- City Flyers
}


--[[ You can change the image storage location to a web address. Images must be named "page1.jpg", "page2.jpg", "page3.jpg", etc.

Edit <img> in index.html file:

	Use this for web location:
		
		<img src="https://weblocation/page1.jpg" id="img" alt="image not found" onerror=this.src="https://weblocation/page1.jpg" onclick="changePage(this);">

	Use this for local files:
		
		<img src="page1.jpg" id="img" alt="image not found" onerror=this.src="page1.jpg" onclick="changePage(this);">

]]--
