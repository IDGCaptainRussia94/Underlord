


function userscript()




	local current = player.current():root()
	--current:lifemaxset(partner:lifemax())
	
	local enemy1 = current:enemy(0)
	--local enemy2 = current:enemy(1)
			--mugen.log("Test 1\n")
	
	-- only apply during RoundState = 2 and when alive
	if mugen.roundstate() ~= 2 or not current:alive() then return end

		mugen.log("Verge of dying, setting life back up\n")

	local ratio = (current:lifemax()/1000.00)
	--ratio = current:lifemax()/ratio;

		local max = current:lifemax();
	local health = max+(current:sysvar(3)*ratio)

	if (health<0) then health = 0 end
	if (health>max) then health = max end


	current:lifeset(health)


end


local status, err = pcall(userscript)
if not status then
	mugen.log("Failed to run user script: " .. err .. "\n")
end