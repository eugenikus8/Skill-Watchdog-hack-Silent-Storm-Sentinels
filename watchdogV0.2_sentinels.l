------------------------------------------------------
-- start global declarations for the watchdog function
swdaction = 0
-- I don't know how to get the class of a unit, so here are lookup tables
--1=scout 2=sniper 3=grenadier 4=soldier 5=medic 6=engineer 7=ninja 8=kozak    old
--1=sniper 2=soldier 3=grenadier 4=engineer 5=medic 6=scout 7=ninja 8=kozak    new
classtable = {
 ARVID = 1, EAGLE = 1, KLAUS = 1, TADAS = 1, VIPER = 1, ZINAIDA = 1,
 AHMAD = 2, FRITZ = 2, GATOR = 2, JERZEY = 2, MIKE = 2, OZ = 2, PACO = 2, RAMOS = 2,
 BOB = 3, NESSIE = 3, OLLI = 3, REGGIE = 3, ROCCO = 3, ROWDY = 3, TARAS = 3,
 AXEL = 4, DOUG = 4, HOLLY = 4, JAVIER = 4, KENKO = 4, OLEG = 4,
 ABALA = 5, DANI = 5, GARI = 5, YVES = 5,
 CARM = 6, ELF = 6, GUNNAR = 6, KATE = 6, MATT = 6, SOOK = 6, TOKI = 6, ZAIL = 6,
 SHADE = 7} --Sentinels
--darn punctuation in a name!
classtable["L.A."] = 4

--the Lua string functions do not appear to be accessible in Silent Storm,
--so I have to make yet another look up table for the hero
heroclass = {
 ALLIESSNIPER = 1, ALLIESSNIPERFEMALE = 1, AXISSNIPER = 1, AXISSNIPERFEMALE = 1,
 ALLIESSOLDIER = 2, ALLIESSOLDIERFEMALE = 2, AXISSOLDIER = 2, AXISSOLDIERFEMALE = 2,
 ALLIESGRENADER = 3, ALLIESGRENADERFEMALE = 3, AXISGRENADER = 3, AXISGRENADERFEMALE = 3,
 ALLIESENGINEER = 4, ALLIESENGINEERFEMALE = 4, AXISENGINEER = 4, AXISENGINEERFEMALE = 4,
 ALLIESMEDIC = 5, ALLIESMEDICFEMALE = 5, AXISMEDIC = 5, AXISMEDICFEMALE = 5,
 ALLIESSCOUT = 6, ALLIESSCOUTFEMALE = 6, AXISSCOUT = 6, AXISSCOUTFEMALE = 6,
 HEROMALEVOICEONE = 8, HEROMALEVOICETWO = 8} --KAZAKI MOD

--Skill growth lookup tables
--the skills are adjusted according to skill = level * slope + icp
--all of the values below are based on my observations of setxplevel
--from level 1 to 28.

-- Коэффициенты роста навыков (slope) для классов
--               melee,  shoot, throw, burst, snipe, steal, spot,  med,   engin, VP,    AP,    IC,    interrupt
--               милик,  стрел, мет-е, очрдь, снайп, хайд,  набл,  медиц, инжен, VP,    AP,    уклон, перехват
sniperslope =    {2.2,   7.3,   3.9,   1.0,   7.5,   4.6,   7.3,   2.1,   1.0,   5.0,   1.4,   2.5,   5.4}
soldierslope =   {5.7,   7.2,   4.0,   7.5,   2.0,   3.7,   3.7,   2.0,   2.0,   8.6,   1.4,   3.6,   5.4}
grenadierslope = {5.7,   7.2,   7.5,   4.0,   2.0,   2.0,   3.7,   2.0,   3.8,   11.5,  1.4,   2.9,   3.6}
engineerslope =  {3.8,   5.8,   3.8,   3.8,   2.1,   3.7,   3.9,   4.0,   7.5,   7.9,   1.2,   2.1,   3.6}
medicslope =     {5.6,   5.4,   3.8,   2.0,   3.9,   3.7,   3.9,   7.5,   2.2,   6.5,   1.3,   2.1,   4.3}
scoutslope =     {7.5,   5.5,   5.7,   3.9,   1.1,   7.4,   5.5,   2.1,   1.0,   6.1,   1.7,   3.6,   5.7}
ninjaslope =     {10.7,  3.6,   10.6,  1.4,   1.5,   10.6,  7.8,   4.7,   1.4,   3.1,   2.5,   4.2,   10.0}
kozakslope =     {5.3,   5.9,   5.0,   5.3,   2.2,   6.0,   5.5,   2.3,   2.1,   7.2,   1.7,   3.6,   4.3} --KAZAKI MOD
allslopes = {sniperslope, soldierslope, grenadierslope, engineerslope, medicslope, scoutslope, ninjaslope, kozakslope}

