FoodShopState = Core.class( StateBase )

function FoodShopState:init( options )
	StateBase:init( options )
	StateBase:Setup( { backgroundScroll = true } )
end

-- Setup / Teardown --
function FoodShopState:Setup( options )
	StateBase:SetGotoState( "" )
	self:Draw()
end

function FoodShopState:Cleanup()
	StateBase:ClearWidgets()
end

function FoodShopState:Draw()
	StateBase:Draw()
end

-- Callbacks --
function FoodShopState:Handle_AndroidKey( event )
end

function FoodShopState:Handle_KeyDown( event )
end

function FoodShopState:Handle_MouseDown( event )
	clickedButton = StateBase:ClickedButtonName( event )
	print( "Clicked ", clickedButton )
--	if ( clickedButton == "btn_play" ) then
--		StateBase:SetGotoState( "MinerGameState" )	
--	end
end

function FoodShopState:Handle_EnterFrame( event )
	StateBase:Update()
end

function FoodShopState:ClearScreen()
	StateBase:ClearScreen()	
end

function FoodShopState:ClearWidgets()
	StateBase:ClearWidgets()
end

function FoodShopState:GotoState()
	return StateBase:GotoState()
end
