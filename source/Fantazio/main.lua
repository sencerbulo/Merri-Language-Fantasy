-- Fantazio de Esperanto / Rachel J Morris / Moosader.com

StateManager:init()
StateManager:PushState( "title", TitleState.new( { title = "title" } ) )

--while ( StateManager:IsDone() == false ) do
--	StateManager:Update()
--	StateManager:Draw()
--end