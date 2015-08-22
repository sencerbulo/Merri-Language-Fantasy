print( "Program begins" )
stateManager = StateManager.new()
stateManager:AddState( "LanguageSelectState", LanguageSelectState.new() )
stateManager:AddState( "TitleState", TitleState.new() )
stateManager:AddState( "DifficultySelectState", DifficultySelectState.new() )
stateManager:AddState( "GotStarState", GotStarState.new() )
stateManager:AddState( "GameMinerState", GameMinerState.new() )
stateManager:AddState( "DemoInfoState", DemoInfoState.new() )

GameText:Setup()

-- DEMO MODE
GLOBAL_CONFIG.HELPER_LANGUAGE = "English"
GLOBAL_CONFIG.TARGET_LANGUAGE = "Esperanto"

LOAD_CONFIG()

--if ( GLOBAL_CONFIG.HELPER_LANGUAGE == nil and GLOBAL_CONFIG.TARGET_LANGUAGE == nil ) then
	--stateManager:ChangeState( "LanguageSelectState" )
	stateManager:ChangeState( "DemoInfoState" )

--else
	--stateManager:ChangeState( "TitleState" )
	--stateManager:ChangeState( "GameMinerState" )

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
