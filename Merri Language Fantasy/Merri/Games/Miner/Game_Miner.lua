GameMinerState = Core.class( StateBase )

Map = Core.class()

function Map:init( options )
	-- Load tiles & characters
	self.textures = {
			ground = Texture.new( "Content/Games/Miner/Tiles/ground_dirt.png" ),
			wall = Texture.new( "Content/Games/Miner/Tiles/ground_cobblestone.png" ),
			ceiling = Texture.new( "Content/Games/Miner/Tiles/ground_darkstone.png" ),
			
			rock = Texture.new( "Content/Games/Miner/Tiles/rock.png" ),
			gemA = Texture.new( "Content/Games/Miner/Tiles/gemA.png" )
			gemB = Texture.new( "Content/Games/Miner/Tiles/gemB.png" )
			gemC = Texture.new( "Content/Games/Miner/Tiles/gemC.png" )
			gemD = Texture.new( "Content/Games/Miner/Tiles/gemD.png" )
			coinA = Texture.new( "Content/Games/Miner/Tiles/copper_coin.png" )
			coinB = Texture.new( "Content/Games/Miner/Tiles/silver_coin.png" )
			coinC = Texture.new( "Content/Games/Miner/Tiles/gold_coin.png" )
			sandwich = Texture.new( "Content/Games/Miner/Tiles/sandwich.png" )
			ladder = Texture.new( "Content/Games/Miner/Tiles/ladder_down.png" )
			snail = Texture.new( "Content/Games/Miner/Characters/enemy_snail.png" )
			mole = Texture.new( "Content/Games/Miner/Characters/enemy_mole.png" )
		}
		
	self.moveAmount = self.textures.ground:getWidth()
end

-- options.floor
function Map:Generate( options )
end

function GameMinerState:init( options )
	StateBase:init( options )
	StateBase:Setup( { backgroundScroll = false } )
end

-- Setup / Teardown --
function GameMinerState:Setup( options )
	self.enableLighting = true
	StateBase:SetGotoState( "" )
	
	-- Setup UI
	StateBase:SetBackground( { id = "background", 		path = "Content/Games/Miner/UI/miner_background.png",  pos_x = 0, pos_y = 0 } )
	
	self.textures = {
			black = Texture.new( "Content/Graphics/UI/blank_background.png" ),
		}
		
	self.sounds = {
		mining = Sound.new( "Content/Audio/mining.wav" ),
		collect = Sound.new( "Content/Audio/collect.wav" ),
		footsteps = Sound.new( "Content/Audio/footsteps.wav" ),
		hurt = Sound.new( "Content/Audio/hurt.wav" ),
		sword = Sound.new( "Content/Audio/sword.wav" )
	}
	
	self.fonts = {
		overhead = TTFont.new( "Content/Fonts/NotoSans-Bold.ttf", 9 ),
		hud = TTFont.new( "Content/Fonts/NotoSans-Bold.ttf", 14 )
	}
	
	-- Fade out graphic
	self.fadeCounter = 0
	self.transition = false
	self.fadeBitmap = Bitmap.new( self.textures.black )
	self.fadeBitmap:setAlpha( 0 )
end

function GameMinerState:Cleanup()
end

function GameMinerState:Draw()
end

function GameMinerState:SetupMap()
end

function GameMinerState:Update()
end

-- Callbacks --
function GameMinerState:Handle_AndroidKey( event )
end

function GameMinerState:Handle_KeyDown( event )
end

function GameMinerState:Handle_MouseDown( event )

end

function GameMinerState:TurnBasedUpdate()

end

function GameMinerState:GetDistance( x1, y1, x2, y2 )
	local xd = x1 - x2
	local yd = y1 - y2
	return math.sqrt( xd * xd + yd * yd )
end

function GameMinerState:Handle_EnterFrame( event )
end

function GameMinerState:ClearScreen()
	StateBase:ClearScreen()	
end

function GameMinerState:ClearWidgets()
	StateBase:ClearWidgets()
end

function GameMinerState:GotoState()
	return StateBase:GotoState()
end