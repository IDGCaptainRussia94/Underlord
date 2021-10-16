 ; The CMD file.
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:
;   B, DB, D, DF, F, UF, U, UB     (all CAPS)
;   corresponding to back, down-back, down, downforward, etc.
; The six buttons are:
;   a, b, c, x, y, z               (all lower case)
;   In default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you use a and b.
;   For 6 button characters, use abc for kicks and xyz for punches.
;
; Each [Command] section defines a command that you can use for
; state entry, as well as in the CNS file.
; The command section should look like:
;
;   [Command]
;   name = some_name
;   command = the_command
;   time = time (optional -- defaults to 15 if omitted)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas.
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held down
;          egs. command = /D       ;hold the down direction
;               command = /DB, a   ;hold down-back while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
;   dollar ($) - Direction-only: detect as 4-way
;          egs. command = $D       ;will detect if D, DB or DF is held
;               command = $B       ;will detect if B, DB or UB is held
;   plus (+) - Buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   You can combine them:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;   It's recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This matches the way most
;   popular fighting games implement their command detection.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. Defaults to 15
;   if omitted
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands examples are given below.
;
; [Command] ;Quarter circle forward + x
; name = "QCF_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2QCF_y"
; command = ~D, DF, F, D, DF, F, y
;
; [Command] ;Tap b rapidly
; name = "5b"
; command = b, b, b, b, b
; time = 30
;
; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10
; 
; [Command] ;Charge down, then up + c
; name = "charge_D_U_c"
; command = ~60$D, U, c
; time = 10
; 

;-| AI Activation Commands |-----------------------------------------------
; From BBH
[Command]
name = "CPU0"
command = U,U,D,D,B,F,B,F,s,s
time = 0

[Command]
name = "CPU1"
command = U,U,D,D,B,F,B,F,a,a
time = 0

[Command]
name = "CPU2"
command = U,U,D,D,B,F,B,F,b,b
time = 0

[Command]
name = "CPU3"
command = U,U,D,D,B,F,B,F,c,c
time = 0

[Command]
name = "CPU4"
command = U,U,D,D,B,F,B,F,x,x
time = 0

[Command]
name = "CPU5"
command = U,U,D,D,B,F,B,F,y,y
time = 0

[Command]
name = "CPU6"
command = U,U,D,D,B,F,B,F,z,z
time = 0

[Command]
name = "CPU7"
command = U,U,D,D,B,F,B,F,a,b
time = 0

[Command]
name = "CPU8"
command = U,U,D,D,B,F,B,F,b,c
time = 0

[Command]
name = "CPU9"
command = U,U,D,D,B,F,B,F,a,c
time = 0

[Command]
name = "CPU10"
command = U,U,D,D,B,F,B,F,x,y
time = 0

[Command]
name = "CPU11"
command = U,U,D,D,B,F,B,F,y,z
time = 0

[Command]
name = "CPU12"
command = U,U,D,D,B,F,B,F,x,z
time = 0

[Command]
name = "CPU13"
command = U,U,D,D,B,F,B,F,a,x
time = 0

[Command]
name = "CPU14"
command = U,U,D,D,B,F,B,F,a,y
time = 0

[Command]
name = "CPU15"
command = U,U,D,D,B,F,B,F,a,z
time = 0

[Command]
name = "CPU16"
command = U,U,D,D,B,F,B,F,b,x
time = 0

[Command]
name = "CPU17"
command = U,U,D,D,B,F,B,F,b,y
time = 0

[Command]
name = "CPU18"
command = U,U,D,D,B,F,B,F,b,z
time = 0

[Command]
name = "CPU19"
command = U,U,D,D,B,F,B,F,c,x
time = 0

[Command]
name = "CPU20"
command = U,U,D,D,B,F,B,F,c,y
time = 0


;-| Super Motions |--------------------------------------------------------
;The following two have the same name, but different motion.
;Either one will be detected by a "command = TripleKFPalm" trigger.
;Time is set to 20 (instead of default of 15) to make the move
;easier to do.
;

[Command]
name = "Awaken"
command = ~D,D,D,s

