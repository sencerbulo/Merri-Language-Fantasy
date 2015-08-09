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
	
	-- like a pick axe
	GameText.TargetText.English[ "Pick" ] 		= "Pick"
	GameText.TargetText.Esperanto[ "Pick" ] 	= "Pioĉo"
	GameText.TargetText.Ido[ "Pick" ] 				= "Piocho"
	GameText.TargetText.Spanish[ "Pick" ] 		= "Minero"
	
	GameText.TargetText.English[ "Sword" ] 			= "Sword"
	GameText.TargetText.Esperanto[ "Sword" ] 	= "Glavo"
	GameText.TargetText.Ido[ "Sword" ] 				= "Sabro"
	GameText.TargetText.Spanish[ "Sword" ] 		= "Minero"
	
	GameText.TargetText.English[ "Down" ] 			= "Down"
	GameText.TargetText.Esperanto[ "Down" ] 	= "Suben"
	GameText.TargetText.Ido[ "Down" ] 				= "Sube"
	GameText.TargetText.Spanish[ "Down" ] 		= "Minero"
	
	GameText.TargetText.English[ "Rock" ] 		= "Rock"
	GameText.TargetText.Esperanto[ "Rock" ] 	= "Ŝtono"
	GameText.TargetText.Ido[ "Rock" ] 				= "Roko"
	GameText.TargetText.Spanish[ "Rock" ] 		= "Piedra"
	
	GameText.TargetText.English[ "gemA" ] 		= "Aquamarine"
	GameText.TargetText.Esperanto[ "gemA" ] 	= "Akvamarino"
	GameText.TargetText.Ido[ "gemA" ] 				= "Akvamarino"
	GameText.TargetText.Spanish[ "gemA" ] 		= "Akvamarino"
	
	GameText.TargetText.English[ "gemB" ] 		= "Ruby"
	GameText.TargetText.Esperanto[ "gemB" ] 	= "Rubeno"
	GameText.TargetText.Ido[ "gemB" ] 				= "Rubeno"
	GameText.TargetText.Spanish[ "gemB" ] 		= "Rubeno"
	
	GameText.TargetText.English[ "gemC" ] 		= "Amethyst"
	GameText.TargetText.Esperanto[ "gemC" ] 	= "Ametisto"
	GameText.TargetText.Ido[ "gemC" ] 				= "Ametisto"
	GameText.TargetText.Spanish[ "gemC" ] 		= "Ametisto"
	
	GameText.TargetText.English[ "gemD" ] 		= "Jade"
	GameText.TargetText.Esperanto[ "gemD" ] 	= "Jado"
	GameText.TargetText.Ido[ "gemD" ] 				= "Jado"
	GameText.TargetText.Spanish[ "gemD" ] 		= "Jado"
	
	GameText.TargetText.English[ "coinA" ] 		= "Copper"
	GameText.TargetText.Esperanto[ "coinA" ] 	= "Kupro"
	GameText.TargetText.Ido[ "coinA" ] 				= "Kupra"
	GameText.TargetText.Spanish[ "coinA " ] 		= "Kupra"
	
	GameText.TargetText.English[ "coinB" ] 		= "Silver"
	GameText.TargetText.Esperanto[ "coinB" ] 	= "Arĝento"
	GameText.TargetText.Ido[ "coinB" ] 				= "Arĝenta"
	GameText.TargetText.Spanish[ "coinB " ] 		= "Arĝenta"
	
	GameText.TargetText.English[ "coinC" ] 		= "Gold"
	GameText.TargetText.Esperanto[ "coinC" ] 	= "Oro"
	GameText.TargetText.Ido[ "coinC" ] 				= "Ora"
	GameText.TargetText.Spanish[ "coinC " ] 		= "Ora"
	
end


