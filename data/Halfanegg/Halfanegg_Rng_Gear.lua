-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	state.OffenseMode:options('Normal','Acc')
	state.RangedMode:options('Normal','Acc')
	state.WeaponskillMode:options('Match','Normal', 'Acc')
	state.IdleMode:options('Normal', 'PDT')
	state.Weapons:options('Gastraphetes','Annihilator')

	DefaultAmmo = {['Gastraphetes']="Quelling Bolt"}
	U_Shot_Ammo = {['Fomalhaut']="Animkii Bullet"}

	gear.tp_ranger_jse_back = {name="Belenus's Cape",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}}
	gear.wsd_ranger_jse_back = {name="Belenus's Cape",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}}

	    -- Additional local binds
  --send_command('bind !` input /ra <t>')
	--send_command('bind !backspace input /ja "Bounty Shot" <t>')
	--send_command('bind @f7 gs c toggle RngHelper')
	--send_command('bind @` gs c cycle SkillchainMode')
	--send_command('bind !r gs c weapons MagicWeapons;gs c update')
	--send_command('bind ^q gs c weapons SingleWeapon;gs c update')

	select_default_macro_book()

end

-- Set up all gear sets.
function init_gear_sets()
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Weapons sets
	sets.weapons.Annihilator = {main="Perun +1",sub="Nusku Shield",range="Annihilator",ammo="Eradicating Bullet"}
	sets.weapons.Gastraphetes = {main="Perun +1",sub="Nusku Shield",range="Gastraphetes",ammo="Quelling Bolt"}


	-- Precast sets to enhance JAs
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.precast.JA['Bounty Shot'] = set_combine(sets.TreasureHunter, {hands="Amini Glove. +1"})
	sets.precast.JA['Camouflage'] = {body="Orion Jerkin +1"}
	sets.precast.JA['Scavenge'] = {feet="Orion Socks +1"}
	sets.precast.JA['Shadowbind'] = {hands="Orion Bracers +1"}
	sets.precast.JA['Sharpshot'] = {legs="Orion Braccae +1"}
	sets.precast.JA['Double Shot'] = {back=gear.tp_ranger_jse_back}


	-- Fast cast sets for spells

    sets.precast.FC = {
        head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Prolix Ring",ring2="Lebeche Ring",
        back="Moonlight Cape",waist="Flume Belt",legs="Rawhide Trousers",feet="Carmine Greaves +1"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})


	-- Ranged sets (snapshot)

	sets.precast.RA = {
	    head={ name="Arcadian Beret +1", augments={'Enhances "Recycle" effect',}},
	    body="Sylvan Caban +1",
	    hands="Meg. Gloves +2",
	    legs={ name="Adhemar Kecks +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}},
	    feet="Meg. Jam. +1",
	    neck="Scout's Gorget +2",
	    waist="Impulse Belt",
	    left_ear="Telos Earring",
	    right_ear="Sherida Earring",
	    left_ring="Epona's Ring",
	    right_ring="Chirich Ring +1",
	    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+5','"Store TP"+10','Damage taken-5%',}},
	}

	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {})


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		    head={ name="Arcadian Beret +1", augments={'Enhances "Recycle" effect',}},
		    body={ name="Herculean Vest", augments={'Rng.Acc.+21 Rng.Atk.+21','"Snapshot"+2','AGI+6','Rng.Acc.+6','Rng.Atk.+10',}},
		    hands="Meg. Gloves +2",
		    legs="Meg. Chausses +1",
		    feet={ name="Herculean Boots", augments={'Rng.Acc.+23 Rng.Atk.+23','Sklchn.dmg.+1%','DEX+7','Rng.Atk.+7',}},
		    neck="Scout's Gorget +2",
		    waist="Fotia Belt",
		    left_ear="Ishvara Earring",
		    right_ear="Sherida Earring",
		    left_ring="Ilabrat Ring",
		    right_ring="Petrov Ring",
		    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+5','"Store TP"+10','Damage taken-5%',}},
		}

    sets.precast.WS.Acc = {
		    head={ name="Arcadian Beret +1", augments={'Enhances "Recycle" effect',}},
		    body="Orion Jerkin +2",
		    hands="Meg. Gloves +2",
		    legs="Meg. Chausses +1",
		    feet="Meg. Jam. +1",
		    neck="Scout's Gorget +2",
		    waist="Fotia Belt",
		    left_ear="Ishvara Earring",
		    right_ear="Sherida Earring",
		    left_ring="Ilabrat Ring",
		    right_ring="Petrov Ring",
		    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+5','"Store TP"+10','Damage taken-5%',}},
		}

    sets.precast.WS['Wildfire'] = {
        head=gear.herculean_nuke_head,neck="Baetyl Pendant",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Samnuha Coat",hands="Carmine Fin. Ga. +1",ring1="Regal Ring",ring2="Dingir Ring",
        back=gear.wsd_ranger_jse_back,waist="Eschan Stone",legs="Gyve Trousers",feet=gear.herculean_nuke_feet}

    sets.precast.WS['Wildfire'].Acc = {
        head=gear.herculean_nuke_head,neck="Sanctity Necklace",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Samnuha Coat",hands="Leyline Gloves",ring1="Regal Ring",ring2="Dingir Ring",
        back=gear.wsd_ranger_jse_back,waist="Eschan Stone",legs="Gyve Trousers",feet=gear.herculean_nuke_feet}

    sets.precast.WS['Trueflight'] = {
		    head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+6%','STR+10','Mag. Acc.+7','"Mag.Atk.Bns."+13',}},
		    body={ name="Herculean Vest", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Weapon skill damage +2%','"Mag.Atk.Bns."+14',}},
		    hands={ name="Herculean Gloves", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','Weapon skill damage +2%','"Mag.Atk.Bns."+14',}},
		    legs={ name="Herculean Trousers", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+5%','AGI+10','"Mag.Atk.Bns."+10',}},
		    feet={ name="Herculean Boots", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Phys. dmg. taken -4%','STR+1','Mag. Acc.+14','"Mag.Atk.Bns."+9',}},
		    neck="Scout's Gorget +2",
		    waist="Eschan Stone",
		    left_ear="Friomisi Earring",
		    right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		    left_ring="Dingir Ring",
		    right_ring="Weather. Ring",
		    back={ name="Belenus's Cape", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
		}

    sets.precast.WS['Trueflight'].Acc = {
		    head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+6%','STR+10','Mag. Acc.+7','"Mag.Atk.Bns."+13',}},
		    body={ name="Herculean Vest", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Weapon skill damage +2%','"Mag.Atk.Bns."+14',}},
		    hands={ name="Herculean Gloves", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','Weapon skill damage +2%','"Mag.Atk.Bns."+14',}},
		    legs={ name="Herculean Trousers", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+5%','AGI+10','"Mag.Atk.Bns."+10',}},
		    feet="Meg. Jam. +1",
		    neck="Scout's Gorget +2",
		    waist="Eschan Stone",
		    left_ear="Friomisi Earring",
		    right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		    left_ring="Ilabrat Ring",
		    right_ring="Weather. Ring",
		    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+5','"Store TP"+10','Damage taken-5%',}},
		}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	--------------------------------------
	-- Midcast sets
	--------------------------------------

	-- Fast recast for spells

    sets.midcast.FastRecast = {
        head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
        back="Moonlight Cape",waist="Flume Belt",legs="Rawhide Trousers",feet="Carmine Greaves +1"}

	-- Ranged sets

    sets.midcast.RA = {
		    head={ name="Arcadian Beret +1", augments={'Enhances "Recycle" effect',}},
		    body="Orion Jerkin +2",
		    hands={ name="Adhemar Wrist. +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}},
		    legs={ name="Adhemar Kecks +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}},
		    feet="Meg. Jam. +2",
		    neck="Scout's Gorget +2",
		    waist="Impulse Belt",
		    left_ear="Telos Earring",
		    right_ear="Dedition Earring",
		    left_ring="Ilabrat Ring",
		    right_ring="Rajas Ring",
		    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+5','"Store TP"+10','Damage taken-5%',}},
		}

    sets.midcast.RA.Acc = {
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Enervating Earring",ear2="Telos Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Dingir Ring",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

	--These sets will overlay based on accuracy level, regardless of other options.
	sets.buff.Camouflage = {body="Orion Jerkin +1"}
	sets.buff.Camouflage.Acc = {}
	sets.buff['Double Shot'] = {back=gear.tp_ranger_jse_back}
	sets.buff['Double Shot'].Acc = {}
	sets.buff.Barrage = {hands="Orion Bracers +1"}

	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}

    sets.midcast.Utsusemi = sets.midcast.FastRecast

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {}

	-- Idle sets
    sets.idle = {
		    head="Meghanada Visor +2",
		    body="Orion Jerkin +2",
		    hands="Meg. Gloves +2",
		    legs="Meg. Chausses +2",
		    feet="Meg. Jam. +2",
		    neck="Scout's Gorget +2",
		    waist="Quelling B. Quiver",
		    left_ear="Genmei Earring",
		    right_ear="Etiolation Earring",
		    left_ring="Defending Ring",
		    right_ring="Shadow Ring",
		    back="Moonlight Cape",
		}

    -- Defense sets
    sets.defense.PDT = {
        head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Sanare Earring",
        body="Meg. Cuirie +2",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Flume Belt",legs="Meg. Chausses +2",feet=gear.herculean_dt_feet}

    sets.defense.MDT = {
        head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Meg. Cuirie +2",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Flume Belt",legs="Meg. Chausses +2",feet="Ahosi Leggings"}

    sets.defense.MEVA = {
        head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Meg. Cuirie +2",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Flume Belt",legs="Meg. Chausses +2",feet="Ahosi Leggings"}

    sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.DayIdle = {}
	sets.NightIdle = {}



	--------------------------------------
	-- Engaged sets
	--------------------------------------

    -- Normal melee group
    sets.engaged = {
		    head={ name="Arcadian Beret +1", augments={'Enhances "Recycle" effect',}},
		    body="Orion Jerkin +1",
		    hands="Meg. Gloves +2",
		    legs="Meg. Chausses +1",
		    feet="Meg. Jam. +1",
		    neck="Scout's Gorget +2",
		    waist="Impulse Belt",
		    left_ear="Telos Earring",
		    right_ear="Sherida Earring",
		    left_ring="Epona's Ring",
		    right_ring="Chirich Ring +1",
		    back="Belenus's Cape",
		}

    sets.engaged.Acc = {
		head="Dampening Tam",neck="Combatant's Torque",ear1="Cessance Earring",ear2="Telos Earring",
		body="Meg. Cuirie +2",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Petrov Ring",
		back=gear.tp_ranger_jse_back,waist="Olseni Belt",legs="Samnuha Tights",feet=gear.herculean_acc_feet}

    sets.engaged.DW = {
		    head={ name="Arcadian Beret +1", augments={'Enhances "Recycle" effect',}},
		    body="Orion Jerkin +1",
		    hands="Meg. Gloves +2",
		    legs="Meg. Chausses +1",
		    feet="Meg. Jam. +1",
		    neck="Scout's Gorget +2",
		    waist="Impulse Belt",
		    left_ear="Telos Earring",
		    right_ear="Sherida Earring",
		    left_ring="Epona's Ring",
		    right_ring="Chirich Ring +1",
		    back="Belenus's Cape",
		}

    sets.engaged.DW.Acc = {
		head="Dampening Tam",neck="Combatant's Torque",ear1="Digni. Earring",ear2="Telos Earring",
		body="Adhemar Jacket +1",hands="Floral Gauntlets",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back=gear.tp_ranger_jse_back,waist="Olseni Belt",legs="Meg. Chausses +2",feet=gear.herculean_acc_feet}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 10)
end
