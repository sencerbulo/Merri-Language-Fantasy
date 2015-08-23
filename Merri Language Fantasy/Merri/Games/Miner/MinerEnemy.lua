MinerEnemy = Core.class()

function MinerEnemy:init( options )
	self.textures = {}
	self.alive = true
	self.frozen = false
end

function MinerEnemy:SetTextures( options )
	self.textures.normal = options.normalTexture
	self.textures.frozen = options.frozenTexture
	self.bitmap = Bitmap.new( self.textures.normal )
end

function MinerEnemy:SetType( options )
	self.type = options.type
end

function MinerEnemy:SetName( options )
	self.label = TextField.new( MinerGameState.fonts.overhead, GameText:Get( "target", options.type ) )
	self.label:setTextColor( 0xFFFFFF )
end

function MinerEnemy:Die( tileWidth )
	local x, y = self:getPosition()
	self.bitmap:setRotation( 180 )
	self.bitmap:setPosition( x + tileWidth, y + tileWidth )
	self.alive = false
end

function MinerEnemy:IsAlive()
	return self.alive
end

function MinerEnemy:Clear()
	stage:removeChild( self.bitmap )
	stage:removeChild( self.label )
end

function MinerEnemy:Draw()
	stage:addChild( self.bitmap )
	stage:addChild( self.label )
end

function MinerEnemy:AdjustLighting( distance )
	local r = 1 - ( 0.25 * ( distance - 1 ) )
	local g = 1 - ( 0.25 * ( distance - 1 ) )
	local b = 1 - ( 0.25 * ( distance - 1 ) )
	local a = 1
	
	self.bitmap:setColorTransform( r, g, b, a )
	self.label:setColorTransform( r, g, b, a )
end

function MinerEnemy:setPosition( x, y )
	self.bitmap:setPosition( x, y )
	self.label:setPosition( x, y )
end

function MinerEnemy:Shiver( frame )
	if ( self.frozen == true ) then		
		if ( math.floor( frame ) % 2 == 0 ) then
			x = self.originalX + 1
		else
			x = self.originalX - 1
		end
		
		self:setPosition( x, self.originalY )
	end
end

function MinerEnemy:Freeze()
	local x, y = self:getPosition()
	self.originalX = x
	self.originalY = y
	self.frozen = true
	self.bitmap:setTexture( self.textures.frozen )
end

function MinerEnemy:Unfreeze()
	self:setPosition( self.originalX, self.originalY )
	self.frozen = false
	self.bitmap:setTexture( self.textures.normal )
end

function MinerEnemy:getPosition()
	return self.bitmap:getPosition()
end

function MinerEnemy:Update()
end
