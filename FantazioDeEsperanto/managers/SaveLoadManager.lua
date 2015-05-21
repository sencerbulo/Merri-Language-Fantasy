SaveLoadManager = Core.class()

function SaveLoadManager:init()
	self.savegamePath = "/sdcard/" .. languageManager:GetString( "path" ) .. "/"
	self.backupPath = "|D|" .. languageManager:GetString( "path" ) .. "/"
	self.usePath = self.savegamePath
	self.savegameFile = "config.lua"
	
	SaveLoadManager.savedata = {}
end

function SaveLoadManager:CreateGame()
	if ( self:DoesGameExist() == true ) then
		return
	end
	debugManager:Log( "SaveLoadManager:CreateGame", "Create save file" )

	-- Create save game file if none exists
	require "lfs"
	local destFile = io.open( self.usePath .. self.savegameFile, "wb" )
	
	if ( destFile == nil ) then
		print( self.usePath .. " failed" )
		self.usePath = self.backupPath
		destFile = io.open( self.usePath .. self.savegameFile, "wb" )
	end
	
	if ( destFile == nil ) then
		-- Fatal error, could not create
		print( "ERROR: Could not create save game file!" )
		debugManager:Error( "SaveLoadManager:CreateGame", "Could not create save game file!" )
		return false
	end
	
	print( "Create new save game file" )
	-- Create starter info
	
	self:WriteToFile( destFile, "function princess()" )
	self:WriteToFile( destFile,  "	return {" )
	
	self:WriteToFile( destFile,  "		gemCount = 0," )
	
	self:WriteToFile( destFile,  "		levelInfo = {" )
	self:WriteToFile( destFile,  "			{ title = \"morning-1\",	unlocked = true }, " )
	self:WriteToFile( destFile,  "			{ title = \"morning-2\",	unlocked = false }, " )
	self:WriteToFile( destFile,  "			{ title = \"morning-3\",	unlocked = false }, " )
	self:WriteToFile( destFile,  "			{ title = \"morning-4\",	unlocked = false }, " )
	self:WriteToFile( destFile,  "			{ title = \"morning-5\",	unlocked = false }, " )
	self:WriteToFile( destFile,  "		}," )
	
	self:WriteToFile( destFile,  "		playerInfo = {" )
	self:WriteToFile( destFile,  "			base = \"A\"," )
	self:WriteToFile( destFile,  "			hair = \"A\"," )
	self:WriteToFile( destFile,  "			hairColor 	= \"A\"," )
	self:WriteToFile( destFile,  "			outfit = \"A\"," )
	self:WriteToFile( destFile,  "		}," )
	
	self:WriteToFile( destFile,  "		storeInfo = {" )
	self:WriteToFile( destFile,  "			{ type = \"sash\",		title = \"blue-sash\",		purchased = false }, " )
	self:WriteToFile( destFile,  "			{ type = \"tiara\",		title = \"blue-tiara\",		purchased = false }, " )
	self:WriteToFile( destFile,  "			{ type = \"dress\",		title = \"blue-dress\",	purchased = false }, " )
	self:WriteToFile( destFile,  "		}," )
	
	self:WriteToFile( destFile,  "		options = {" )
	self:WriteToFile( destFile,  "			soundVolume = 100," )
	self:WriteToFile( destFile,  "			musicVolume = 100," )
	self:WriteToFile( destFile,  "		}," )
	
	self:WriteToFile( destFile, "	}" )
	self:WriteToFile( destFile, "end" )
	
	destFile:close()
end

function SaveLoadManager:WriteToFile( dest, str )
	dest:write( "\n" .. str )
end

function SaveLoadManager:DoesGameExist()
	require "lfs"
	local result = true
	local sourceFile = io.open( self.usePath .. self.savegameFile, "rb" )
	
	if ( sourceFile == nil ) then
		self.usePath = self.backupPath
		sourceFile = io.open( self.usePath .. self.savegameFile, "rb" )
	end
	
	if ( sourceFile == nil ) then
		-- Could not find file
		result = false
	end
	
	if ( result == true ) then
		print( "Use path:", self.usePath )
	end
	
	return result
end

function SaveLoadManager:DoFile( filename )
	require "lfs"
	local f = assert( loadfile( filename ) )
	
	if ( f == nil ) then
		return nil
	end
	
	return f
end

function SaveLoadManager:LoadGame()
	debugManager:Log( "SaveLoadManager:LoadGame", "Load game file" )
	-- If a saved game exists, load it
	-- This will generally happen at the beginning of the game
	print( "Load savegame: ", self.usePath .. self.savegameFile )

    local loaded = self:DoFile( self.usePath .. self.savegameFile )
	 
	if ( loaded == nil ) then
		print( "Error loading savegame file" )
		debugManager:Error( "SaveLoadManager:LoadGame", "Error loading save file at \"" .. self.usePath .. self.savegameFile .. "\"" )
		return false
	else	
		loaded()
		SaveLoadManager.savedata = princess()
	end
end

function SaveLoadManager:SaveGame()
	debugManager:Log( "SaveLoadManager:SaveGame", "Save game file" )
	-- Save latest information to the savegame file.
	-- This includes current # of gems, which levels have been beaten,
	-- character appearance, and which store items have been unlocked.
	
	if ( SaveLoadManager.savedata == nil ) then
		-- need to load existing data to update 
	end
end