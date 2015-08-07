print( "Program begins" )
stateManager = StateManager.new()
stateManager:AddState( "LanguageSelectState", LanguageSelectState.new() )
stateManager:AddState( "TitleState", TitleState.new() )
stateManager:AddState( "DifficultySelectState", DifficultySelectState.new() )
stateManager:ChangeState( "LanguageSelectState" )

function Handle_EnterFrame( event )
	stateManager:Handle_EnterFrame( event )
end

function Handle_MouseDown( event )
	stateManager:Handle_MouseDown( event )
end

stage:addEventListener( Event.ENTER_FRAME, Handle_EnterFrame, self )
stage:addEventListener( Event.MOUSE_DOWN, Handle_MouseDown, self )
