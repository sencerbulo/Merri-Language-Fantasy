DifficultySelectState = Core.class( StateBase )

function DifficultySelectState:init( options )
	StateBase:init( options )
	StateBase:Setup( { backgroundScroll = true } )
end

-- Setup / Teardown --
function DifficultySelectState:Setup( options )
	StateBase:SetGotoState( "" )
	StateBase:SetBackground( { id = "background", 		path = "Content/Graphics/UI/generalbgtile.png",  pos_x = 0, pos_y = 0 } )
	self:SetupDemoMenu()
	self:Draw()
end

function DifficultySelectState:SetupMain()	
	StateBase:AddButton( { 
		button 	= { id = "btn_practice", 	path = "Content/Graphics/UI/difficulty_practice.png",  	pos_x = 0, pos_y = 0  },
		label 		= { id = "btn_practice", 	path = "Content/Fonts/NotoSans-Bold.ttf",   								pos_x = 135, pos_y = 75, color = 0xFFFFFF, size = 25, text = GameText:Get( "helper", "Practice" ) }
		} )
	
	StateBase:AddButton( { 
		button 	= { id = "btn_easy", 	path = "Content/Graphics/UI/difficulty_easy.png",  			pos_x = 0, pos_y = 130  },
		label 		= { id = "btn_easy", 	path = "Content/Fonts/NotoSans-Bold.ttf",   						pos_x = 50, pos_y = 128+75, color = 0xFFFFFF, size = 25, text = GameText:Get( "helper", "Easy" ) }
		} )
	
	StateBase:AddButton( { 
		button 	= { id = "btn_medium", 	path = "Content/Graphics/UI/difficulty_medium.png",  			pos_x = 0, pos_y = 260  },
		label 		= { id = "btn_medium", 	path = "Content/Fonts/NotoSans-Bold.ttf",   								pos_x = 135, pos_y = 256+75, color = 0xFFFFFF, size = 25, text = GameText:Get( "helper", "Medium" ) }
		} )
	
	StateBase:AddButton( { 
		button 	= { id = "btn_hard", 	path = "Content/Graphics/UI/difficulty_hard.png",  			pos_x = 0, pos_y = 390  },
		label 		= { id = "btn_hard", 	path = "Content/Fonts/NotoSans-Bold.ttf",   						pos_x = 50, pos_y = 384+75, color = 0xFFFFFF, size = 25, text = GameText:Get( "helper", "Hard" ) }
		} )
		
	StateBase:AddButton( { 
		button = { id = "btn_stats", 	path = "Content/Graphics/UI/btn_stats.png",  			pos_x = 250, pos_y = 530  },
		label 	= { id = "btn_stats", 	path = "Content/Fonts/NotoSans-Bold.ttf",   				pos_x = 255, pos_y = 530+95, color = 0xFFFFFF, size = 14, text = GameText:Get( "helper", "progress" ) }
		} )
		
	StateBase:AddButton( { 
		button = { id = "btn_back", 	path = "Content/Graphics/UI/btn_back.png",  			pos_x = 10, pos_y = 530  },
		label 	= { id = "btn_back", 	path = "Content/Fonts/NotoSans-Bold.ttf",   				pos_x = 15, pos_y = 530+95, color = 0xFFFFFF, size = 14, text = GameText:Get( "helper", "back" ) }
		} )
end

function DifficultySelectState:SetupDemoMenu()
	StateBase:AddButton( { 
		button 	= { id = "btn_miner", 	path = "Content/Graphics/UI/btn_game_miner.png",  	pos_x = 0, pos_y = 0  },
		label 		= { id = "btn_miner", 	path = "Content/Fonts/NotoSans-Bold.ttf",   								pos_x = 25, pos_y = 120, color = 0xFFFFFF, size = 20, 
			text = GameText:Get( "target", "Miner" ) .. " (" .. GameText:Get( "helper", "Miner" ) .. ")"   }
		} )
		
--	StateBase:AddButton( { 
--		button = { id = "btn_stats", 	path = "Content/Graphics/UI/btn_stats.png",  			pos_x = 250, pos_y = 530  },
--		label 	= { id = "btn_stats", 	path = "Content/Fonts/NotoSans-Bold.ttf",   				pos_x = 255, pos_y = 530+95, color = 0xFFFFFF, size = 14, text = GameText:Get( "helper", "progress" ) }
--		} )
		
	StateBase:AddButton( { 
		button = { id = "btn_back", 	path = "Content/Graphics/UI/btn_back.png",  			pos_x = 10, pos_y = 530  },
		label 	= { id = "btn_back", 	path = "Content/Fonts/NotoSans-Bold.ttf",   				pos_x = 15, pos_y = 530+95, color = 0xFFFFFF, size = 14, text = GameText:Get( "helper", "back" ) }
		} )
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
	if ( clickedButton == "btn_miner" ) then
		StateBase:SetGotoState( "MinerGameState" )
	
	elseif ( clickedButton == "btn_help" ) then
	
	
	elseif ( clickedButton == "btn_back" ) then
			StateBase:SetGotoState( "TitleState" )	
	
	end
end

function DifficultySelectState:Handle_EnterFrame( event )
	StateBase:Update()
end

function DifficultySelectState:ClearScreen()
	StateBase:ClearScreen()	
end

function DifficultySelectState:ClearWidgets()
	StateBase:ClearWidgets()
end

function DifficultySelectState:GotoState()
	return StateBase:GotoState()
end