[Command]
name = "ShadowGas"
command = ~B, DB, D, DB, B, y+z

[Command]
name = "DarkGodBlessing"
command = ~F, DF, D, DF, F, y+z

[Command]
name = "BeatDown"
command = ~F, DF, D, DF, F, x+y

[Command]
name = "GroundPound"
command = ~B, DB, D, DB, B, x+y

[Command]
name = "BrownAlbert"
command = ~D, DF, F, a+b

[Command]
name = "Shade Avalanche"
command = ~D,D,D,D, z
time = 35

[Command]
name = "BuildingSmash"
command = ~D, DB, B, x+y

[Command]
name = "Spinx"
command = ~D, DB, B, y+z

[Command]
name = "boom"
command = x+y

[Command]
name = "Seismo"
command = ~D, DB, B, a+b
time = 45

[Command]
name = "SuperBuble!"
command = ~B, DB, D, DF, F, y+z
time = 15

[Command]
name = "easysupyz"
command = y+z
time = 15

[Command]
name = "easysupxy"
command = x+y
time = 15

[Command]
name = "easysupbc"
command = b+c
time = 15

[Command]
name = "easysupab"
command = a+b
time = 15

;-| Special Motions |------------------------------------------------------

[Command]
name = "teleport"
command = ~D,D, x

[Command]
name = "shadow command"
command = ~D,D, y

[Command]
name = "Force Kick"
command = ~D,F, c

[Command]
name = "explosive grapple"
command = ~D,F, x

[Command]
name = "shadow slash"
command = ~D,B, z

[Command]
name = "shadow strike"
command = ~D,B, y

[Command]
name = "cant stop me"
command = ~D,F, z

[Command]
name = "face to foot"
command = ~D,F, b

[Command]
name = "air smot"
command = ~D,B, x

[Command]
name = "unjust cut"
command = ~D,F, y


[Command]
name = "EX1"
command = ~D,F, x+y

[Command]
name = "EX2"
command = ~D,B, x+y
[Command]

name = "EX3"
command = ~D,F, a+b

[Command]
name = "dragon1"
command = ~D, DB, B, x

[Command]
name = "dragon2"
command = ~B, DB, D, DF, F, y
;time = 45

[Command]
name = "dragon3"
command = ~D, DF, F, x

[Command]
name = "Donald"
command = ~F ,D, DF, z
time = 15

[Command]
name = "Junksion"
command = ~D, DB, B, b
time = 15

[Command]
name = "russel"
command = ~D, DF, F, b
time = 15

[Command]
name = "Bucky"
command = ~D, DB, B, y
time = 15

[Command]
name = "Slash"
command = ~D, DB, B, c
time = 15

[Command]
name = "Slash2"
command = ~D, DB, B, a
time = 15

[Command]
name = "Slash3"
command = ~D, DF, F, b
time = 15

[Command]
name = "Assist"
command = ~D, DF, F, a 
time = 15

[Command]
name = "Assist2"
command = ~D, DF, F, y 
time = 15

[Command]
name = "Assist4"
command = ~D, DB, B, y 
time = 15

[Command]
name = "Assist5"
command = ~D, DB, B, z 
time = 15

[Command]
name = "Assist6"
command = ~F, D, DF, y 
time = 15

[Command]
name = "Phant"
command = ~D, DB, B, y
time = 15

[Command]
name = "Phant2"
command = ~D, DB, B, z
time = 15

[Command]
name = "SuperJumpUp"
command = D, U

[Command]
name = "SuperJumpFwd"
command = D, UF

[Command]
name = "SuperJumpBck"
command = D, UB

[Command]
name = "UFRun"     
command = /UF, y+z

[Command]
name = "UBRun"     
command = /UB, y+z

[Command]
name = "DFRun"     
command = /DF, y+z


[Command]
name = "DBRun"     
command = /DB, y+z

[Command]
name = "FRun"     
command = /F, y+z

[Command]
name = "BRun"     
command = /B, y+z 


[Command]
name = "URun"     
command = /U, y+z

[Command]
name = "DRun"     
command = /D, y+z

[Command]
name = "HoldB"
command = /b

