CharacterCreatorState = Core.class( StateBase )

function CharacterCreatorState:init( options )
	StateBase:init( options )
end

-- Setup / Teardown --
function CharacterCreatorState:Setup( options )
	StateBase:SetGotoState( "" )
	self:SetupAppearanceMenu()
	self.pronoun = ""
end

function CharacterCreatorState:SetupAppearanceMenu()
	StateBase:ClearScreen()
	self:Cleanup()
	StateBase:Setup( { backgroundScroll = true } )
	StateBase:SetBackground( { id = "background", 		path = "Content/Graphics/UI/generalbgtile.png",  pos_x = 0, pos_y = 0 } )
	
	StateBase:AddLabel( { id = "header", 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = 0, pos_y = 25, color = 0xFFFFFF, size = 20, text = GameText:Get( "helper", "Character Creator" ), centered = true } )
		
	self.baseCode = 1
	self.baseCodeMax = 15
	self.faceCode = 1
	self.faceCodeMax = 9
	self.hairCode = 1
	self.hairCodeMax = 12
	self.hairColor = { r = 100, g = 100, b = 100, a = 255 }
	
	local x = 25
	local y = 160
	local inc = 65
	
	StateBase:AddLabel( { id = "Name", 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = x, pos_y = y, color = 0xFFFFFF, size = 20, text = GameText:Get( "helper", "Name" ), centered = false } )
		
	StateBase:AddButton( { 
		button = { id = "name_text", 	path = "Content/Graphics/UI/bg_textfield.png",  	pos_x = x + 150, pos_y = y - 25  },
		label 	= { id = "name_text", 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = x + 155, pos_y = y+8, color = 0xFFFFFF, size = 20, text = "Name" }
		} )
		
	y = y + inc
	StateBase:AddLabel( { id = "Hair", 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = x, pos_y = y, color = 0xFFFFFF, size = 20, text = GameText:Get( "helper", "Hair" ), centered = false } )
		
	StateBase:AddButton( { 
		button = { id = "hair_left", 	path = "Content/Graphics/UI/btn_scroll_left.png",  	pos_x = x + 150, pos_y = y - 25  },
		} )
		
	StateBase:AddLabel( { id = "label_hair", 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = x+230, pos_y = y+5, color = 0xFFFFFF, size = 25, text = self.hairCode, centered = false } )
		
	StateBase:AddButton( { 
		button = { id = "hair_right", 	path = "Content/Graphics/UI/btn_scroll_right.png",  	pos_x = x + 275, pos_y = y - 25  },
		} )
		
	y = y + inc
	StateBase:AddLabel( { id = "HairColor", 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = x, pos_y = y, color = 0xFFFFFF, size = 20, text = GameText:Get( "helper", "Hair color" ), centered = false } )
		
	StateBase:AddButton( { 
		button = { id = "haircolor_left", 	path = "Content/Graphics/UI/btn_scroll_left.png",  	pos_x = x + 150, pos_y = y - 25  },
		} )
		
	StateBase:AddLabel( { id = "label_haircolor", 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = x+230, pos_y = y+5, color = 0xFFFFFF, size = 25, text = "0", centered = false } )
		
	StateBase:AddButton( { 
		button = { id = "haircolor_right", 	path = "Content/Graphics/UI/btn_scroll_right.png",  	pos_x = x + 275, pos_y = y - 25  },
		} )
		
	y = y + inc
	StateBase:AddLabel( { id = "Face", 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = x, pos_y = y, color = 0xFFFFFF, size = 20, text = GameText:Get( "helper", "Face" ), centered = false } )
		
	StateBase:AddButton( { 
		button = { id = "face_left", 	path = "Content/Graphics/UI/btn_scroll_left.png",  	pos_x = x + 150, pos_y = y - 25  },
		} )
		
	StateBase:AddLabel( { id = "label_face", 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = x+230, pos_y = y+5, color = 0xFFFFFF, size = 25, text = self.faceCode, centered = false } )
		
	StateBase:AddButton( { 
		button = { id = "face_right", 	path = "Content/Graphics/UI/btn_scroll_right.png",  	pos_x = x + 275, pos_y = y - 25  },
		} )
		
	y = y + inc
	StateBase:AddLabel( { id = "SkinColor", 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = x, pos_y = y, color = 0xFFFFFF, size = 20, text = GameText:Get( "helper", "Skin color" ), centered = false } )
		
	StateBase:AddButton( { 
		button = { id = "skin_left", 	path = "Content/Graphics/UI/btn_scroll_left.png",  	pos_x = x + 150, pos_y = y - 25  },
		} )
		
	StateBase:AddLabel( { id = "label_skin", 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = x+230, pos_y = y+5, color = 0xFFFFFF, size = 25, text = self.baseCode, centered = false } )
		
	StateBase:AddButton( { 
		button = { id = "skin_right", 	path = "Content/Graphics/UI/btn_scroll_right.png",  	pos_x = x + 275, pos_y = y - 25  },
		} )
		
	y = y + inc
	StateBase:AddLabel( { id = "Pronoun", 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = x, pos_y = y, color = 0xFFFFFF, size = 20, text = GameText:Get( "helper", "Pronoun" ), centered = false } )
		
	StateBase:AddButton( { 
		button = { id = "pronoun", 	path = "Content/Graphics/UI/bg_textfield.png",  	pos_x = x + 150, pos_y = y - 25  },
		label 	= { id = "pronoun", 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = x + 155, pos_y = y+8, color = 0xFFFFFF, size = 20, text = self.pronoun }
		} )
	
		
	StateBase:AddButton( { 
		button = { id = "btn_save", 	path = "Content/Graphics/UI/btn_save.png",  	pos_x = 250, pos_y = 530  },
		label 	= { id = "btn_save", 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = 255, pos_y = 530+95, color = 0xFFFFFF, size = 14, text = GameText:Get( "helper", "save" ) }
		} )
		
	self.bitmaps = {}
	
	local characterX = GLOBAL_CONFIG.SCREEN_WIDTH / 2 - 30
	local characterY = 50
	
	self.bitmaps.characterbg = Bitmap.new( Texture.new( "Content/Graphics/UI/bg_character.png" ) )
	self.bitmaps.characterbg:setPosition( characterX-8, characterY-7 )
	self.bitmaps.characterbg:setScale( 2 )
	
	self.bitmaps.base = Bitmap.new( Texture.new( "Content/Graphics/Characters/base/base1-color" .. self.baseCode .. ".png" ) )
	self.bitmaps.base:setScale( 2 )
	self.bitmaps.base:setPosition( characterX, characterY )
	
	self.bitmaps.hair = Bitmap.new( Texture.new( "Content/Graphics/Characters/hair/hair" .. self.hairCode .. "-color1.png" ) )
	self.bitmaps.hair:setColorTransform( self.hairColor.r, self.hairColor.g, self.hairColor.b, self.hairColor.a )
	self.bitmaps.hair:setScale( 2 )
	self.bitmaps.hair:setPosition( characterX, characterY )
	
	self.bitmaps.face = Bitmap.new( Texture.new( "Content/Graphics/Characters/face/face" .. self.faceCode .. "-color1.png" ) )
	self.bitmaps.face:setScale( 2 )
	self.bitmaps.face:setPosition( characterX, characterY )
	
	self:Draw()
