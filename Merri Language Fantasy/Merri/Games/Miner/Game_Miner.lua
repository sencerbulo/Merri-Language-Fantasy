GameMinerState = Core.class( StateBase )

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
			
			hud_down = Texture.new( "Content/Games/Miner/UI/hud_down.png" ),
			hud_left = Texture.new( "Content/Games/Miner/UI/hud_left.png" ),
			hud_right = Texture.new( "Content/Games/Miner/UI/hud_right.png" ),
			hud_up = Texture.new( "Content/Games/Miner/UI/hud_up.png" ),
			
			hud_pick = Texture.new( "Content/Games/Miner/UI/hud_pick.png" ),
			hud_sword = Texture.new( "Content/Games/Miner/UI/hud_sword.png" ),
		}
	
	self.sounds = {
		mining = Sound.new( "Content/Audio/mining.wav" ),
		collect = Sound.new( "Content/Audio/collect.wav" ),
		footsteps = Sound.new( "Content/Audio/footsteps.wav" ),
		hurt = Sound.new( "Content/Audio/hurt.wav" ),
		sword = Sound.new( "Content/Audio/sword.wav" ),
	}
	
	GameMinerState.fonts = {
		overhead = TTFont.new( "Content/Fonts/NotoSans-Bold.ttf", 9 ),
		hud = TTFont.new( "Content/Fonts/NotoSans-Bold.ttf", 14 ),
	}
	
	-- Fade out graphic
	self.fadeCounter = 0
	self.transition = false
	self.fadeBitmap = Bitmap.new( self.textures.black )
	self.fadeBitmap:setAlpha( 0 )
	
	-- Set up map
	self.map = MinerMap.new()
	self.map:Generate()
	--GetPlayerCoordinates	
	-- Create player control buttons
	self.hud = {
		topButton = {
			action = "move",
			bitmap = Bitmap.new( self.textures.hud_up )
		},
		bottomButton = {
			action = "move",
			bitmap = Bitmap.new( self.textures.hud_down )
		},
		leftButton = {
			action = "move",
			bitmap = Bitmap.new( self.textures.hud_left )
		},
		rightButton = {
			action = "move",
			bitmap = Bitmap.new( self.textures.hud_right )
		},
	}
	
	self:SetupHud()
	
	self:Draw()
end

function GameMinerState:SetupHud()
	local x, y = self.map:GetPlayerCoordinates()
	
	self.hud.topButton.bitmap:setPosition( x, y - 36 )
	self.hud.bottomButton.bitmap:setPosition( x, y + 36 )
	self.hud.leftButton.bitmap:setPosition( x - 36, y )
	self.hud.rightButton.bitmap:setPosition( x + 36, y )
	
	self.hud.topButton.action,
	self.hud.bottomButton.action,
	self.hud.leftButton.action,
	self.hud.rightButton.action = self.map:GetHudActions()
	
	-- Up
	if ( self.hud.topButton.action == "move" ) then
		self.hud.topButton.bitmap:setTexture( self.textures.hud_up )
		self.hud.topButton.bitmap:setAlpha( 1 )
	elseif ( self.hud.topButton.action == "mine" ) then
		self.hud.topButton.bitmap:setTexture( self.textures.hud_pick )
		self.hud.topButton.bitmap:setAlpha( 1 )
	elseif ( self.hud.topButton.action == "attack" ) then
		self.hud.topButton.bitmap:setTexture( self.textures.hud_sword )
		self.hud.topButton.bitmap:setAlpha( 1 )
	else -- none
		self.hud.topButton.bitmap:setAlpha( 0 )
	end
	
	-- Down
	if ( self.hud.bottomButton.action == "move" ) then
		self.hud.bottomButton.bitmap:setTexture( self.textures.hud_down )
		self.hud.bottomButton.bitmap:setAlpha( 1 )
	elseif ( self.hud.bottomButton.action == "mine" ) then
		self.hud.bottomButton.bitmap:setTexture( self.textures.hud_pick )
		self.hud.bottomButton.bitmap:setAlpha( 1 )
	elseif ( self.hud.bottomButton.action == "attack" ) then
		self.hud.bottomButton.bitmap:setTexture( self.textures.hud_sword )
		self.hud.bottomButton.bitmap:setAlpha( 1 )
	else -- none
		self.hud.bottomButton.bitmap:setAlpha( 0 )
	end
	
	-- Left
	if ( self.hud.leftButton.action == "move" ) then
		self.hud.leftButton.bitmap:setTexture( self.textures.hud_left )
		self.hud.leftButton.bitmap:setAlpha( 1 )
	elseif ( self.hud.leftButton.action == "mine" ) then
		self.hud.leftButton.bitmap:setTexture( self.textures.hud_pick )
		self.hud.leftButton.bitmap:setAlpha( 1 )
	elseif ( self.hud.leftButton.action == "attack" ) then
		self.hud.leftButton.bitmap:setTexture( self.textures.hud_sword )
		self.hud.leftButton.bitmap:setAlpha( 1 )
	else -- none
		self.hud.leftButton.bitmap:setAlpha( 0 )
	end
	
	-- Right	
	if ( self.hud.rightButton.action == "move" ) then
		self.hud.rightButton.bitmap:setTexture( self.textures.hud_right )
		self.hud.rightButton.bitmap:setAlpha( 1 )
	elseif ( self.hud.rightButton.action == "mine" ) then
		self.hud.rightButton.bitmap:setTexture( self.textures.hud_pick )
		self.hud.rightButton.bitmap:setAlpha( 1 )
	elseif ( self.hud.rightButton.action == "attack" ) then
		self.hud.rightButton.bitmap:setTexture( self.textures.hud_sword )
		self.hud.rightButton.bitmap:setAlpha( 1 )
	else -- none
		self.hud.rightButton.bitmap:setAlpha( 0 )
	end

end

function GameMinerState:Cleanup()
end

function GameMinerState:Draw()
	StateBase:Draw()
	self.map:Draw()
	
	for key, button in pairs( self.hud ) do 
		stage:addChild( button.bitmap )
	end
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
	-- Hud buttons could be to move or mine or attack
	if ( self.hud.topButton.bitmap:hitTestPoint( event.x, event.y ) ) then
		self.map.player:Move( "north", self.map.tileWidth )
	
	elseif ( self.hud.bottomButton.bitmap:hitTestPoint( event.x, event.y ) ) then
		self.map.player:Move( "south", self.map.tileWidth )
	
	elseif ( self.hud.leftButton.bitmap:hitTestPoint( event.x, event.y ) ) then
		self.map.player:Move( "west", self.map.tileWidth )
	
	elseif ( self.hud.rightButton.bitmap:hitTestPoint( event.x, event.y ) ) then
		self.map.player:Move( "east", self.map.tileWidth )
	
	end
	
	self:SetupHud()
end

function GameMinerState:TurnBasedUpdate()

end

function GameMinerState:GetDistance( x1, y1, x2, y2 )
	local xd = x1 - x2
	local yd = y1 - y2
	return math.sqrt( xd * xd + yd * yd )
end

function GameMinerState:Handle_EnterFrame( event )
	self.map:Handle_EnterFrame( frame )
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