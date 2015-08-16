GameText  = Core.class()

function GameText:init( options )
end

function GameText:Setup( options )
	GameText.HelperText = {}
	GameText.TargetText = {}
	GameText:SetupLanguages()
end

function GameText:Get( cat, id )
	local language = ""
	local category = ""
	if ( cat == "helper" ) then
		language = GLOBAL_CONFIG.HELPER_LANGUAGE
		category = "HelperText"
		
	else
		language = GLOBAL_CONFIG.TARGET_LANGUAGE
		category = "TargetText"
		
	end

	if ( GameText[ category ] == nil ) then							
		return "Invalid category " .. category
		
	elseif ( GameText[ category ][ language ] == nil ) then
		return "Invalid language " .. language 
		
	elseif ( GameText[ category ][ language ][ id ] == nil ) then
		return "Invalid id " .. id 
		
	else 
		return GameText[ category ][ language ][ id ]
		
	end
end

function GameText:SetupLanguages()
	GameText.HelperText.English = {}
	GameText.HelperText.Esperanto = {}
	GameText.HelperText.Ido = {}
	GameText.HelperText.Spanish = {}
	
	GameText.TargetText.English = {}
	GameText.TargetText.Esperanto = {}
	GameText.TargetText.Ido = {}
	GameText.TargetText.Spanish = {}
	
	
	-- Common --
	
	GameText.TargetText.English[ "game title" ]	 	= "English Fantasy"
	GameText.TargetText.Esperanto[ "game title" ] 	= "Fantazio de Esperanto"
	GameText.TargetText.Ido[ "game title" ] 				= "Fantazio di Ido"
	GameText.TargetText.Spanish[ "game title" ] 		= "Fantasía de Español"
	
	-- Menu Buttons --
	
	GameText.HelperText.English[ "Play" ] 		= "Play"
	GameText.HelperText.Esperanto[ "Play" ] 	= "Ludi"
	GameText.HelperText.Ido[ "Play" ] 				= "Ludar"
	GameText.HelperText.Spanish[ "Play" ] 		= "Jugar"
	
	GameText.HelperText.English[ "Options" ] 		= "Options"
	GameText.HelperText.Esperanto[ "Options" ] 	= "Agordoj"
	GameText.HelperText.Ido[ "Options" ] 			= "Agordi"
	GameText.HelperText.Spanish[ "Options" ] 		= "Opciones"
	
	GameText.HelperText.English[ "Help" ] 		= "Help"
	GameText.HelperText.Esperanto[ "Help" ] 	= "Helpo"
	GameText.HelperText.Ido[ "Help" ] 				= "Helpo"
	GameText.HelperText.Spanish[ "Help" ] 		= "Ayuda"
	
	GameText.HelperText.English[ "Back" ] 		= "Back"
	GameText.HelperText.Esperanto[ "Back" ] 	= "Reveni"
	GameText.HelperText.Ido[ "Back" ] 				= "Revenar"
	GameText.HelperText.Spanish[ "Back" ] 		= "Regres"
	
	
	-- LanguageSelectState --
	
	GameText.HelperText.English[ "I am learning English" ] 		= "I am learning English"
	GameText.HelperText.Esperanto[ "I am learning English" ]	= "Mi lernas anglan lingvon"
	GameText.HelperText.Ido[ "I am learning English" ] 				= "Me lernas angla linguo"
	GameText.HelperText.Spanish[ "I am learning English" ] 		= "Estoy aprendiendo inglés"
	
	GameText.HelperText.English[ "I am learning Esperanto" ]			= "I am learning Esperanto"
	GameText.HelperText.Esperanto[ "I am learning Esperanto" ]	= "Mi lernas esperanton"
	GameText.HelperText.Ido[ "I am learning Esperanto" ]				= "Me lernas esperanto"
	GameText.HelperText.Spanish[ "I am learning Esperanto" ]		= "Estoy aprendiendo esperanto"
	
	GameText.HelperText.English[ "I am learning Ido" ]			= "I am learning Ido"
	GameText.HelperText.Esperanto[ "I am learning Ido" ]	= "Mi lernas idon"
	GameText.HelperText.Ido[ "I am learning Ido" ]					= "Me lernas ido"
	GameText.HelperText.Spanish[ "I am learning Ido" ]			= "Estoy aprendiendo ido"
	
	GameText.HelperText.English[ "I am learning Spanish" ]			= "I am learning Spanish"
	GameText.HelperText.Esperanto[ "I am learning Spanish" ]	= "Mi lernas hispanan lingvon"
	GameText.HelperText.Ido[ "I am learning Spanish" ]					= "Me lernas hispana linguo"
	GameText.HelperText.Spanish[ "I am learning Spanish" ]			= "Estoy aprendiendo español"
	
	-- DifficultSelectState --
	
	GameText.HelperText.English[ "Practice" ] 			= "Practice"
	GameText.HelperText.Esperanto[ "Practice" ] 	= "Ekzerci"
	GameText.HelperText.Ido[ "Practice" ] 				= "Exercar"
	GameText.HelperText.Spanish[ "Practice" ] 		= "Práctica"	
	
	GameText.HelperText.English[ "Easy" ] 		= "Easy"
	GameText.HelperText.Esperanto[ "Easy" ] 	= "Baznivela"
	GameText.HelperText.Ido[ "Easy" ] 				= "Baznivela"
	GameText.HelperText.Spanish[ "Easy" ] 		= "Fácil"	
	
	GameText.HelperText.English[ "Medium" ] 			= "Medium"
	GameText.HelperText.Esperanto[ "Medium" ] 	= "Meznivela"
	GameText.HelperText.Ido[ "Medium" ] 				= "Meznivela"
	GameText.HelperText.Spanish[ "Medium" ] 		= "Intermedio"	
	
	GameText.HelperText.English[ "Hard" ] 			= "Hard"
	GameText.HelperText.Esperanto[ "Hard" ] 	= "Altnivela"
	GameText.HelperText.Ido[ "Hard" ] 				= "Altnivela"
	GameText.HelperText.Spanish[ "Hard" ] 		= "Difícil"
	
	GameText.HelperText.English[ "Stats" ] 		= "Stats"
	GameText.HelperText.Esperanto[ "Stats" ] 	= "Statistikoj"
	GameText.HelperText.Ido[ "Stats" ] 				= "Statistiki"
	GameText.HelperText.Spanish[ "Stats" ] 		= "Estadística"
	
	-- GameMinerState --
	
	GameText.TargetText.English[ "Miner" ] 		= "Miner"
	GameText.TargetText.Esperanto[ "Miner" ] 	= "Ministo"
	GameText.TargetText.Ido[ "Miner" ] 				= "Ministo"
	GameText.TargetText.Spanish[ "Miner" ] 		= "Minero"
	
	GameText.TargetText.English[ "Level" ] 		= "Level"
	GameText.TargetText.Esperanto[ "Level" ] 	= "Nivelo"
	GameText.TargetText.Ido[ "Level" ] 				= "Ministo"
	GameText.TargetText.Spanish[ "Level" ] 		= "Minero"
	
	GameText.TargetText.English[ "Money" ] 		= "Money"
	GameText.TargetText.Esperanto[ "Money" ] 	= "Mono"
	GameText.TargetText.Ido[ "Money" ] 				= "Ministo"
	GameText.TargetText.Spanish[ "Money" ] 		= "Minero"
	
	GameText.TargetText.English[ "snail" ] 		= "Snail"
	GameText.TargetText.Esperanto[ "snail" ] 	= "Heliko"
	GameText.TargetText.Ido[ "snail" ] 				= "Ministo"
	GameText.TargetText.Spanish[ "snail" ] 		= "Minero"
	
	GameText.TargetText.English[ "mole" ] 		= "Mole"
	GameText.TargetText.Esperanto[ "mole" ] 	= "Talpo"
	GameText.TargetText.Ido[ "mole" ] 				= "Ministo"
	GameText.TargetText.Spanish[ "mole" ] 		= "Minero"
	
	GameText.TargetText.English[ "mushroom" ] 		= "Mushroom"
	GameText.TargetText.Esperanto[ "mushroom" ] 	= "Fungo"
	GameText.TargetText.Ido[ "mushroom" ] 				= "Piocho"
	GameText.TargetText.Spanish[ "mushroom" ] 		= "Minero"
	
	GameText.TargetText.English[ "bat" ] 			= "Bat"
	GameText.TargetText.Esperanto[ "bat" ] 		= "Vesperto"
	GameText.TargetText.Ido[ "bat" ] 				= "Sabro"
	GameText.TargetText.Spanish[ "bat" ] 		= "Minero"
	
	GameText.TargetText.English[ "rabbit" ] 			= "Rabbit"
	GameText.TargetText.Esperanto[ "rabbit" ] 	= "Kuniklo"
	GameText.TargetText.Ido[ "rabbit" ] 				= "Sube"
	GameText.TargetText.Spanish[ "rabbit" ] 		= "Minero"
	
	GameText.TargetText.English[ "snake" ] 			= "Snake"
	GameText.TargetText.Esperanto[ "snake" ] 		= "Serpento"
	GameText.TargetText.Ido[ "snake" ] 				= "Sube"
	GameText.TargetText.Spanish[ "snake" ] 		= "Minero"
	
	GameText.TargetText.English[ "skeleton" ] 			= "Skeleton"
	GameText.TargetText.Esperanto[ "skeleton" ] 	= "Skeleto"
	GameText.TargetText.Ido[ "skeleton" ] 				= "Sube"
	GameText.TargetText.Spanish[ "skeleton" ] 		= "Minero"
	
	GameText.TargetText.English[ "moose" ] 		= "Moose"
	GameText.TargetText.Esperanto[ "moose" ] 	= "Alko"
	GameText.TargetText.Ido[ "moose" ] 				= "Sube"
	GameText.TargetText.Spanish[ "moose" ] 		= "Minero"
	
	GameText.TargetText.English[ "rock" ] 		= "Rock"
	GameText.TargetText.Esperanto[ "rock" ] 	= "Ŝtono"
	GameText.TargetText.Ido[ "rock" ] 				= "Roko"
	GameText.TargetText.Spanish[ "rock" ] 		= "Piedra"
	
	GameText.TargetText.English[ "sandwich" ] 		= "Sandwich"
	GameText.TargetText.Esperanto[ "sandwich" ] 	= "Sandviĉo"
	GameText.TargetText.Ido[ "sandwich" ] 				= "Sandwich"
	GameText.TargetText.Spanish[ "sandwich" ] 		= "Piedra"
	
	GameText.TargetText.English[ "amethyst" ] 		= "Amethyst"
	GameText.TargetText.Esperanto[ "amethyst" ] 	= "Ametisto"
	GameText.TargetText.Ido[ "amethyst" ] 				= "Ametisto"
	GameText.TargetText.Spanish[ "amethyst" ] 		= "Ametisto"
	
	GameText.TargetText.English[ "sapphire" ] 		= "Sapphire"
	GameText.TargetText.Esperanto[ "sapphire" ] 	= "Safiro"
	GameText.TargetText.Ido[ "sapphire" ] 				= "Akvamarino"
	GameText.TargetText.Spanish[ "sapphire" ] 		= "Akvamarino"
	
	GameText.TargetText.English[ "diamond" ] 		= "Diamond"
	GameText.TargetText.Esperanto[ "diamond" ] 	= "Diamanto"
	GameText.TargetText.Ido[ "diamond" ] 				= "Rubeno"
	GameText.TargetText.Spanish[ "diamond" ] 		= "Rubeno"
	
	GameText.TargetText.English[ "emerald" ] 			= "Emerald"
	GameText.TargetText.Esperanto[ "emerald" ] 	= "Smeraldo"
	GameText.TargetText.Ido[ "emerald" ] 				= "Jado"
	GameText.TargetText.Spanish[ "emerald" ] 		= "Jado"
	
	GameText.TargetText.English[ "ruby" ] 		= "Ruby"
	GameText.TargetText.Esperanto[ "ruby" ] 	= "Rubeno"
	GameText.TargetText.Ido[ "ruby" ] 				= "Jado"
	GameText.TargetText.Spanish[ "ruby" ] 		= "Jado"
	
	GameText.TargetText.English[ "copper" ] 		= "Copper"
	GameText.TargetText.Esperanto[ "copper" ] 	= "Kupro"
	GameText.TargetText.Ido[ "copper" ] 				= "Kupra"
	GameText.TargetText.Spanish[ "copper " ] 		= "Kupra"
	
	GameText.TargetText.English[ "silver" ] 		= "Silver"
	GameText.TargetText.Esperanto[ "silver" ] 	= "Arĝento"
	GameText.TargetText.Ido[ "silver" ] 				= "Arĝenta"
	GameText.TargetText.Spanish[ "silver " ] 		= "Arĝenta"
	
	GameText.TargetText.English[ "gold" ] 		= "Gold"
	GameText.TargetText.Esperanto[ "gold" ] 	= "Oro"
	GameText.TargetText.Ido[ "gold" ] 				= "Ora"
	GameText.TargetText.Spanish[ "gold " ] 		= "Ora"
	
	GameText.TargetText.English[ "ladder" ] 		= "Ladder"
	GameText.TargetText.Esperanto[ "ladder" ] 	= "Ŝtupetaro"
	GameText.TargetText.Ido[ "ladder" ] 				= "Ora"
	GameText.TargetText.Spanish[ "ladder " ] 		= "Ora"
	
	GameText.TargetText.English[ "Game Over" ] 			= "Game Over"
	GameText.TargetText.Esperanto[ "Game Over" ] 	= "Ludfino"
	GameText.TargetText.Ido[ "Game Over" ] 				= "Ora"
	GameText.TargetText.Spanish[ "Game Over " ] 		= "Ora"
	
	GameText.HelperText.English[ "Game Over" ] 			= "Game Over"
	GameText.HelperText.Esperanto[ "Game Over" ] 	= "Ludfino"
	GameText.HelperText.Ido[ "Game Over" ] 				= "Ora"
	GameText.HelperText.Spanish[ "Game Over " ] 		= "Ora"
	
end


