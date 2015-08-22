GotStarState = Core.class( StateBase )

function GotStarState:init( options )
	StateBase:init( options )
	StateBase:Setup( { backgroundScroll = true } )
end

-- Setup / Teardown --
function GotStarState:Setup( options )
	StateBase:ToggleBackgroundScroll( true )
	StateBase:SetBackground( { id = "background", 		path = "Content/Graphics/UI/generalbgtile.png",  pos_x = 0, pos_y = 0 } )
	
	self.graphics = {}
	
	self.graphics.star = Bitmap.new( Texture.new( "Content/Graphics/Tiles/treasure_star_big.png" ) )
	self.graphics.star:setPosition( GLOBAL_CONFIG.SCREEN_WIDTH/2, GLOBAL_CONFIG.SCREEN_HEIGHT/2 )
	self.graphics.star:setAnchorPoint( 0.5, 0.5 )
	self.graphics.star:setRotation( -5 )
	
	StateBase:AddLabel( { id = "attain1", 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = 50, pos_y = 140, color = 0xFFFFFF, size = 30, text = GameText:Get( "target", "Earned a star" ), centered = true } )
	StateBase:AddLabel( { id = "attain2", 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = 120, pos_y = 180, color = 0xFFFFFF, size = 20, text = GameText:Get( "helper", "Earned a star" ), centered = true } )
		
	StateBase:AddButton( { 
		button = { id = "btn_back", 	path = "Content/Graphics/UI/btn_back.png",  			pos_x = 10, pos_y = 530  },
		label 	= { id = "btn_back", 	path = "Content/Fonts/NotoSans-Bold.ttf",   				pos_x = 15, pos_y = 530+95, color = 0xFFFFFF, size = 14, text = GameText:Get( "helper", "Back" ) }
		} )
	
	self:Draw()
	
	self.aniCounter = 0
end

function GotStarState:Cleanup()
end

function GotStarState:Draw()
	StateBase:Draw()
	
	for key, value in pairs( self.graphics.star ) do
		stage:addChild( value )
	end
end

-- Cyclical --
function GotStarState:Update()
end

-- Callbacks --
function GotStarState:Handle_AndroidKey( event )
end

function GotStarState:Handle_KeyDown( event )
end

function GotStarState:Handle_MouseDown( event )
	clickedButton = StateBase:ClickedButtonName( event )
	if ( clickedButton == "btn_back" ) then
			StateBase:SetGotoState( "LanguageSelectState" )	
	
	end
end

function GotStarState:Handle_EnterFrame( event )
	StateBase:Update()
	
	self.aniCounter = self.aniCounter + 0.25
	if ( self.aniCounter == 20 ) then		self.aniCounter = 0 		end
	
	local scale = self.graphics.star:getScale()
	local angle = self.graphics.star:getRotation()
	if ( self.aniCounter < 10 ) then
		scale = scale + 0.01
		angle = angle + 0.5
	else	
		scale = scale - 0.01
		angle = angle - 0.5
	end
	self.graphics.star:setScale( scale )
	self.graphics.star:setRotation( angle )
end

function GotStarState:ClearScreen()
	StateBase:ClearScreen()	
end

function GotStarState:ClearWidgets()
	StateBase:ClearWidgets()
end

function GotStarState:GotoState()
	return StateBase:GotoState()
end