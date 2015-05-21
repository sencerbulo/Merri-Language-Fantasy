CategoryFamilyState = Core.class()

function CategoryFamilyState:init( options )
	self.name = options.name
end

----------------------------
-- 1. SETUP AND BREAKDOWN --
----------------------------
function CategoryFamilyState:Setup()
	self.textures = {
		background 		= Texture.new( "content/graphics/game/family/background_familytree.png" ),
		button					= Texture.new( "content/graphics/ui/choice_button.png" ),
		button_long			= Texture.new( "content/graphics/ui/choice_button_long.png" ),
		disabledButton = Texture.new( "content/graphics/ui/choice_disabled.png" ),
		disabledButton_long = Texture.new( "content/graphics/ui/choice_button_long_disabled.png" ),
		
		face1 = Texture.new( "content/graphics/game/family/face1.png" ),
		face2 = Texture.new( "content/graphics/game/family/face2.png" ),
		face3 = Texture.new( "content/graphics/game/family/face3.png" ),
		face4 = Texture.new( "content/graphics/game/family/face4.png" ),
		
		male = Texture.new( "content/graphics/game/family/male.png" ),
		female = Texture.new( "content/graphics/game/family/female.png" ),
		
		tree1 = Texture.new( "content/graphics/game/family/tree1.png" ),
		tree2 = Texture.new( "content/graphics/game/family/tree2.png" ),
		tree3 = Texture.new( "content/graphics/game/family/tree3.png" ),
	}
	
	self.buttons = {}
	self.labels = {}
	self.images = {}
	self.nodes = {}
	
	--self.score = 0
	--self.scoreText = Label.new( { text = languageManager:GetString( "correct" ) .. ": " .. self.score, 
--			font = fontManager.smaller, xPos = 170, yPos = 110, centered = false, color="0xffffff" } )
			
--	self.questions = 0
--	self.totalQuestions = Label.new( { text = languageManager:GetString( "questions" ) .. ": " .. self.questions, 
--			font = fontManager.smaller, xPos = 30, yPos = 110, centered = false, color="0xffffff" } )
	
	self.cooldown = 0
	self.firstGuess = true
	
	self.background = Bitmap.new( self.textures.background )
	self:SetupUI()
	
	audioManager:PlaySong( "minigame1" )
	
	self.quizzer = QuizManager.new( { type = "food" } )
	
	self.images.tree = Bitmap.new( self.textures.tree1 )
	self.images.tree:setPosition( 50, 150 )
	
	self.currentQuestion = nil
	self.questionType = nil
	self:GetNewQuestion()
	
	self.background:addEventListener( Event.MOUSE_DOWN, self.Event_MouseClick, self )
	self.background:addEventListener( Event.ENTER_FRAME, self.Event_Update, self )
	stage:addEventListener(Event.KEY_DOWN, self.Event_AndroidKey, self )
end

function CategoryFamilyState:AddCat( xPosition, yPosition, givenRole, givenGender )
	local randomName	
	local gender = math.random( 1, 2 )
	if ( gender == 1 ) then 		randomName = "male_name_"
	else 										randomName = "female_name_"
	end
	
	local nameNumber = math.random( 1, 7 )
	randomName = randomName .. nameNumber 
	
	local randomFace = math.random( 1, 4 )
	local cat = FamilyTreeNode.new()	
	cat:Setup( {
		texture = self.textures["face" .. randomFace ],
		name = randomName,
		gender = givenGender,
		role = givenRole,
		})
	
	table.insert( self.nodes, cat )
end

