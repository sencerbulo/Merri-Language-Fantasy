FamilyTreeNode = Core.class()

function FamilyTreeNode:init()

end

function FamilyTreeNode:Setup( options )
	self.name = options.name
	self.gender = options.gender
	self.role = options.role
	self.position = { x = options.x, y = options.y }
	self.bitmap = Bitmap.new( options.texture )
	--self.label = Label.new( { text = languageManager:GetString( name ), font = fontManager.tiny, xPos = xPosition, yPos = yPosition, centered = false, color="0x000000" } )
	
	local r, g, b = math.random( 50, 100 ), math.random( 50, 100 ), math.random( 50, 100 )
	r = r / 100
	g = g / 100
	b = b / 100
	
	--self.bitmap:setPosition( xPosition, yPosition )
	self.bitmap:setColorTransform( r, g, b, 1 )
end

function FamilyTreeNode:UpdateSprite()
	self.bitmap:setPosition( self.position.x, self.position.y )
end

function FamilyTreeNode:Draw()
	stage:addChild( self.bitmap )
	stage:addChild( self.label )
end


function FamilyTreeNode:Clear()
	stage:removeChild( self.bitmap )
	stage:removeChild( self.label )
end