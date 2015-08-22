LanguageSelectState = Core.class( StateBase )

function LanguageSelectState:init( options )
	StateBase:init( options )
end

-- Setup / Teardown --
function LanguageSelectState:Setup( options )
	GLOBAL_CONFIG.HELPER_LANGUAGE = nil
	GLOBAL_CONFIG.TARGET_LANGUAGE = nil
	StateBase:Setup( { backgroundScroll = true } )
	self:SetupHelperMenu( options )
end

function LanguageSelectState:SetupHelperMenu( options )	
	StateBase:SetGotoState( "" )
	StateBase:SetBackground( { id = "background", 		path = "Content/Graphics/UI/generalbgtile.png",  pos_x = 0, pos_y = 0 } )
	
	local x = 15
	local y = 25
	local yInc = 75
	
	StateBase:AddButton( { 
		button = { id = "btn_language_en", 	path = "Content/Graphics/UI/widebtnbg.png",  	pos_x = x, pos_y = y  },
		label 	= { id = "btn_language_en", 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = x+10, pos_y = y+35, color = 0xFFFFFF, size = 16, text = GameText:GetFromLanguage( "helper", "English", "I know English" ) }
		} )
		
	y = y + yInc
		
	StateBase:AddButton( { 
		button = { id = "btn_language_eo", 	path = "Content/Graphics/UI/widebtnbg.png",  	pos_x = x, pos_y = y  },
		label 	= { id = "btn_language_eo", 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = x+10, pos_y = y+35, color = 0xFFFFFF, size = 16, text = GameText:GetFromLanguage( "helper", "Esperanto", "I know Esperanto" ) }
		} )
		
	y = y + yInc
		
	StateBase:AddButton( { 
		button = { id = "btn_language_io", 	path = "Content/Graphics/UI/widebtnbg.png",  	pos_x = x, pos_y = y  },
		label 	= { id = "btn_language_io", 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = x+10, pos_y = y+35, color = 0xFFFFFF, size = 16, text = GameText:GetFromLanguage( "helper", "Ido", "I know Ido" ) }
		} )
		
	y = y + yInc
		
	StateBase:AddButton( { 
		button = { id = "btn_language_es", 	path = "Content/Graphics/UI/widebtnbg.png",  	pos_x = x, pos_y = y  },
		label 	= { id = "btn_language_es", 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = x+10, pos_y = y+35, color = 0xFFFFFF, size = 16, text = GameText:GetFromLanguage( "helper", "Spanish", "I know Spanish" ) }
		} )
		
	y = y + yInc
		
	StateBase:AddButton( { 
		button = { id = "btn_language_ith", 	path = "Content/Graphics/UI/widebtnbg.png",  	pos_x = x, pos_y = y  },
		label 	= { id = "btn_language_ith", 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = x+10, pos_y = y+35, color = 0xFFFFFF, size = 16, text = GameText:GetFromLanguage( "helper", "Ithkuil", "I know Ithkuil" ) }
		} )
		
	self.menuPage = "SelectHelper"
	self:Draw()
end

