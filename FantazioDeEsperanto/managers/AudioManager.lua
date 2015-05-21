AudioManager = Core.class()

function AudioManager:init()
	--self.waves = Sound.new( "Audio/wave.wav" )
	
	self.songs = {
		titlescreen = Sound.new( "content/audio/WorldMap_tgfcoder.mp3" ),
		minigame1 = Sound.new( "content/audio/Happy_tgfcoder.mp3" ),
		minigame2 = Sound.new( "content/audio/Forest_tgfcoder.mp3" ),
		minigame3 = Sound.new( "content/audio/Bouncy_tgfcoder.mp3" ),
	}
	
	self.sfx = {
		confirm = Sound.new( "content/audio/menu_confirm.wav" ),
		cancel = Sound.new( "content/audio/menu_cancel.wav" ),
		incorrect = Sound.new( "content/audio/incorrect.wav" ),
		correct = Sound.new( "content/audio/correct.wav" ),
		attack = Sound.new( "content/audio/attack.wav" ),
	}
	
	self.musicChannel = nil
	self.currentSong = ""
end

function AudioManager:PlayEffect( key )
	local channel = self.sfx[ key ]:play()
	channel:setVolume( 0.5 )
end

function AudioManager:PlaySong( key )	
	
	if ( self.currentSong ~= key ) then	
		if self.musicChannel ~= nil then
			self.musicChannel:stop()
		end
	
		self.currentSong = key
		self.musicChannel = self.songs[ key ]:play( 0, true )
		self.musicChannel:setVolume( 0.5 )
	end
end

function AudioManager:PlaySpecial( key )
	local filepath = "content/audio/spoken/" .. key .. ".mp3"

	require "lfs"
    local destFile = io.open( filepath, "rb" )
	if destFile == nil then 
		print( "File not found: " .. key )
		return 
	end
	
	print( "play sound", key )
		local dialog = Sound.new( filepath )
		if dialog ~= nil then
			dialog:play()
		end
end
