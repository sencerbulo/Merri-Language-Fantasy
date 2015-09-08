AnimalBattleState = Core.class( StateBase )

function AnimalBattleState:init( options )
	StateBase:init( options )
	StateBase:Setup( { backgroundScroll = false } )
end

-- Setup / Teardown --
function AnimalBattleState:Setup( options )
	StateBase:SetGotoState( "" )
	
	self.contentPath = "Content/Games/AnimalBattle/"
	
	StateBase:SetBackground( { id = "background", 		path = self.contentPath .. "background_animals.png",  pos_x = 0, pos_y = 0 } )
	
	self.textures = {
		girl_idle = Texture.new( self.contentPath .. "fighter_idle.png" ),
		girl_attack1 = Texture.new( self.contentPath .. "fighter_attack1.png" ),
		girl_attack1 = Texture.new( self.contentPath .. "fighter_attack1.png" ),
		
		dialogue_background = Texture.new( self.contentPath .. "dialogue_balloon.png" ),
	}
	
	self.images = {}
	self.images.fighter = Bitmap.new( self.textures.girl_idle )
	self.images.fighter:setPosition( 225, 175 )
	self.images.dialoguebg = Bitmap.new( self.textures.dialogue_background )
	
	local x = 25
	local y = 150
	self.images.animal1 = Bitmap.new( Texture.new( self.contentPath .. "cat.png" ) )
	self.images.animal1:setPosition( x, y )
	
	y = y + 150
	self.images.animal2 = Bitmap.new( Texture.new( self.contentPath .. "dog.png" ) )
	self.images.animal2:setPosition( x, y )
	
	y = y + 150
	self.images.animal3 = Bitmap.new( Texture.new( self.contentPath .. "fox.png" ) )
	self.images.animal3:setPosition( x, y )
	
	self.fonts = {}
	self.fonts.dialogue = TTFont.new( "Content/Fonts/NotoSans-Bold.ttf", 15 )

	StateBase:AddLabelAndDraw( { id = "command", 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = 0, pos_y = 50, color = 0x000000, 	size = 15, text = GameText:Get( "target", "Attack the cat" ), centered = true, fitToScreen = true } )
	
	self:Draw()
end

function AnimalBattleState:Cleanup()
	StateBase:ClearWidgets()
	
	for key, value in pairs( self.images ) do
		if ( stage:contains( value ) ) then stage:removeChild( value ) end
	end
end

function AnimalBattleState:Draw()
	StateBase:Draw()
	
	for key, value in pairs( self.images ) do
		stage:addChild( value )
	end
	
	StateBase:DrawLabels()
end

-- Callbacks --
function AnimalBattleState:Handle_AndroidKey( event )
end

function AnimalBattleState:Handle_KeyDown( event )
end

function AnimalBattleState:Handle_MouseDown( event )
	clickedButton = StateBase:ClickedButtonName( event )
	print( "Clicked ", clickedButton )
--	if ( clickedButton == "btn_play" ) then
--		StateBase:SetGotoState( "MinerGameState" )	
--	end
end

function AnimalBattleState:Handle_EnterFrame( event )
	StateBase:Update()
end

function AnimalBattleState:ClearScreen()
	StateBase:ClearScreen()	
end

function AnimalBattleState:ClearWidgets()
	StateBase:ClearWidgets()
end

function AnimalBattleState:GotoState()
	return StateBase:GotoState()
end