[Command]
name = "HoldC"
command = /c

[Command]
name = "HoldA"
command = /a

[Command]
name = "HoldZ"
command = /z

[Command]
name = "HoldX"
command = /x

[Command]
name = "HoldY"
command = /y

[Command]
name = "HoldZ"
command = /z

[Command]
name = "HoldKICKS"
command = /a+b 

[Command]
name = "Up"
command = U

[Command]
name = "Down"
command = D



;-| Dir + Button |---------------------------------------------------------

[Command]
name = "fwd_a"
command = /F,a
time = 1

[Command]
name = "fwd_b"
command = /F,b
time = 1

[Command]
name = "fwd_c"
command = /F,c
time = 1

[Command]
name = "back_a"
command = /B,a
time = 1

[Command]
name = "back_b"
command = /B,b
time = 1

[Command]
name = "back_c"
command = /B,c
time = 1

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

[Command]
name = "down_c"
command = /$D,c
time = 1

[Command]
name = "fwd_x"
command = /F,x
time = 1

[Command]
name = "fwd_y"
command = /F,y
time = 1

[Command]
name = "fwd_z"
command = /F,z
time = 1

[Command]
name = "back_x"
command = /B,x
time = 1

[Command]
name = "back_y"
command = /B,y
time = 1

[Command]
name = "back_z"
command = /B,z
time = 1

[Command]
name = "down_x"
command = /$D,x
time = 1

[Command]
name = "down_y"
command = /$D,y
time = 1

[Command]
name = "down_z"
command = /$D,z
time = 1

[Command]
name = "up_x"
command = /$U,x
time = 1

[Command]
name = "up_y"
command = /$U,y
time = 1

[Command]
name = "up_z"
command = /$U,z
time = 1

[Command]
name = "up_a"
command = /$U,a
time = 1

[Command]
name = "up_b"
command = /$U,b
time = 1

[Command]
name = "up_c"
command = /$U,c
time = 1

[Command]
name = "airlaucher"
command = /DF, z
time = 1


;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 5

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = s
time = 1

;-| Hold Dir |--------------------------------------------------------------

[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

;---------------------------------------------------------------------------
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.  
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.


; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]

[State 0, VarSet]
type = VarSet
trigger1 = 1
v = 10    ;fv = 10
value = 0
ignorehitpause = 1

[State 0, VarSet]
type = VarSet
trigger1 = stateno<1000 && movecontact
v = 10    ;fv = 10
value = fvar(30)>999
ignorehitpause = 1

[State 0, PowerAdd]
type = PowerAdd
triggerall = numhelper(7000)>0 && time>2 && numhelper(100000)<1
trigger1 = movehit && !ctrl && stateno = [199,799]
trigger1 = prevstateno != stateno
value = -50
ignorehitpause = 1
persistent = 0

[State 0, VelMul]
type = VelAdd
trigger1 = stateno = [599,649]
trigger1 = movehit && stateno!=620
y = -0.15
ignorehitpause = 1
persistent = 0

[State 0, Hacky 1.1 thing]
type = null
triggerall = numhelper(7000)>0 && time>2 && numhelper(100000)<1
triggerall = movehit && !ctrl && stateno = [199,799]
triggerall = prevstateno != stateno
trigger1 = helper(7000),cond(stateno = 620,var(20) := var(20)-150,var(20) := var(20)-50)
ignorehitpause = 1
persistent = 0

[State 0, CtrlSet]
type = CtrlSet
triggerall = numhelper(100000)<1
triggerall = numhelper(7000)>0
trigger1 = movehit && stateno = [199,799]
trigger1 = prevstateno != stateno
value = 1
ignorehitpause = 1
persistent = 0

;===========================================================================
;---------------------------------------------------------------------------

