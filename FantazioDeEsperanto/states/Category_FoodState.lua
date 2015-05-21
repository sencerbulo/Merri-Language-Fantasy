CategoryFoodState = Core.class()

function CategoryFoodState:init( options )
	self.name = options.name
end

----------------------------
-- 1. SETUP AND BREAKDOWN --
----------------------------
function CategoryFoodState:Setup()
	self.textures = {
		background 		= Texture.new( "content/graphics/game/background_woodplank.png" ),
		button					= Texture.new( "content/graphics/ui/choice_button.png" ),
		button_long			= Texture.new( "content/graphics/ui/choice_button_long.png" ),
		disabledButton = Texture.new( "content/graphics/ui/choice_disabled.png" ),
		disabledButton_long = Texture.new( "content/graphics/ui/choice_button_long_disabled.png" ),
		
		girl1_1_L = Texture.new( "content/graphics/game/characters/girl1_1_L.png" ),
		girl1_2_L = Texture.new( "content/graphics/game/characters/girl1_2_L.png" ),
		girl1_1_R = Texture.new( "content/graphics/game/characters/girl1_1_R.png" ),
		girl1_2_R = Texture.new( "content/graphics/game/characters/girl1_2_R.png" ),
		
		girl2_1_L = Texture.new( "content/graphics/game/characters/girl2_1_L.png" ),
		girl2_2_L = Texture.new( "content/graphics/game/characters/girl2_2_L.png" ),
		girl2_1_R = Texture.new( "content/graphics/game/characters/girl2_1_R.png" ),
		girl2_2_R = Texture.new( "content/graphics/game/characters/girl2_2_R.png" ),
		
		girl3_1_L = Texture.new( "content/graphics/game/characters/girl3_1_L.png" ),
		girl3_2_L = Texture.new( "content/graphics/game/characters/girl3_2_L.png" ),
		girl3_1_R = Texture.new( "content/graphics/game/characters/girl3_1_R.png" ),
		girl3_2_R= Texture.new( "content/graphics/game/characters/girl3_2_R.png" ),
	}
	
	self.buttons = {}
	self.labels = {}
	self.images = {}
	
	self.score = 0
	self.scoreText = Label.new( { text = languageManager:GetString( "correct" ) .. ": " .. self.score, 
			font = fontManager.smaller, xPos = 170, yPos = 110, centered = false, color="0xffffff" } )
			
	self.questions = 0
	self.totalQuestions = Label.new( { text = languageManager:GetString( "questions" ) .. ": " .. self.questions, 
			font = fontManager.smaller, xPos = 30, yPos = 110, centered = false, color="0xffffff" } )
	
	self.cooldown = 0
	self.firstGuess = true
	
	self.background = Bitmap.new( self.textures.background )
	self:SetupUI()
	
	self.images.table = Bitmap.new( Texture.new( "content/graphics/game/table.png" ) )
	self.images.table:setPosition( 320/2 - 32/2, 180 )
	self.images.character1 = Bitmap.new( Texture.new( "content/graphics/game/characters/shopkeeper1.png" ) )
	self.images.character1:setPosition( 80, 200 )
	
	self.images.character2 = Bitmap.new( self.textures.girl1_1_L )
	self.images.character2:setPosition( 400, 200 )
	self.character2targetPos = 200
	self.customerNumber = 1
	self.customerFrame = 1
	self.customerAction = "coming"
	
	audioManager:PlaySong( "minigame1" )
	
	self.quizzer = QuizManager.new( { type = "food" } )
	
	self.currentQuestion = nil
	self.questionType = nil
	--self:GetNewQuestion()
	
	self.background:addEventListener( Event.MOUSE_DOWN, self.Event_MouseClick, self )
	self.background:addEventListener( Event.ENTER_FRAME, self.Event_Update, self )
	stage:addEventListener(Event.KEY_DOWN, self.Event_AndroidKey, self )
end

function CategoryFoodState:RandomCustomer()
	self.customerNumber = math.random( 1, 3 )
	self.images.character2:setTexture( self.textures[ "girl" .. self.customerNumber .. "_1_L"] )
	self.images.character2:setPosition( 400, 200 )
	self.customerAction = "coming"
end

function CategoryFoodState:BreakDown()
	self:Clear()
	self.background:removeEventListener( Event.MOUSE_DOWN, self.Event_MouseClick, self )
	self.background:removeEventListener( Event.ENTER_FRAME, self.Event_Update, self )
	stage:removeEventListener(Event.KEY_DOWN, self.Event_AndroidKey, self )
