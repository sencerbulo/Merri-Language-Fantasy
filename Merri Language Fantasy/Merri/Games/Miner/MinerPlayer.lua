MinerPlayer = Core.class()

function MinerPlayer:init( options )
	self.textures = {}
	self.textures.south1 = Texture.new( "Content/Graphics/Characters/miner_down.png" )
	self.textures.south2 = Texture.new( "Content/Graphics/Characters/miner_down2.png" )
	self.textures.north1 = Texture.new( "Content/Graphics/Characters/miner_up.png" )
	self.textures.north2 = Texture.new( "Content/Graphics/Characters/miner_up2.png" )
	self.textures.east1 = Texture.new( "Content/Graphics/Characters/miner_right.png" )
	self.textures.east2 = Texture.new( "Content/Graphics/Characters/miner_right2.png" )
	self.textures.west1 = Texture.new( "Content/Graphics/Characters/miner_left.png" )
	self.textures.west2 = Texture.new( "Content/Graphics/Characters/miner_left2.png" )
	self.bitmap = Bitmap.new( self.textures.south1 )
	self.moveAmount = options.moveAmount
	self.frame = 1
	self.direction = "south"
	self.health = 3
	
	self.label = TextField.new( GameMinerState.fonts.overhead, GameText:Get( "target", "Miner" ) )
	self.label:setTextColor( 0xFFFFFF )
	
	self.hp = 50
	self.maxHp = 50
	self.exp = 0
	self.level = 1
end

function MinerPlayer:Face( direction )
	self.direction = direction
end

function MinerPlayer:AddHealth( amount )
	self.hp = self.hp + amount
	if ( self.hp > self.maxHp ) then		self.hp = self.maxHp 	end
end

function MinerPlayer:Move( direction, amount )
	local x, y = self:getPosition()
	
	print( "Move ", direction, amount )
	print( "From ", x, y )
	
	if ( direction == "south" ) then 		y = y + self.moveAmount		end
	if ( direction == "north" ) then 		y = y - self.moveAmount		end
	if ( direction == "east" ) then 			x = x + self.moveAmount		end
	if ( direction == "west" ) then 		x = x - self.moveAmount		end
	
	print( "To ", x, y )
	
	self:setPosition( x, y )
end

function MinerPlayer:Draw()
	stage:addChild( self.bitmap )
end

function MinerPlayer:setPosition( x, y )
	self.bitmap:setPosition( x, y )
	self.label:setPosition( x, y )
end

function MinerPlayer:getPosition()
	return self.bitmap:getPosition()
end

function MinerPlayer:Update()
	self.frame = self.frame + 0.05
	if ( self.frame >= 3 ) then
		self.frame = 1
	end
	local fr = math.floor( self.frame )
	self.bitmap:setTexture( self.textures[ self.direction .. fr ] )
end