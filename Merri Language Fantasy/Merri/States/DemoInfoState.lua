DemoInfoState = Core.class( StateBase )

function DemoInfoState:init( options )
	StateBase:init( options )
	StateBase:Setup( { backgroundScroll = true } )
end

-- Setup / Teardown --
function DemoInfoState:Setup( options )
	StateBase:SetGotoState( "" )
	self:SetupInfoScreen()
end

function DemoInfoState:SetupInfoScreen()
	StateBase:ToggleBackgroundScroll( true )
	StateBase:SetBackground( { id = "background", 		path = "Content/Graphics/UI/generalbgtile.png",  pos_x = 0, pos_y = 0 } )
	
	local x = 10
	local y = 100
	local yInc = 40
	local spacing = 10
	local info = 1
	local size1 = 10
	local size2 = 10
	
	StateBase:AddLabel( { id = "titleA", 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = 0, pos_y = 25, color = 0xFFFFFF, 	size = 25, text = "Merri:", centered = true } )
	StateBase:AddLabel( { id = "titleB", 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = 0, pos_y = 60, color = 0xFFFFFF, 	size = 25, text = GameText:Get( "target", "game title" ), centered = true } )
		
	
	local lines = {
		"Thank you for trying out Merri",
		"This is still a work in progress", 
		"There may be errors or bugs", 
		"Report problems at EMAIL",  
		"Want to keep up with this game's progress?", 
	}
	
	for key, line in pairs( lines ) do
		StateBase:AddLabel( { id = "infoA" .. info, 			path = "Content/Fonts/NotoSans-Bold.ttf",		
			pos_x = x, pos_y = y, color = 0xFFFFFF, 	size = size1, text = GameText:Get( "target", line ), centered = true, fitToScreen = true } )
			
		StateBase:AddLabel( { id = "infoB" .. info, 			path = "Content/Fonts/NotoSans-Bold.ttf",		
			pos_x = x, pos_y = y+spacing, color = 0xFFFFFF, size = size2, text = GameText:Get( "helper", line ), centered = true, fitToScreen = true } )
		
		y = y + yInc
		info = info + 1
	end
	
	StateBase:AddLabel( { id = "infoA" .. info, 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = x, pos_y = y, color = 0xFFFFFF, size = size1, text = GameText:Get( "helper", "website" ) .. " Moosader.com", centered = false } )
	y = y + spacing
	info = info + 1
	StateBase:AddLabel( { id = "infoA" .. info, 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = x, pos_y = y, color = 0xFFFFFF, size = size1, text = GameText:Get( "helper", "facebook" ) .. " facebook.com/Moosader", centered = false } )
	y = y + spacing
	info = info + 1
	StateBase:AddLabel( { id = "infoA" .. info, 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = x, pos_y = y, color = 0xFFFFFF, size = size1, text = GameText:Get( "helper", "twitter" ) .. " @Moosader", centered = false } )
	
	
	StateBase:AddButton( { 
		button = { id = "btn_next", 	path = "Content/Graphics/UI/btn_play.png",  	pos_x = 250, pos_y = 530  },
		label 	= { id = "btn_next", 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = 255, pos_y = 530+95, color = 0xFFFFFF, size = 14, text = GameText:Get( "helper", "Next" ) }
		} )
		
	self:Draw()
end

function DemoInfoState:SetupCreditScreen()
	print( "Credit Screen" )
	StateBase:ClearScreen()
	self:Cleanup()
	
	StateBase:ToggleBackgroundScroll( true )
	StateBase:SetBackground( { id = "background", 		path = "Content/Graphics/UI/generalbgtile.png",  pos_x = 0, pos_y = 0 } )
	
	local info = 1
	
	StateBase:AddLabel( { id = "infoA" .. info, 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = 0, pos_y = 25, color = 0xFFFFFF, size = 20, text = GameText:Get( "helper", "Translators" ), centered = true } )
	
	info = info + 1
	local x = 20
	local y = 75
	local yInc = 70
	local size1 = 15
	local size2 = 13

	for key, language in pairs( GLOBAL_LANGAUGES ) do
		StateBase:AddLabel( { id = "infoA" .. info, 			path = "Content/Fonts/NotoSans-Bold.ttf",		
			pos_x = x, pos_y = y, color = 0xFFFFFF, size = size1, text = GameText:GetFromLanguageCommon( "helper", language, "language-name" ), centered = false } )
		StateBase:AddLabel( { id = "infoB" .. info, 			path = "Content/Fonts/NotoSans-Bold.ttf",		
			pos_x = x+20, pos_y = y+20, color = 0xFFFFFF, size = size2, text = GameText:GetFromLanguageCommon( "helper", language, "Translation Credits" ), centered = false } )
		
		y = y + yInc
		info = info + 1
	end
	
	

	StateBase:AddButton( { 
		button = { id = "btn_play", 	path = "Content/Graphics/UI/btn_play.png",  	pos_x = 250, pos_y = 530  },
		label 	= { id = "btn_play", 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = 255, pos_y = 530+95, color = 0xFFFFFF, size = 14, text = GameText:Get( "helper", "Play" ) }
		} )
		
		self:Draw()
end

function DemoInfoState:Cleanup()
	StateBase:ClearWidgets()
end

function DemoInfoState:Draw()
	StateBase:Draw()
end

-- Cyclical --
function DemoInfoState:Update()
end

-- Callbacks --
function DemoInfoState:Handle_AndroidKey( event )
end

function DemoInfoState:Handle_KeyDown( event )
end

function DemoInfoState:Handle_MouseDown( event )
	clickedButton = StateBase:ClickedButtonName( event )
	print( "Clicked ", clickedButton )
	if ( clickedButton == "btn_play" ) then
		StateBase:SetGotoState( "MinerGameState" )	
		
	elseif ( clickedButton == "btn_next" ) then
		self:SetupCreditScreen()
	
	end
end

function DemoInfoState:Handle_EnterFrame( event )
	StateBase:Update()
end

function DemoInfoState:ClearScreen()
	StateBase:ClearScreen()	
end

function DemoInfoState:ClearWidgets()
	StateBase:ClearWidgets()
end

function DemoInfoState:GotoState()
	return StateBase:GotoState()
end