end

function CharacterCreatorState:SetupPronounMenu()
	StateBase:ClearScreen()
	self:Cleanup()
	StateBase:Setup( { backgroundScroll = true } )
	StateBase:SetBackground( { id = "background", 		path = "Content/Graphics/UI/generalbgtile.png",  pos_x = 0, pos_y = 0 } )
	
	StateBase:AddLabel( { id = "header", 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = 0, pos_y = 25, color = 0xFFFFFF, size = 20, text = GameText:Get( "helper", "Pronouns" ), centered = true } )
		
	local x = 36
	local y = 175
	local inc = 100
	
	self.pronounList = GameText:GetPronouns()
	
	for key, pronoun in pairs( self.pronounList ) do
		StateBase:AddButton( { 
			button = { id = "btn_" .. pronoun.pronoun, 	path = "Content/Graphics/UI/btn_pronoun.png",  	pos_x = x, pos_y = y },
			label 	= { id = "btn_" .. pronoun.pronoun, 	path = "Content/Fonts/NotoSans-Bold.ttf",   			
				pos_x = x + 10, pos_y = y + 25, color = 0xFFFFFF, size = 20, text = pronoun.pronoun }
			} )
		StateBase:AddLabel( { id = "desc_" .. pronoun.pronoun, 			path = "Content/Fonts/NotoSans-Bold.ttf",		
			pos_x = x+10, pos_y = y+50, color = 0xFFFFFF, size = 15, text = pronoun.description, centered = false } )
			
		y = y + inc
	end
	
		
		
	self:Draw()
	
end

function CharacterCreatorState:Cleanup()
	StateBase:ClearWidgets()
	
	if ( self.bitmaps.characterbg ~= nil and stage:contains( self.bitmaps.characterbg ) ) then stage:removeChild( self.bitmaps.characterbg ) end
	if ( self.bitmaps.base ~= nil and stage:contains( self.bitmaps.base ) ) then stage:removeChild( self.bitmaps.base ) end
	if ( self.bitmaps.face ~= nil and stage:contains( self.bitmaps.face ) ) then stage:removeChild( self.bitmaps.face ) end
	if ( self.bitmaps.hair ~= nil and stage:contains( self.bitmaps.hair ) ) then stage:removeChild( self.bitmaps.hair ) end