-- Итеративный алгоритм ближайших точек (Iterative Closest Point — ICP)
--               melee,  shoot, throw, burst, snipe, steal, spot,  med,   engin, VP,    AP,    IC,    interrupt
--               милик,  стрел, мет-е, очрдь, снайп, хайд,  набл,  медиц, инжен, VP,    AP,    уклон, перехват
snipericp =      {16,    25,    9,     8,     20,    20,    15,    20,    20,    60,    51,    1,     20}   --СЛ 2,  ЛВ 10, ИН 8
soldiericp =     {15,    25,    5,     10,    20,    20,    15,    20,    20,    60,    51,    1,     20}   --СЛ 2,  ЛВ 10, ИН 8
grenadiericp =   {17,    22,    20,    20,    10,    15,    5,     5,     5,     140,   45,    1,     20}   --СЛ 10, ЛВ 7,  ИН 3
engineericp =    {10,    20,    5,     5,     20,    15,    20,    20,    20,    60,    47,    1,     20}   --СЛ 2,  ЛВ 8,  ИН 10
medicicp =       {10,    20,    5,     5,     20,    15,    20,    20,    20,    60,    47,    1,     20}   --СЛ 2,  ЛВ 8,  ИН 10
scouticp =       {15,    25,    7,     7,     22,    20,    15,    20,    20,    60,    51,    1,     20}   --СЛ 2,  ЛВ 10, ИН 8
ninjaicp =       {20,    25,    21,    20,    20,    15,    15,    15,    15,    133,   47,    1,     20}
kozakicp =       {26,    28,    24,    25,    19,    22,    9,     14,    12,    130,   53,    1,     20} --KAZAKI MOD
allicp = {snipericp, soldiericp, grenadiericp, engineericp, medicicp, scouticp, ninjaicp, kozakicp}

