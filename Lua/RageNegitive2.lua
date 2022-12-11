


--Run every frame in -2

counter=0

-- helper for statetype comparison
function st_to_c(i)
	if i == 1 then return 'S'
	elseif i == 2 then return 'C'
	elseif i == 3 then return 'A'
	elseif i == 4 then return 'L'
	else return '?' end
end


function userscript()




	mugen.log("Test 0\n")
	local current = player.current():root()
	--current:lifemaxset(partner:lifemax())
	
	local enemy1 = current:enemy(0)
	--local enemy2 = current:enemy(1)
			--mugen.log("Test 1\n")

	current:displaynameset("Underlord");
	
	-- only apply during RoundState = 2 and when alive
	if mugen.roundstate() ~= 2 or not current:alive() then return end
	counter = counter+1
	current:displaynameset("Enraged Underlord");


	if (CodeAttacks()) then
	UltimateFreezeEnemies()
	return
	end




				--mugen.log("Test 2\n")

		-- delete any reversed helpers we have
		--for helperindex,helper in pairs(player.player_iter()) do
		local helperindex = 0;
		for helper in player.player_iter() do
					mugen.log("Test 3\n")
			if (helper:ishelper() and helper ~= current) then --is helper (?)

				--mugen.log("Test 4\n")

				if helper:root() == current or helper:teamside() == current:teamside() then --is our helpers

					--mugen.log("Test 5\n")
					local helperID = current:helperid()

					--Adjust colors on this one
					if (helper:helperid() == 123456) then
					AffectExplodes(helper);
					end

					if (helper:stateowner() == current or helper:stateowner() == helper) then --Appears to be in control
						mugen.log("Helper ("..helper:helperid()..") is free\n")

					--player.enableset(helperindex, 0)

					end

					if (helper:stateowner() ~= current and helper:stateowner() ~= helper) then --Appears to be custom stated
						mugen.log("Helper ("..helper:helperid()..") is custom stated\n")

					--player.enableset(helperindex, 0)

					end
				end
			end
		helperindex = helperindex+1
	end


end

--Helper stuff for the Enraged helper player
function AffectExplodes(ragehelper)

	--local current = player.current()
	--ragehelper.lifeset(0)


	

--			local explodindex = 0;
--		for explod in ragehelper:getexplods() do
--			if explod:exists() then
--			--	explod:alphaset(explod:removetime()*10,0);
--				explodindex = explodindex+1

--			end
--		end

end

function CodeAttacks()

local current = player.current():root()
	local enemy1 = current:enemy(0)
--local statedetails = current:state();

			enemy1:isfrozenset(0)
			enemy1:aliveset(1)

	--Rage Fury
	if (current:stateno() == 4100) then
	
		if (current:time()<420 and current:time()>160) then
			enemy1:forcecustomstate(current,5609)
			enemy1:isfrozenset(1)

			if (current:sysvar(3)<-1000) then
			enemy1:aliveset(0)
			end
		end

		if (current:time()<160 or current:time()>180) then
	
			if (current:time()>180) then enemy1:lifeset(enemy1:life()+(current:sysvar(3)/300.00)-1) end

			--if (enemy1:stateno() ~= 5609 and current:time()>180 and enemy1:time()>0) then
				--enemy1:forcecustomstate(current,5609);
			--end

			if (current:time()<400) then
			enemy1:isfrozenset(1)
			end

			return false;

		end
	end

	return false;

end

function UltimateFreezeEnemies()
	-- iterator for each player, skips over the caller by checking the current player's ID
	-- (you can also fetch player using global variable CurrCharacterID directly, but referencing player.current() is probably more intuitive)
	local current_player = player.current():root()

	for p in player.player_iter() do
		if (p:id() ~= current_player:id() and p:helperid() ~= 123456 and p:helperid() ~= 2500 and p:helperid() ~= 100000) then
			mugen.log(mugen.gametime() .. " : Converting character " .. p:name() .. " with ID " .. p:id() .. " to frozen normal-type helper\n")
			
			-- apply Freeze, set IsHelper to 1, force Normal helper type
			p:ishelperset(1)
			p:isfrozenset(1)
			p:helpertypeset(0)
		end
	end
end


-- force garbage collector params correctly before executing script proper
collectgarbage("setpause", 100)
collectgarbage("setstepmul", 200)
collectgarbage("restart")

local co = coroutine.create(userscript)
local status, err = coroutine.resume(co)
if not status then
	mugen.log("Failed to run AI execution script: " .. err .. "\n")
	local full_tb = debug.traceback(co)
	mugen.log(full_tb .. "\n")
end