function CategoryFamilyState:GenerateTree()
		
	-- BOB is the _________ of JIM
	-- BOB'S wife is __________
	
	local treeXPos = 25
	
	local randTree = math.random( 1, 3 ); randTree = 3
	self.images.tree:setTexture( self.textures[ "tree" .. randTree ] )

	-- #1. Who is the reference point
	-- #2. Are we looking for a ROLE or a PERSON for the answer
	-- #3a. What is the RELATIONSHIP between the two people, or
	-- #3b. What is the NAME of the person who fits the relationship.
	-- # No duplicate names, correctly account for gender.
	
	if ( randTree == 1 ) then
		-- Two grand parents, two parents, and one child
		
		
		self:AddCat( treeXPos+55, 150, "grandmother", "female" )
		self:AddCat( treeXPos+145, 150, "grandfather", "male" )
		
		self:AddCat( treeXPos+99, 206, "father", "male" )
		self:AddCat( treeXPos+194, 206, "mother", "female" )
		
		self:AddCat( treeXPos+155, 265 )
	
	elseif ( randTree == 2 ) then
		-- Two parents, three kids
		treeXPos = 40
		self:AddCat( treeXPos+55, 150 )
		self:AddCat( treeXPos+145, 150 )
		self:AddCat( treeXPos+99, 230 )
		self:AddCat( treeXPos+194, 230 )
		self:AddCat( treeXPos+10, 230 )
	
	
	elseif ( randTree == 3 ) then
		-- Two parents, five children, two grandchildren
		treeXPos = 40
		self:AddCat( treeXPos+75, 130, "grandmother", "female" )
		self:AddCat( treeXPos+145, 130, "grandfather", "male" )
		
		self:AddCat( treeXPos+47, 202, "mother", "female" )
		self:AddCat( treeXPos-5, 202, "father", "male" )
		self:AddCat( treeXPos+105, 202 )
		self:AddCat( treeXPos+165, 202 )
		self:AddCat( treeXPos+220, 202 )
		
		self:AddCat( treeXPos+20, 260 )
		self:AddCat( treeXPos+190, 260 )
	
	end
	self.images.tree:setPosition( treeXPos, 150 )
end

function CategoryFamilyState:GetNewQuestion()
	-- TODO: Clean this up!!
	self:ClearUI()
	self.currentQuestion = self.quizzer:GenerateQuestion()
	self.firstGuess = true
	
	self:GenerateTree()
	
	self:RedrawUI()
	
end

function CategoryFamilyState:ReloadLanguage()
end

function CategoryFamilyState:SetupUI()
	-- Build background
	--self.images.questionbg = Bitmap.new( Texture.new( "content/graphics/ui/question_box.png" ) )
	--self.images.questionbg:setPosition( 0, 0 )
end


-----------------------------
-- 2. DRAWING AND CLEARING --
-----------------------------
function CategoryFamilyState:Draw()
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
	
	for key, value in pairs( self.nodes ) do
		value:Draw()
	end
	
--	self.scoreText:Draw()
--	self.totalQuestions:Draw()
end

function CategoryFamilyState:Clear()
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
	
	for key, value in pairs( self.nodes ) do
		value:Clear()
	end
	
	self.scoreText:Clear()
	self.totalQuestions:Clear()
end

-----------------------
-- 3. EVENT HANDLING --
-----------------------
function CategoryFamilyState:Event_AndroidKey( event )
	if event.keyCode == KeyCode.BACK then
		StateManager:StateSetup( "select" )
		audioManager:PlayEffect( "cancel" )
	end
end

function CategoryFamilyState:Event_MouseClick( event )
	-- TODO: Clean this shit up. So much nesting.
	for key, button in pairs( self.buttons ) do
		if button:IsClicked( event ) and self.cooldown <= 0 then			
			if button.purpose == "answer" then
			
				if button.name == self.currentQuestion.word_translated then
					-- Correct
					self.quizzer:IncrementCorrectAnswers()
					self:ClearUI()
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

function CategoryFamilyState:Event_Update()
	if self.cooldown > 0 then	
		self.cooldown = self.cooldown - 1
	end
end

function CategoryFamilyState:BreakDown()
	self:Clear()
	self.background:removeEventListener( Event.MOUSE_DOWN, self.Event_MouseClick, self )
	self.background:removeEventListener( Event.ENTER_FRAME, self.Event_Update, self )
	stage:removeEventListener(Event.KEY_DOWN, self.Event_AndroidKey, self )
end

function CategoryFamilyState:ClearUI()
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

function CategoryFamilyState:RedrawUI()
	-- Draw new assets
	for key, button in pairs( self.buttons ) do
		button:Draw()
	end
	
	for key, label in pairs( self.labels ) do
		label:Draw()
	end
end