;AI Activation
[State -1]
type = VarSet
triggerall = roundstate = 2
trigger1 = command = "CPU0"
trigger2 = command = "CPU1"
trigger3 = command = "CPU2"
trigger4 = command = "CPU3"
trigger5 = command = "CPU4"
trigger6 = command = "CPU5"
trigger7 = command = "CPU6"
trigger8 = command = "CPU7"
trigger9 = command = "CPU8"
trigger10 = command = "CPU9"
trigger11 = command = "CPU10"
trigger12 = command = "CPU11"
trigger13 = command = "CPU12"
trigger14 = command = "CPU13"
trigger15 = command = "CPU14"
trigger16 = command = "CPU15"
trigger17 = command = "CPU16"
trigger18 = command = "CPU17"
trigger19 = command = "CPU18"
trigger20 = command = "CPU19"
trigger21 = command = "CPU20"
v = 13
value = 1

;AI Activation
[State -1]
type = VarSet
trigger1 = roundstate = 1
trigger2 = roundstate = 3
trigger3 = roundstate = 4
v = 13
value = 0

;AI Activation
[State -1]
type = VarSet
;triggerall = roundstate = 2
trigger1 = numhelper(9980) = 1;command = "CPU0"
v = 59
value = 1

;AI Activation
[State -1]
type = VarSet
;triggerall = roundstate = 2
trigger1 = numhelper(9981) = 1;command = "CPU0"
v = 59
value = 0

;-----------------------------------------------

;  RollRecovery 
[State -1,]
type = ChangeState
value = 681
;trigger1 = ctrl
triggerall = pos Y >= 0 
triggerall = roundstate = 2
triggerall = Alive = 1
triggerall = Life > 0
triggerall = Stateno = 5101 || Stateno = 5110 || Stateno = 5100 
trigger1 = command = "holdback"
trigger2 = command = "holdfwd"
trigger3 = numhelper(100000)<1

;===========================================================================

[State 0, Charge In]
type = ChangeState
triggerall = numhelper(100000)>0
triggerall = !ishelper
triggerall = inguarddist && stateno<200 && statetype != A && p2bodydist x > 96 && p2bodydist y < 64
triggerall = helper(100000),var(52)>650 && random%ifelse(fvar(30)>999,3000,8000)<helper(100000),var(52)
trigger1 = enemy,HitDefAttr = S, HA
trigger2 = enemy,HitDefAttr = C, HA
trigger3 = enemy,HitDefAttr = S, HP
trigger4 = enemy,HitDefAttr = S, HT
value = 3000
ctrl = 0
ignorehitpause = 1

[State 0, ChangeState]
type = ChangeState
triggerall = numhelper(100000)>0
triggerall = !ishelper && random%1000<50
trigger1 = inguarddist && stateno<200 && statetype != A
trigger1 = var(5)>200
value = 2100
ctrl = 0
ignorehitpause = 1

[State -1]
type = ChangeState
value = 800
triggerall = numhelper(100000)>0 && p2bodydist X < 8
trigger1 = inguarddist && stateno<200 && statetype != A && random%1000<50
ignorehitpause = 1

[State -1]
type = ChangeState
value = 120
triggerall = numhelper(100000)>0 && stateno!=120 && stateno != 195
trigger1 = inguarddist && stateno<200 && statetype != A
ignorehitpause = 1

;---------------------------------------------------------------------------
;Push Block (standing)  Thanks to BB Hood!
[State -1]
type = ChangeState
value = 860
triggerall = stateno = [150,151]
trigger1 = (command = "x" && command = "y") || (command = "y" && command = "z") || (command = "x" && command = "y" && command = "z")
trigger2 = numhelper(100000)<1

;Push Block (crouching)
[State -1]
type = ChangeState
value = 870
triggerall = stateno = [152,153]
trigger1 = (command = "x" && command = "y") || (command = "y" && command = "z") || (command = "x" && command = "y" && command = "z")
trigger2 = numhelper(100000)<1

;Push Block (aerial)
[State -1]
type = ChangeState
value = 880
triggerall = (command = "x" && command = "y") || (command = "y" && command = "z") || (command = "x" && command = "y" && command = "z")
trigger1 = stateno = 154
trigger2 = stateno = 155
trigger2 = Time <= 10

