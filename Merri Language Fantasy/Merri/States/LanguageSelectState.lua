LanguageSelectState = Core.class( StateBase )

function LanguageSelectState:init( options )
	StateBase:init( options )
	self:Setup( options )
end

-- Setup / Teardown --
function LanguageSelectState:Setup( options )
	StateBase:SetBackground( { id = "background", 		path = "Content/Graphics/UI/generalbg.png",  pos_x = 0, pos_y = 0 } )
	StateBase:AddButton( { 
		button = { id = "btn_language1", 	path = "Content/Graphics/UI/widebtnbg.png",  	pos_x = 15, pos_y = 25  },
		label 	= { id = "btn_language1", 	path = "Content/Fonts/PressStart2P.ttf",   			pos_x = 20, pos_y = 25+35, color = 0xFFFFFF, text = "I know English" }
		} )
		
	StateBase:AddButton( { 
		button = { id = "btn_language2", 	path = "Content/Graphics/UI/widebtnbg.png",  	pos_x = 15, pos_y = 100  },
		label 	= { id = "btn_language2", 	path = "Content/Fonts/PressStart2P.ttf",   			pos_x = 20, pos_y = 100+35, color = 0xFFFFFF, text = "Mi konas Esperanton" }
		} )
		
	StateBase:AddButton( { 
		button = { id = "btn_language3", 	path = "Content/Graphics/UI/widebtnbg.png",  	pos_x = 15, pos_y = 175  },
		label 	= { id = "btn_language3", 	path = "Content/Fonts/PressStart2P.ttf",   			pos_x = 20, pos_y = 175+35, color = 0xFFFFFF, text = "Me konas Ido" }
		} )
		
	StateBase:AddButton( { 
		button = { id = "btn_language4", 	path = "Content/Graphics/UI/widebtnbg.png",  	pos_x = 15, pos_y = 250  },
		label 	= { id = "btn_language4", 	path = "Content/Fonts/PressStart2P.ttf",   			pos_x = 20, pos_y = 250+35, color = 0xFFFFFF, text = "Yo conozco español" }
		} )
		
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
end

function LanguageSelectState:Handle_EnterFrame( event )
end