end

function CharacterCreatorState:Draw()
	StateBase:Draw()
	
	stage:addChild( self.bitmaps.characterbg )
	stage:addChild( self.bitmaps.base )
	stage:addChild( self.bitmaps.face )
	stage:addChild( self.bitmaps.hair )
end

-- Callbacks --
function CharacterCreatorState:Handle_AndroidKey( event )
end

function CharacterCreatorState:Handle_KeyDown( event )
end

function CharacterCreatorState:GetNameDialogReturn( event )
	if event.buttonIndex == 1 then
		StateBase:ChangeLabelText( { id = "name_text", text = event.text } )
	end
end

function CharacterCreatorState:Handle_MouseDown( event )
	clickedButton = StateBase:ClickedButtonName( event )
	
	if ( self.pronounList ~= nil ) then
		local clickedPronoun = false
		for key, pronoun in pairs( self.pronounList ) do
			if ( clickedButton == "btn_" .. pronoun.pronoun ) then
				print( "Selected pronoun", pronoun.pronoun )
				GLOBAL_CONFIG.PRONOUN = pronoun.pronoun
				self.pronoun = pronoun.pronoun
				clickedPronoun = true
			end
		end
		
		if ( clickedPronoun ) then
			self:SetupAppearanceMenu()
		end
		
	end
	
	
	if ( clickedButton == "name_text" ) then
		local textInputDialog = TextInputDialog.new( 
			GameText:Get( "helper", "Player name" ), 
			GameText:Get( "helper", "Enter a name" ), 
			"", 
			GameText:Get( "helper", "cancel" ), 
			GameText:Get( "helper", "save" ) )
			
		textInputDialog:addEventListener( Event.COMPLETE, CharacterCreatorState.GetNameDialogReturn, self )
		textInputDialog:show()
	
	
	elseif ( clickedButton == "pronoun" ) then
		self:SetupPronounMenu()
	
	
	-- HAIR
	elseif ( clickedButton == "hair_left" ) then
		self.hairCode = self.hairCode - 1
		if ( self.hairCode < 1 ) then 
			self.hairCode = self.hairCodeMax
		end
		self.bitmaps.hair:setTexture( Texture.new( "Content/Graphics/Characters/hair/hair" .. self.hairCode .. "-color1.png" ) )
		
	
		
	elseif ( clickedButton == "hair_right" ) then
		self.hairCode = self.hairCode + 1
		if ( self.hairCode > self.hairCodeMax ) then
			self.hairCode = 1
		end
		self.bitmaps.hair:setTexture( Texture.new( "Content/Graphics/Characters/hair/hair" .. self.hairCode .. "-color1.png" ) )
		
	
	
	-- FACE
	elseif ( clickedButton == "face_left" ) then
		self.faceCode = self.faceCode - 1
		if ( self.faceCode < 1 ) then 
			self.faceCode = self.faceCodeMax
		end
		self.bitmaps.face:setTexture( Texture.new( "Content/Graphics/Characters/face/face" .. self.faceCode .. "-color1.png" ) )
		
	
		
	elseif ( clickedButton == "face_right" ) then
		self.faceCode = self.faceCode + 1
		if ( self.faceCode > self.faceCodeMax ) then
			self.faceCode = 1
		end
		self.bitmaps.face:setTexture( Texture.new( "Content/Graphics/Characters/face/face" .. self.faceCode .. "-color1.png" ) )
		
	
	
	-- SKIN
	elseif ( clickedButton == "skin_left" ) then
		self.baseCode = self.baseCode - 1
		if ( self.baseCode < 1 ) then 
			self.baseCode = self.baseCodeMax
		end
		self.bitmaps.base:setTexture( Texture.new( "Content/Graphics/Characters/base/base1-color" .. self.baseCode .. ".png" ) )
		
	
		
	elseif ( clickedButton == "skin_right" ) then
		self.baseCode = self.baseCode + 1
		if ( self.baseCode > self.baseCodeMax ) then
			self.baseCode = 1
		end
		self.bitmaps.base:setTexture( Texture.new( "Content/Graphics/Characters/base/base1-color" .. self.baseCode .. ".png" ) )
		
	end
	
	StateBase:ChangeLabelText( { id = "label_skin", text = self.baseCode } )
	StateBase:ChangeLabelText( { id = "label_face", text = self.faceCode } )
	StateBase:ChangeLabelText( { id = "label_hair", text = self.hairCode } )
	
end

function CharacterCreatorState:Handle_EnterFrame( event )
	StateBase:Update()
end

function CharacterCreatorState:ClearScreen()
	StateBase:ClearScreen()	
end

function CharacterCreatorState:ClearWidgets()
	StateBase:ClearWidgets()
end

function CharacterCreatorState:GotoState()
	return StateBase:GotoState()
end
