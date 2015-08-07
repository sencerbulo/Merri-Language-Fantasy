DifficultySelectState = Core.class( StateBase )

function DifficultySelectState:init( options )
	StateBase:init( options )
	self:Setup( options )
end

-- Setup / Teardown --
function DifficultySelectState:Setup( options )
	StateBase:SetBackground( { id = "background", 		path = "Content/Graphics/UI/generalbg.png",  pos_x = 0, pos_y = 0 } )
	
	StateBase:AddButton( { 
		button 	= { id = "btn_practice", 	path = "Content/Graphics/UI/difficulty_practice.png",  	pos_x = 0, pos_y = 0  },
		label 		= { id = "btn_practice", 	path = "Content/Fonts/PressStart2P.ttf",   								pos_x = 135, pos_y = 75, color = 0xFFFFFF, size = 25, text = "Practice" }
		} )
	
	StateBase:AddButton( { 
		button 	= { id = "btn_easy", 	path = "Content/Graphics/UI/difficulty_easy.png",  	pos_x = 0, pos_y = 128  },
		label 		= { id = "btn_easy", 	path = "Content/Fonts/PressStart2P.ttf",   						pos_x = 50, pos_y = 128+75, color = 0xFFFFFF, size = 25, text = "Easy" }
		} )
	
	StateBase:AddButton( { 
		button 	= { id = "btn_medium", 	path = "Content/Graphics/UI/difficulty_medium.png",  	pos_x = 0, pos_y = 256  },
		label 		= { id = "btn_medium", 	path = "Content/Fonts/PressStart2P.ttf",   								pos_x = 135, pos_y = 256+75, color = 0xFFFFFF, size = 25, text = "Medium" }
		} )
	
	StateBase:AddButton( { 
		button 	= { id = "btn_hard", 	path = "Content/Graphics/UI/difficulty_hard.png",  	pos_x = 0, pos_y = 384  },
		label 		= { id = "btn_hard", 	path = "Content/Fonts/PressStart2P.ttf",   						pos_x = 50, pos_y = 384+75, color = 0xFFFFFF, size = 25, text = "Hard" }
		} )
		
	StateBase:AddButton( { 
		button = { id = "btn_stats", 	path = "Content/Graphics/UI/btn_stats.png",  	pos_x = 250, pos_y = 525  },
		label 	= { id = "btn_stats", 	path = "Content/Fonts/PressStart2P.ttf",   				pos_x = 255, pos_y = 525+95, color = 0x000000, size = 12, text = "Stats" }
		} )
		
	StateBase:AddButton( { 
		button = { id = "btn_back", 	path = "Content/Graphics/UI/btn_back.png",  	pos_x = 10, pos_y = 525  },
		label 	= { id = "btn_back", 	path = "Content/Fonts/PressStart2P.ttf",   				pos_x = 15, pos_y = 525+95, color = 0x000000, size = 12, text = "Back" }
		} )
		
	self:Draw()
end

function DifficultySelectState:Cleanup()
end

function DifficultySelectState:Draw()
	StateBase:Draw()
end

-- Cyclical --
function DifficultySelectState:Update()
end

-- Callbacks --
function DifficultySelectState:Handle_AndroidKey( event )
end

function DifficultySelectState:Handle_KeyDown( event )
end

function DifficultySelectState:Handle_MouseDown( event )
	clickedButton = StateBase:ClickedButtonName( event )
	if ( clickedButton == "btn_play" ) then 					--GLOBAL_CONFIG.HELPER_LANGUAGE = "English"
	elseif ( clickedButton == "btn_help" ) then 			--GLOBAL_CONFIG.HELPER_LANGUAGE = "Esperanto"
	elseif ( clickedButton == "btn_options" ) then 	--GLOBAL_CONFIG.HELPER_LANGUAGE = "Ido"
	end
end

function DifficultySelectState:Handle_EnterFrame( event )
end