end

function CategoryFoodState:ClearUI()
	-- Clear and re-setup UI
	for key, button in pairs( self.buttons ) do
		button:Clear()
		self.buttons[ key ] = nil
	end
	
	for key, label in pairs( self.labels ) do
		label:Clear()
		self.labels[ key ] = nil
	end
end

function CategoryFoodState:RedrawUI()
	-- Draw new assets
	for key, button in pairs( self.buttons ) do
		button:Draw()
	end
	
	for key, label in pairs( self.labels ) do
		label:Draw()
	end
end

function CategoryFoodState:GetNewQuestion()
	-- TODO: Clean this up!!
	self:ClearUI()
	self.currentQuestion = self.quizzer:GenerateQuestion()
	self.firstGuess = true
		
	local randVal = math.random( 1, 2 )
	if randVal == 1 then -- EO phrase Question, icon answer
		self.questionType = "PhraseToIcon"
		local third = 320/3
		local offset = 3
		local y = 370
		
		local rightAnswer = math.random( 1, 3 ) -- Correct answer position
		local takenWords = {}
		table.insert( takenWords, self.currentQuestion.word_english )
		
		for i = 1, 3 do
			local buttonName = ""
			local foodTexture = nil
			local englishName = ""
		
			if i == rightAnswer then
				buttonName = self.currentQuestion.word_translated
				foodTexture = Texture.new( "content/graphics/game/foods/food_" .. self.currentQuestion.word_english .. ".png" )
			
			else
				local randomFood = nil
				
				local original = false
				while original == false do
					randomFood = self.quizzer:GetRandomItem()
					
					original = true
					for key, value in pairs( takenWords ) do
						if value == randomFood.word_english then
							original = false
						end
					end
				end
				
				print( i, randomFood.word_english )
				
				englishName = randomFood.word_english
				table.insert( takenWords, randomFood.word_english )
				buttonName = randomFood.word_translated
				foodTexture = Texture.new( "content/graphics/game/foods/food_" .. randomFood.word_english .. ".png" )
			end
			
			table.insert( self.buttons, Button.new( { name = buttonName, texture = self.textures.button, xPos = third*(i-1)+offset, yPos = y, purpose = "answer", english = englishName } ) )
			table.insert( self.buttons, Button.new( { name = buttonName, texture = foodTexture, xPos = third*(i-1)+offset + 10, yPos = y + 10 } ) )
		end
				
		table.insert( self.labels, Label.new( { text = self.currentQuestion.phrase, 
			font = fontManager.small, xPos = 20, yPos = 50, centered = true, color="0xffffff" } ) )
			
		-- Speak question
		audioManager:PlaySpecial( "iwant_" .. self.currentQuestion.word_english )
	
	elseif randVal == 2 then -- Icon Question, EO word answer
		self.questionType = "IconToWord"
		local height = 52
		local top = 480 - ( height * 3 )
		local offset = 3
		local x = 10
		
		local rightAnswer = math.random( 1, 3 ) -- Correct answer position
		local takenWords = {}
		table.insert( takenWords, self.currentQuestion.word_english )
		
		for i = 1, 3 do
			local buttonName = ""
			local englishName
		
			if i == rightAnswer then
				buttonName = self.currentQuestion.word_translated
			
			else
				local randomFood = nil
				
				local original = false
				while original == false do
					randomFood = self.quizzer:GetRandomItem()
					
					original = true
					for key, value in pairs( takenWords ) do
						if value == randomFood.word_english then
							original = false
						end
					end
				end
				
				print( i, randomFood.word_english )
			
				englishName = randomFood.word_english
				table.insert( takenWords, randomFood.word_english )
				buttonName = randomFood.word_translated
			end
			
			table.insert( self.buttons, Button.new( { name = buttonName, 
				texture = self.textures.button_long, xPos = x, yPos = top + height * (i-1), text = buttonName, font = fontManager.small, color="0xffffff", 
					centered = true, yPosText = top + height * (i-1) + 30, purpose = "answer", english = englishName } ) )
		end
				
		local foodTexture = Texture.new( "content/graphics/game/foods/food_" .. self.currentQuestion.word_english .. ".png" )
		table.insert( self.buttons, Button.new( { texture = foodTexture, xPos = 120, yPos = 0 } ) )
	
	end
	
	print( self.currentQuestion.word_english )
	
	self:RedrawUI()
	
