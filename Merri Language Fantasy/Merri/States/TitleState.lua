TitleState = Core.class( StateBase )

function TitleState:init( options )
	StateBase:init( options )
end

-- Setup / Teardown --
function TitleState:Setup( options )
	StateBase:SetBackground( { id = "background", 		path = "Content/Graphics/UI/generalbg.png",  pos_x = 0, pos_y = 0 } )
	
	StateBase:AddButton( { 
		button = { id = "btn_play", 	path = "Content/Graphics/UI/btn_play.png",  	pos_x = 10, pos_y = 525  },
		label 	= { id = "btn_play", 	path = "Content/Fonts/PressStart2P.ttf",   			pos_x = 15, pos_y = 525+95, color = 0x000000, size = 12, text = "Play" }
		} )
		
	StateBase:AddButton( { 
		button = { id = "btn_options", 	path = "Content/Graphics/UI/btn_options.png",  	pos_x = 130, pos_y = 525  },
		label 	= { id = "btn_options", 	path = "Content/Fonts/PressStart2P.ttf",   					pos_x = 135, pos_y = 525+95, color = 0x000000, size = 12, text = "Options" }
		} )
		
	StateBase:AddButton( { 
		button = { id = "btn_help", 	path = "Content/Graphics/UI/btn_help.png",  	pos_x = 250, pos_y = 525  },
		label 	= { id = "btn_help", 	path = "Content/Fonts/PressStart2P.ttf",   			pos_x = 255, pos_y = 525+95, color = 0x000000, size = 12, text = "Help" }
		} )
		
	StateBase:AddLabel( { id = "moosader", path = "Content/Fonts/PressStart2P.ttf",		pos_x = 10, pos_y = 25, color = 0xFFFFFF, size = 13, text = "Moosader's" } )
	StateBase:AddBitmap( { id = "title", 	path = "Content/Graphics/UI/title_text.png",  pos_x = 64, pos_y = 35 } )
	StateBase:AddLabel( { id = "title", 			path = "Content/Fonts/PressStart2P.ttf",		pos_x = 10, pos_y = 140, color = 0xFFFFFF, size = 16, text = "Fantazio de Esperanto" } )
	StateBase:AddBitmap( { id = "bg", 	path = "Content/Graphics/UI/bg_titlescene.png",  pos_x = 0, pos_y = 160 } )
		
	self:Draw()
end

function TitleState:Cleanup()
end

function TitleState:Draw()
	StateBase:Draw()
end

-- Cyclical --
function TitleState:Update()
end

-- Callbacks --
function TitleState:Handle_AndroidKey( event )
end

function TitleState:Handle_KeyDown( event )
end

function TitleState:Handle_MouseDown( event )
	clickedButton = StateBase:ClickedButtonName( event )
	print( "Clicked ", clickedButton )
	
	if ( clickedButton == "btn_play" ) then 					
		StateBase:SetGotoState( "DifficultySelectState" )
			
	elseif ( clickedButton == "btn_help" ) then 
	
	elseif ( clickedButton == "btn_options" ) then
	
	end
end

function TitleState:Handle_EnterFrame( event )
end



function TitleState:ClearScreen()
	StateBase:ClearScreen()	
end

function TitleState:ClearWidgets()
	StateBase:ClearWidgets()
end