;===========================================================================
;---------------------------------------------------------------------------
; Air Dash
[State -1, Air Dash]
type = null;ChangeState
value = 740
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = stateno != 740
triggerall = PrevStateNo != 740
trigger1 = command = "FF"
trigger1 = StateType = A
trigger1 = ctrl
trigger2 = (command = "a" && command = "b") || (command = "b" && command = "c")
trigger2 = StateType = A
trigger2 = Ctrl

;---------------------------------------------------------------------------
;Air Dash
[State -1, Air Dash]
type = ChangeState
value = 106
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = statetype = A && stateno != [99,109]
triggerall = command = "FF"
trigger1 = ctrl
ignorehitpause = 1

;---------------------------------------------------------------------------
;Air Dash Back
[State -1, Air Dash Back]
type = ChangeState
value = 107
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = statetype = A && stateno != [99,109]
triggerall = command = "BB"
trigger1 = ctrl
ignorehitpause = 1

;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = statetype != A && stateno != [99,109]
triggerall = command = "FF"
trigger1 = ctrl
ignorehitpause = 1

;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = statetype != A && stateno != [99,109]
triggerall = command = "BB"
trigger1 = ctrl
ignorehitpause = 1

;---------------------------------------------------------------------------
;Awakening
[State -1, Awakening]
type = ChangeState
value = 4000
triggerall = var(58)>=11
triggerall = var(59) < 1 && numhelper(100000)<1 && statetype != A
triggerall = var(58)>=11 && fvar(30)<1000
triggerall = command = "Awaken"
trigger1 = ctrl

