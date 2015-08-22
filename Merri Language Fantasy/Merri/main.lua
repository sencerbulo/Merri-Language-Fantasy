print( "Program begins" )
stateManager = StateManager.new()
stateManager:AddState( "LanguageSelectState", LanguageSelectState.new() )
stateManager:AddState( "TitleState", TitleState.new() )
stateManager:AddState( "DifficultySelectState", DifficultySelectState.new() )
stateManager:AddState( "GotStarState", GotStarState.new() )
stateManager:AddState( "MinerGameState", MinerGameState.new() )
stateManager:AddState( "MinerShopState", MinerShopState.new() )
stateManager:AddState( "DemoInfoState", DemoInfoState.new() )

GameText:Setup()

-- DEMO MODE
GLOBAL_CONFIG.HELPER_LANGUAGE = "English"
GLOBAL_CONFIG.TARGET_LANGUAGE = "Esperanto"

LOAD_CONFIG()

--if ( GLOBAL_CONFIG.HELPER_LANGUAGE == nil and GLOBAL_CONFIG.TARGET_LANGUAGE == nil ) then
	--stateManager:ChangeState( "LanguageSelectState" )

--else
	--stateManager:ChangeState( "TitleState" )
	stateManager:ChangeState( "MinerGameState" )

--end

function Handle_EnterFrame( event )
	stateManager:Handle_EnterFrame( event )
end

function Handle_MouseDown( event )
	stateManager:Handle_MouseDown( event )
end

function Handle_KeyDown( event )
	stateManager:Handle_KeyDown( event )
end

stage:addEventListener( Event.ENTER_FRAME, Handle_EnterFrame, self )
stage:addEventListener( Event.MOUSE_DOWN, Handle_MouseDown, self )
stage:addEventListener( Event.KEY_DOWN, Handle_KeyDown, self )
