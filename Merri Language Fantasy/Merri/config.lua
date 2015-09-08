--360, 640
GLOBAL_CONFIG = {
	HELPER_LANGUAGE = nil,
	TARGET_LANGUAGE = nil,
	PRONOUN = nil,
	SCREEN_WIDTH = 360,
	SCREEN_HEIGHT = 640,
	NAME = nil,
	BASE = nil,
	HAIR = nil,
	FACE = nil,
}

GLOBAL_LANGAUGES = { "English", "Esperanto", "Ido", "Spanish", "Ithkuil", "German", "Polish", "Japanese" }
GLOBAL_VERSION = "preview 2015-09-07"

function CLEAR_CONFIG()
	local savePath = "/sdcard/merri/"
	local backupPath = "|D|"
	local saveGame = "Whee.lua"
	local path = savePath .. saveGame
	
	require "lfs"
	local destFile = io.open( path, "wb" )
	
	if ( destFile == nil ) then
		print( path .. " failed" )
		path = backupPath .. saveGame
		destFile = io.open( path, "wb" )
	end
	
	if ( destFile == nil ) then
		-- Fatal error, could not create
		print( "ERROR: Could not create save game file!" )
		return false
	end
	
	CONFIG_WRITETOFILE( destFile, "function savegame()" )
	CONFIG_WRITETOFILE( destFile, "	game_data = {" )
	
	CONFIG_WRITETOFILE( destFile, "		HELPER_LANGUAGE = nil," )
	CONFIG_WRITETOFILE( destFile, "		TARGET_LANGUAGE = nil," )
	CONFIG_WRITETOFILE( destFile, "		SCREEN_WIDTH 		= 360," )
	CONFIG_WRITETOFILE( destFile, "		SCREEN_HEIGHT 		= 640," )
	CONFIG_WRITETOFILE( destFile, "		PRONOUN = nil," )
	CONFIG_WRITETOFILE( destFile, "		NAME = nil," )
	CONFIG_WRITETOFILE( destFile, "		BASE = nil," )
	CONFIG_WRITETOFILE( destFile, "		FACE = nil," )
	CONFIG_WRITETOFILE( destFile, "		HAIR = nil," )
	CONFIG_WRITETOFILE( destFile, "	}" )
	CONFIG_WRITETOFILE( destFile, "	return game_data" )	
	CONFIG_WRITETOFILE( destFile, "end" )
	
	destFile:close()
end

function SAVE_CONFIG()
	print( "Save game" )
	local savePath = "/sdcard/merri/"
	local backupPath = "|D|"
	local saveGame = "Whee.lua"
	local path = savePath .. saveGame
	
	require "lfs"
	local destFile = io.open( path, "wb" )
	
	if ( destFile == nil ) then
		print( path .. " failed" )
		path = backupPath .. saveGame
		destFile = io.open( path, "wb" )
	end
	
	if ( destFile == nil ) then
		-- Fatal error, could not create
		print( "ERROR: Could not create save game file!" )
		return false
	end

	CONFIG_WRITETOFILE( destFile, "function savegame()" )
	CONFIG_WRITETOFILE( destFile, "	game_data = {" )
	
	if ( GLOBAL_CONFIG.HELPER_LANGUAGE ~= nil ) then  		
	CONFIG_WRITETOFILE( destFile, "		HELPER_LANGUAGE = \"English\"," ) else print ( "Skip HELPER_LANGUAGE" ) end
	
	if ( GLOBAL_CONFIG.TARGET_LANGUAGE ~= nil ) then  	
	CONFIG_WRITETOFILE( destFile, "		TARGET_LANGUAGE = \"Esperanto\"," ) else print( "Skip TARGET_LANGUAGE" ) end
	
	if ( GLOBAL_CONFIG.SCREEN_WIDTH ~= nil ) then  			
	CONFIG_WRITETOFILE( destFile, "		SCREEN_WIDTH = 360," ) else print( "Skip SCREEN_WIDTH" ) end
	
	if ( GLOBAL_CONFIG.SCREEN_HEIGHT ~= nil ) then  			
	CONFIG_WRITETOFILE( destFile, "		SCREEN_HEIGHT = 640," ) else print( "Skip SCREEN_HEIGHT" ) end
	
	if ( GLOBAL_CONFIG.PRONOUN ~= nil ) then  			
	CONFIG_WRITETOFILE( destFile, "		PRONOUN = \"" .. GLOBAL_CONFIG.PRONOUN .. "\"," ) else print( "Skip PRONOUN" ) end
	
	if ( GLOBAL_CONFIG.NAME ~= nil ) then  			
	CONFIG_WRITETOFILE( destFile, "		NAME = \"" .. GLOBAL_CONFIG.NAME .. "\"," ) else print( "Skip NAME" ) end
	
	if ( GLOBAL_CONFIG.BASE ~= nil ) then  			
	CONFIG_WRITETOFILE( destFile, "		BASE = " .. GLOBAL_CONFIG.BASE .. "," ) else print( "Skip BASE" ) end
	
	if ( GLOBAL_CONFIG.FACE ~= nil ) then  			
	CONFIG_WRITETOFILE( destFile, "		FACE = " .. GLOBAL_CONFIG.FACE .. "," ) else print( "Skip FACE" ) end
	
	if ( GLOBAL_CONFIG.HAIR ~= nil ) then  			
	CONFIG_WRITETOFILE( destFile, "		HAIR = " .. GLOBAL_CONFIG.HAIR .. "," ) else print( "Skip HAIR" ) end
	
	
	CONFIG_WRITETOFILE( destFile, "	}" )
	--CONFIG_WRITETOFILE( destFile, "" )
	--CONFIG_WRITETOFILE( destFile, "	print( \"LOAD GAME: \" )" )
	--CONFIG_WRITETOFILE( destFile, "	for key, value in pairs( game_data ) do" )
	--CONFIG_WRITETOFILE( destFile, "		print( key, \" = \", value )" )
	--CONFIG_WRITETOFILE( destFile, "	end" )
	--CONFIG_WRITETOFILE( destFile, "" )
	CONFIG_WRITETOFILE( destFile, "	return game_data" )	
	CONFIG_WRITETOFILE( destFile, "end" )
	
	destFile:close()
	
	return true
end

function LOAD_CONFIG()
	require "lfs"
	
	local savePath = "/sdcard/merri/"
	local backupPath = "|D|"
	local saveGame = "Whee.lua"
	local path = savePath .. saveGame
	
	local loaded = DO_FILE( path )
	if ( loaded == nil ) then
		path = backupPath .. saveGame
		loaded = DO_FILE( path )
	end
	
	if ( loaded == nil ) then
		print( "Error loading game file from ", path )
	else
		loaded()
		GLOBAL_CONFIG = savegame()
	end
	
	for key, value in pairs( GLOBAL_CONFIG ) do
		print( key, ": ", value )
	end
end

function DO_FILE( filename )
	require "lfs"
	
	print( "Do file ", filename )
	
	local sourceFile = io.open( filename, "rb" )
	if ( sourceFile == nil ) then 
		print( "File doesn't exist" )
		return nil 
	end
	
	local f = assert( loadfile( filename ) )

	if ( f == nil ) then
		print( "problem executing" )
		return nil
	end

	return f
end

function CONFIG_WRITETOFILE( dest, str )
	print( "\n" .. str )
	dest:write( "\n" .. str )
end