;---------------------------------------------------------------------------
;Hyper Shadow Baptism
[State -1, Hyper Shadow Baptism]
type = ChangeState
value = 3400
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = !ishelper
triggerall = NumHelper(3205)>0
triggerall = helper(3203),var(1)<60*20
triggerall = command = "ShadowGas" && power>=2000
triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Hyper Shadow Gas
[State -1, Hyper Shadow Gas]
type = ChangeState
value = 3200
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = !ishelper
triggerall = NumHelper(3201)<1 && NumHelper(3203)<1
triggerall = command = "ShadowGas" && power>=2000
triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Hyper Dark God's Wrath
[State -1, Hyper Dark God's Wrath]
type = ChangeState
value = 3300
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = !ishelper
triggerall = NumHelper(3101)>0
triggerall = command = "DarkGodBlessing" && power>=1000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = moveContact && stateno < 3000

;---------------------------------------------------------------------------
;Hyper Dark God's Blessing
[State -1, Hyper Dark God's Blessing]
type = ChangeState
value = 3100
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = !ishelper
triggerall = NumHelper(3101)<1
triggerall = command = "DarkGodBlessing" && power>=1000
triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Hyper Ground Pound
[State -1, Hyper Ground Pound]
type = ChangeState
value = 3050
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = !ishelper
triggerall = command = "GroundPound" && power>=1000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = moveContact && stateno < 3000

;---------------------------------------------------------------------------
;Hyper Beatdown
[State -1, Hyper Beatdown]
type = ChangeState
value = 3000
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = !ishelper
triggerall = command = "BeatDown" && power>=1000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = moveContact && stateno < 3000

;---------------------------------------------------------------------------
;Shade Avalanche
[State -1, Shade Avalanche]
type = SelfState
value = 3150
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = !ishelper
triggerall = command = "Shade Avalanche" && var(5) >= 250
triggerall = statetype != A
trigger1 = ctrl
trigger2 = movereversed

;===========================================================================
;EX-Shadow Clone
[State -1, EX-Shadow Clone]
type = ChangeState
value = 2100
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = var(5) >= 50
triggerall = !ishelper
triggerall = command = "EX3" && statetype != A
trigger1 = ctrl
trigger2 = stateno<2000 && movecontact

;===========================================================================
;EX-Shadow Storm
[State -1, EX-Shadow Storm]
type = ChangeState
value = 2050
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = !ishelper && statetype!=A
triggerall = command = "EX2" && var(5)>=100
trigger1 = ctrl
trigger2 = stateno<2000 && movecontact

;===========================================================================
;EX-Lash Stun
[State -1, EX-Lash Stun]
type = ChangeState
value = 2000
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = !ishelper
triggerall = command = "EX1" && power>=500
trigger1 = ctrl || (movehit)
trigger2 = stateno<2000 && movecontact

;===========================================================================
;EX-Air Smot
[State -1, EX-Air Smot]
type = Helper
stateno = 1160
id = 2050
ownpal = 1
triggerall = var(59) < 1 && numhelper(100000)<1 && var(11)<1
triggerall = var(5)>=50
triggerall = !ishelper
triggerall = command = "EX2" && power>=500 && statetype = A
trigger1 = ctrl
trigger2 = stateno<2000 && movecontact

;===========================================================================
;Air Smot
[State -1, Air Smot]
type = ChangeState
value = 1160
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = var(5)>=50
triggerall = !ishelper
triggerall = command = "air smot" && !command = "EX2" && statetype = A
trigger1 = ctrl
trigger2 = stateno<2000 && movecontact

;===========================================================================
;Face to Foot
[State -1, Face to Foot]
type = ChangeState
value = 1150
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = command = "face to foot" && statetype = A
trigger1 = ctrl
trigger2 = movecontact && stateno = [499,899]

;===========================================================================
;Slam Force Kick
[State -1, Slam Force Kick]
type = ChangeState
value = 1001
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = command = "Force Kick"
trigger1 = ctrl
trigger2 = movecontact && stateno = [100,899]

;===========================================================================
;Foot Fancy
[State -1, Foot Fancy]
type = ChangeState
value = 1100
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = command = "explosive grapple" && statetype=A
trigger1 = ctrl
trigger2 = movecontact && stateno = [499,899]

;===========================================================================
;Shadow Slash
[State -1, Shadow Slash]
type = ChangeState
value = 1050
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = var(5)>=50
triggerall = !ishelper
triggerall = command = "shadow slash" && statetype!=A
triggerall = NumTarget(1051)<1 && NumProjID(1051)<1
trigger1 = ctrl

;===========================================================================
;Shadow Strike
[State -1, Shadow Strike]
type = ChangeState
value = 1060
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = var(5)>=50
triggerall = !ishelper
triggerall = command = "shadow strike" && !command = "EX2"
trigger1 = ctrl
trigger2 = movecontact && stateno = [199,699]

;===========================================================================
;Shurakane
[State -1, Shurakane]
type = ChangeState
value = 1200
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = command = "face to foot" && statetype!=A
trigger1 = ctrl
trigger2 = movecontact && stateno = [199,599]

;===========================================================================
;Unjust Cut
[State -1, Unjust Cut]
type = ChangeState
value = 1070
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = command = "unjust cut" && statetype!=A
trigger1 = ctrl
trigger2 = movecontact && stateno = [199,599]

;===========================================================================
;Cant Stop Me
[State -1, Cant Stop me]
type = ChangeState
value = 1040
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = command = "cant stop me"
trigger1 = ctrl
trigger2 = movecontact && stateno = [199,799]

;===========================================================================
;Explosive Grapple
[State -1, Explosive Grapple]
type = ChangeState
value = 1019
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = command = "explosive grapple" && statetype!=A
trigger1 = ctrl
trigger2 = movecontact && stateno = [199,599]

;===========================================================================
;Shadow Command
[State -1, Shadow Command]
type = ChangeState
value = 1210
triggerall = fvar(30)>999 && numhelper(2500)>0 && helper(2500),var(11)<15 && helper(2500),stateno < 2502
triggerall = command = "shadow command"&& var(59) < 1 && numhelper(100000)<1
trigger1 = ctrl || (var(10)>0)
ignorehitpause = 1

;===========================================================================
;Teleport
[State -1, Teleport]
type = ChangeState
value = 1000
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = command = "teleport"
trigger1 = ctrl || (var(10)>0)
ignorehitpause = 1

;---------------------------------------------------------------------------
; Basic Throw
[State -1, Basic Throw]
type = ChangeState
value = ifelse(statetype = A,850,800)
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = command = "y"
;triggerall = statetype = S
triggerall = ctrl
;triggerall = stateno != 100
trigger1 = command = "holdfwd"
trigger1 = p2bodydist X < 15 && p2bodydist Y < 32
;trigger1 = (p2statetype = S) || (p2statetype = C) || (p2statetype = L)
;trigger1 = p2movetype != H

;---------------------------------------------------------------------------
; Air Throw
[State -1, Basic Throw]
type = null;ChangeState
value = 850
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = command = "y"
triggerall = statetype = A
triggerall = ctrl
;triggerall = stateno != 100
trigger1 = command = "holdfwd"
trigger1 = pos y <= -50
trigger1 = p2bodydist X < 10
;trigger1 = p2movetype != H
trigger1 = p2bodydist Y < 50
trigger1 = p2bodydist Y > -10

;---------------------------------------------------------------------------
;Breaker Kick
[State -1, Breaker Kick]
type = ChangeState
value = 300
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = command = "c" && power >= 500
trigger1 = statetype != A && GetHitVar(fall) = 0
trigger1 = movetype = H && stateno=[110,160]
ignorehitpause = 1

;---------------------------------------------------------------------------
;Power Charge
[State -1, Power Charge]
type = ChangeState
value = 900
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = command = "HoldY" && command = "HoldB"
triggerall = statetype != A
trigger1 = ctrl
ignorehitpause = 1

;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Air Light Punch]
type = ChangeState
value = 600
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Air Med Punch]
type = ChangeState
value = 610
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = command = "y"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno < 610 || stateno = 630