trooplastlevel = {0,0,0,0,0,0,0}
--end global declarations for the watchdog function
---------------------------------------------------------------------------
function watchdog()
  --skill watchdog v0.2 by Chuck Chargin Jr.
  --now with fuzziness!
  --due to some oddities with the bases this function will not run there
  --you can force watchdog to run by setting swdaction ~= 0 in the console
  --@swdaction = 10 will force an update of the skills of your hero
  --@swdaction = 11-16 will force an update of the skills of an individual troop
  --             11=first troop, 12=second troop, etc...
  --             (note you only get a troop 6 on certain missions)
  --@swdaction = 17 will force an update of all your troops
  --@swdaction = any other number forces a normal check 
  --             (only useful if you want to force a check at the base)
  out("SWD: skill watchdog V0.2 starting")
  while 1 do
    if IsValid(GetHero()) then
      local party = GetParty()
      local hero = GetHero()
      --collect the current troop levels so we don't update the skills
      --every time we enter a mission or a camp site
      if trooplastlevel[1] == 0 then
        out("SWD: skill watchdog initializing troop levels")
        trooplastlevel[1] = UnitGetSkillMaxValue(hero,ST_LEVEL)
        for i = 1, 6 do
          if IsValid(GroupGetUnit( party, i )) then
            --out("SWD: valid troop: ",i)
            trooplastlevel[i+1] = UnitGetSkillMaxValue(GroupGetUnit( party, i ),ST_LEVEL)
          else
            --out("SWD: invalid troop: ",i)
            trooplastlevel[i+1] = 0
          end
        end
      elseif IsValid(GetObject("pkrepair")) == nil or swdaction ~= 0 then  
        --due to some oddities with the bases this function will not run there
        --unless forced to run by setting swdaction ~= 0
        if swdaction ~= 0 then
          out("SWD: Level check forced by swdaction")
        end
        local troopclass = 0
        local trooplevel = 0
        local currentskill = 0
        local skilltarget = 0
        local slopecalc = 0
        local troops = {}
        troops[1] = GroupGetUnit( party, 1 )
        troops[2] = GroupGetUnit( party, 2 )
        troops[3] = GroupGetUnit( party, 3 )
        troops[4] = GroupGetUnit( party, 4 )
        troops[5] = GroupGetUnit( party, 5 )
        troops[6] = GroupGetUnit( party, 6 )

        --first lets take care of the hero
        --get the troops class
        troopclass = heroclass[UnitGetName(hero)]
        --get the troops level
        trooplevel = UnitGetSkillMaxValue(hero,ST_LEVEL)
        --only mod the troop if their level has changed
        if trooplastlevel[1] ~= trooplevel or swdaction == 10 then
          if swdaction ~= 0 then
            out("SWD: hero skill change forced by swdaction")
          else
            out("SWD: hero changed levels")
          end
          trooplastlevel[1] = trooplevel
          for j = 0, 12 do
            --get the troops current skill level for skill j
            currentskill = UnitGetSkillMaxValue(hero, j)
            --add some fuzz to the slope
            slopecalc = allslopes[troopclass][j+1]
            if random(100) < 51 then
              slopecalc = slopecalc + (slopecalc * (1 / random(32,60)))
            else
              slopecalc = slopecalc - (slopecalc * (1 / random(32,60)))
            end
            --get the target level for skill j for this troops class
            skilltarget = trooplevel * slopecalc + allicp[troopclass][j+1]
            --if the current skill is lower than the target change it
            if  currentskill < skilltarget then
              UnitSetSkillMaxValue(hero,j,skilltarget)
            else
              --the current skill is higher than the target, so we leave it alone
            end
          end
        end

        --now lets take care of the rest of the group
        for i = 1, GroupGetSize(party)-1 do
          --out ("SWD: working on: ", UnitGetName(troops[i]))
          --get the troops class
          troopclass = classtable[UnitGetName(troops[i])]
          --get the troops level
          trooplevel = UnitGetSkillMaxValue(troops[i],ST_LEVEL)
          --only mod the troop if their level has changed or forced by swdaction
          if trooplastlevel[i+1] ~= trooplevel or ((swdaction - 10) == i) or swdaction == 17 then
            trooplastlevel[i+1] = trooplevel
            if swdaction ~= 0 then
              out("SWD: troop ", i, " skill change forced by swdaction")
            else
              out("SWD: troop ", i, " changed levels")
            end
            for j = 0, 12 do
              --get the troops current skill level for skill j
              currentskill = UnitGetSkillMaxValue(troops[i], j)
              --add some fuzz to the slope
              slopecalc = allslopes[troopclass][j+1]
              if random(100) < 51 then
                slopecalc = slopecalc + (slopecalc * (1 / random(32,60)))
              else
                slopecalc = slopecalc - (slopecalc * (1 / random(32,60)))
              end
              --get the target level for skill j for this troops class
              skilltarget = trooplevel * slopecalc + allicp[troopclass][j+1]
              --if the current skill is lower than the target change it
              if  currentskill < skilltarget then
                UnitSetSkillMaxValue(troops[i],j,skilltarget)
              else
                --the current skill is higher than the target, so we leave it alone
              end
            end  --this is the end of: for j = 0, 12 do
          end  --this is the end of: if trooplastlevel[i+1] ~= trooplevel then
        end  --this is the end of: for i = 1, GroupGetSize(party)-1 do
      else
        out("SWD: At base, doing nothing")
      end  --this is the end of: if trooplastlevel[1] == 0 then
    end  --this is the end of: if IsValid(GetHero()) then
  swdaction = 0
  --sleep for 60 seconds
  Sleep(1200)
  end   --this is the end of: while 1 do
  out("SWD: skill watchdog exiting")
end  --this is the end of: function watchdog()
--------------------------------
-- 
StartThread(watchdog)
