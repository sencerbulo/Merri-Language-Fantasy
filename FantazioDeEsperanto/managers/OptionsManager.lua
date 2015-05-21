OptionsManager = Core.class()

function OptionsManager:init( options )
	OptionsManager.demo = options.demo
	if ( OptionsManager.demo == true ) then 		
		print( "Demo Version" )
	else 									
		print( "Full Version" )
	end
end

function OptionsManager:AddFont( key, fontName, width )
end

