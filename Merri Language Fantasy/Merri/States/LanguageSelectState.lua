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
	
	for key, language in pairs( GLOBAL_LANGAUGES ) do
		StateBase:AddButton( { 
			button = { id = "btn_language_" .. language, 	path = "Content/Graphics/UI/widebtnbg.png",  	pos_x = x, pos_y = y  },
			label 	= { id = "btn_language_" .. language, 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = x+10, pos_y = y+35, color = 0xFFFFFF, size = 16, text = GameText:GetFromLanguageCommon( "helper", language, "I know " .. language ) }
			} )
			
		y = y + yInc	
	end
		
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
	
	for key, language in pairs( GLOBAL_LANGAUGES ) do
		StateBase:AddButton( { 
			button = { id = "btn_language_" .. language, 	path = "Content/Graphics/UI/widebtnbg.png",  	pos_x = x, pos_y = y  },
			label 	= { id = "btn_language_" .. language, 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = x+10, pos_y = y+35, color = 0xFFFFFF, size = 14, text = GameText:GetCommon( "helper", "I am learning " .. language ) }
			} )
			
		y = y + yInc
	end
		
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
	
	print( clickedButton )
	
	if ( self.menuPage == "SelectHelper" and clickedButton ~= nil ) then
		local languageSelected = string.gsub( clickedButton, "btn_language_", "" )
		print( "Selected helper language: ", languageSelected )
		GLOBAL_CONFIG.HELPER_LANGUAGE = languageSelected
		
		if ( GLOBAL_CONFIG.HELPER_LANGUAGE ~= nil ) then
			self:SetupTargetMenu()
		end
		
	elseif ( self.menuPage == "SelectTarget" and clickedButton ~= nil ) then
		local languageSelected = string.gsub( clickedButton, "btn_language_", "" )
		print( "Selected target language: ", languageSelected )
		GLOBAL_CONFIG.TARGET_LANGUAGE = languageSelected
		
		if ( GLOBAL_CONFIG.TARGET_LANGUAGE ~= nil ) then
			SAVE_CONFIG()
			GameText:LoadUsedLanguages()
			StateBase:SetGotoState( "TitleState" )
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