;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Air Heavy Punch]
type = ChangeState
value = 620
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = command = "z"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno < 620 || stateno = 640

;---------------------------------------------------------------------------
;Air Heavy Kick
[State -1, Stand Heavy Kick]
type = ChangeState
value = 650
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = command = "c"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno < 650

;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Crouch Light Punch]
type = ChangeState
value = 400
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = command = "x"
triggerall = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Crouch Med Punch]
type = ChangeState
value = 410
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = command = "y"
triggerall = statetype = C
trigger1 = ctrl
trigger2 = stateno < 410 || stateno = 630

;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Crouch Heavy Punch]
type = ChangeState
value = 420
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = command = "z"
triggerall = statetype = C
trigger1 = ctrl
trigger2 = stateno < 420 || stateno = 640

;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = command = "x"
triggerall = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Stand Med Punch]
type = ChangeState
value = 210
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = command = "y"
triggerall = statetype = S
trigger1 = ctrl
trigger2 = stateno < 210 || stateno = 230

;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Stand Heavy Punch]
type = ChangeState
value = 220
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = command = "z"
triggerall = statetype = S
trigger1 = ctrl
trigger2 = stateno < 220 || stateno = 240

;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Stand Heavy Kick]
type = ChangeState
value = 250
triggerall = var(59) < 1 && numhelper(100000)<1
triggerall = command = "c"
triggerall = statetype != A
trigger1 = ctrl


;---------------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = ChangeState
value = 1962
triggerall = var(59) < 1
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

;--------------------------------


[State 9000, 1]
type = Explod
trigger1 = Teamside = 1
triggerall = roundstate = 2
triggerall = Var(59) = 1
trigger1 = numexplod(1003) = 0
ID = 1003
anim = 1020; 998;
pos = 34,232
postype = left
ontop = 1
supermove = 99999
bindtime = -1
removetime = -2
ownpal = 1
scale = 0.5,0.5
sprpriority = 5
ontop = 1

[State 9000, 1]
type = Explod
trigger1 = Teamside = 2
triggerall = roundstate = 2
triggerall = Var(59) = 1
trigger1 = numexplod(1003) = 0
ID = 1003
anim = 1020; 998;
pos = 285,232
postype = left
ontop = 1
supermove = 99999
bindtime = -1
removetime = -2
ownpal = 1
scale = 0.5,0.5
sprpriority = 5
ontop = 1

[State 0, Helper]
type = Helper
triggerall = numhelper(100000)<1
triggerall = numhelper(7000)<1
triggerall = !ishelper
triggerall = power>=1000 && stateno<1000
trigger1 = command = "easysupxy"
helpertype = normal ;player
name = "MAX Mode!"
ID = 7000
stateno = 7000
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 99999
pausemovetime = 99999
ignorehitpause = 1