function LanguageSelectState:SetupTargetMenu( options )
	StateBase:ClearScreen()
	StateBase:ClearWidgets()
	
	local x = 15
	local y = 25
	local yInc = 75

	StateBase:SetBackground( { id = "background", 		path = "Content/Graphics/UI/generalbgtile.png",  pos_x = 0, pos_y = 0 } )
	StateBase:AddButton( { 
		button = { id = "btn_language_en", 	path = "Content/Graphics/UI/widebtnbg.png",  	pos_x = x, pos_y = y  },
		label 	= { id = "btn_language_en", 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = x+10, pos_y = y+35, color = 0xFFFFFF, size = 14, text = GameText:Get( "helper", "I am learning English" ) }
		} )
		
	y = y + yInc
		
	StateBase:AddButton( { 
		button = { id = "btn_language_eo", 	path = "Content/Graphics/UI/widebtnbg.png",  	pos_x = x, pos_y = y  },
		label 	= { id = "btn_language_eo", 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = x+10, pos_y = y+35, color = 0xFFFFFF, size = 14, text = GameText:Get( "helper", "I am learning Esperanto" ) }
		} )
		
	y = y + yInc
		
	StateBase:AddButton( { 
		button = { id = "btn_language_io", 	path = "Content/Graphics/UI/widebtnbg.png",  	pos_x = x, pos_y = y  },
		label 	= { id = "btn_language_io", 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = x+10, pos_y = y+35, color = 0xFFFFFF, size = 14, text = GameText:Get( "helper", "I am learning Ido" ) }
		} )
		
	y = y + yInc
		
	StateBase:AddButton( { 
		button = { id = "btn_language_es", 	path = "Content/Graphics/UI/widebtnbg.png",  	pos_x = x, pos_y = y  },
		label 	= { id = "btn_language_es", 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = y+10, pos_y = x+35, color = 0xFFFFFF, size = 14, text = GameText:Get( "helper", "I am learning Spanish" ) }
		} )
		
	y = y + yInc
		
	StateBase:AddButton( { 
		button = { id = "btn_language_ith", 	path = "Content/Graphics/UI/widebtnbg.png",  	pos_x = x, pos_y = y  },
		label 	= { id = "btn_language_ith", 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = x+10, pos_y = y+35, color = 0xFFFFFF, size = 16, text = GameText:Get( "helper", "I am learning Ithkuil" ) }
		} )
		
	self.menuPage = "SelectTarget"
	self:Draw()
end

function LanguageSelectState:Cleanup()
end

function LanguageSelectState:Draw()
	StateBase:Draw()
end

-- Cyclical --
function LanguageSelectState:Update()
end

-- Callbacks --
function LanguageSelectState:Handle_AndroidKey( event )
end

function LanguageSelectState:Handle_KeyDown( event )
end

function LanguageSelectState:Handle_MouseDown( event )
	clickedButton = StateBase:ClickedButtonName( event )
	
	if ( self.menuPage == "SelectHelper" ) then
		if ( clickedButton == "btn_language_en" ) then 				GLOBAL_CONFIG.HELPER_LANGUAGE = "English"
		elseif ( clickedButton == "btn_language_eo" ) then 		GLOBAL_CONFIG.HELPER_LANGUAGE = "Esperanto"
		elseif ( clickedButton == "btn_language_io" ) then 		GLOBAL_CONFIG.HELPER_LANGUAGE = "Ido"
		elseif ( clickedButton == "btn_language_es" ) then 		GLOBAL_CONFIG.HELPER_LANGUAGE = "Spanish"
		end
		
		if ( GLOBAL_CONFIG.HELPER_LANGUAGE ~= nil ) then
			self:SetupTargetMenu()
		end
		
	elseif ( self.menuPage == "SelectTarget" ) then
		if ( clickedButton == "btn_language_en" ) then 				GLOBAL_CONFIG.TARGET_LANGUAGE = "English"
		elseif ( clickedButton == "btn_language_eo" ) then 		GLOBAL_CONFIG.TARGET_LANGUAGE = "Esperanto"
		elseif ( clickedButton == "btn_language_io" ) then 		GLOBAL_CONFIG.TARGET_LANGUAGE = "Ido"
		elseif ( clickedButton == "btn_language_es" ) then 		GLOBAL_CONFIG.TARGET_LANGUAGE = "Spanish"
		end
		
		if ( GLOBAL_CONFIG.TARGET_LANGUAGE ~= nil ) then
			SAVE_CONFIG()
			--StateBase:SetGotoState( "TitleState" )
			StateBase:SetGotoState( "GameMinerState" )
		end
	end
end

function LanguageSelectState:Handle_EnterFrame( event )
	StateBase:Update()
end

function LanguageSelectState:ClearScreen()
	StateBase:ClearScreen()	
end

function LanguageSelectState:ClearWidgets()
	StateBase:ClearWidgets()
end

function LanguageSelectState:GotoState()
	return StateBase:GotoState()
end