end

function CategoryFoodState:ReloadLanguage()
end

function CategoryFoodState:SetupUI()
	-- Build background
	self.images.questionbg = Bitmap.new( Texture.new( "content/graphics/ui/question_box.png" ) )
	self.images.questionbg:setPosition( 0, 0 )
end


-----------------------------
-- 2. DRAWING AND CLEARING --
-----------------------------
function CategoryFoodState:Draw()
	stage:addChild( self.background )
	
	for key, value in pairs( self.images ) do
		stage:addChild( value ) 
	end
	
	for key, value in pairs( self.buttons ) do
		value:Draw()
	end
	
	for key, value in pairs( self.labels ) do
		value:Draw()
	end
	
	self.scoreText:Draw()
	self.totalQuestions:Draw()
end

function CategoryFoodState:Clear()
	stage:removeChild( self.background )
	
	for key, value in pairs( self.images ) do
		if stage:contains( value ) then stage:removeChild( value ) end
	end
	
	for key, value in pairs( self.buttons ) do
		value:Clear()
	end
	
	for key, value in pairs( self.labels ) do
		value:Clear()
	end
	
	self.scoreText:Clear()
	self.totalQuestions:Clear()
end

-----------------------
-- 3. EVENT HANDLING --
-----------------------
function CategoryFoodState:Event_AndroidKey( event )
	if event.keyCode == KeyCode.BACK then
		StateManager:StateSetup( "select" )
		audioManager:PlayEffect( "cancel" )
	end
end

function CategoryFoodState:Event_MouseClick( event )
	-- TODO: Clean this shit up. So much nesting.
	for key, button in pairs( self.buttons ) do
		if button:IsClicked( event ) and self.cooldown <= 0 then			
			if button.purpose == "answer" then
			
				if button.name == self.currentQuestion.word_translated then
					-- Correct
					self.quizzer:IncrementCorrectAnswers()
					self:ClearUI()
					self.customerAction = "going"
					self.cooldown = 10
					
					audioManager:PlayEffect( "correct" )
				
					self.questions = self.questions + 1
					self.totalQuestions:SetText( languageManager:GetString( "questions" ) .. ": " .. self.questions )
					
					-- Speak answer
					audioManager:PlaySpecial( self.currentQuestion.word_english )
					
					if self.firstGuess == true then						
						self.score = self.score + 1
						self.scoreText:SetText( languageManager:GetString( "correct" ) .. ": " .. self.score )
					end
				
				else
					-- Incorrect
					audioManager:PlayEffect( "incorrect" )
					
					if self.questionType == "IconToWord" then
						button.bitmap:setTexture( self.textures.disabledButton_long )
					
					elseif self.questionType == "PhraseToIcon" then
						button.bitmap:setTexture( self.textures.disabledButton )
					
					end
					-- Speak answer
					audioManager:PlaySpecial( button.english )
					
					self.firstGuess = false
	
				end
			end
			
		end	
	end
end

function CategoryFoodState:Event_Update()
	local char2X, char2Y = self.images.character2:getPosition()
	if char2X > self.character2targetPos and self.customerAction == "coming" then
		char2X = char2X - 5
		self.images.character2:setPosition( char2X, char2Y )
		
		self.customerFrame = self.customerFrame + 0.25
		if self.customerFrame > 2 then self.customerFrame = 1 end
		
		local textureName =  "girl" .. self.customerNumber .. "_" .. math.floor( self.customerFrame ) .. "_L"
		self.images.character2:setTexture( self.textures[ textureName ] )
			
		if char2X <= self.character2targetPos then
			self:GetNewQuestion()
		end
		
	elseif char2X < 400 and self.customerAction == "going" then
		char2X = char2X + 5
		self.images.character2:setPosition( char2X, char2Y )
		
		self.customerFrame = self.customerFrame + 0.25
		if self.customerFrame > 2 then self.customerFrame = 1 end
		
		local textureName =  "girl" .. self.customerNumber .. "_" .. math.floor( self.customerFrame ) .. "_R"
		self.images.character2:setTexture( self.textures[ textureName ] )	
		
		if char2X >= 400 then
			self:RandomCustomer()
		end
	
	end

	if self.cooldown > 0 then	
		self.cooldown = self.cooldown - 1
	end
end
