-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc','FullAcc','Fodder')
    state.HybridMode:options('Pet','DT','Normal')
    state.WeaponskillMode:options('Match','Normal','Acc','FullAcc','Fodder')
    state.PhysicalDefenseMode:options('PDT')
	  state.IdleMode:options('Normal','PDT','Refresh')
	  state.Weapons:options('None','Godhands','PetWeapons')

    -- Default/Automatic maneuvers for each pet mode.  Define at least 3.
	defaultManeuvers = {
		Turtle = {
      {Name='Fire Maneuver',	  Amount=1},
			{Name='Light Maneuver', 	  Amount=2},
			{Name='Wind Maneuver', 	  Amount=0},
		},
    Bruiser = {
			{Name='Fire Maneuver',   Amount=1},
			{Name='Light Maneuver', 	  Amount=1},
			{Name='Wind Maneuver',	  Amount=1},
		},
		Harle = {
      {Name='Fire Maneuver',   Amount=1},
			{Name='Light Maneuver', 	  Amount=1},
			{Name='Water Maneuver',	  Amount=1 },
		},
		Sharpshot = {
      {Name='Fire Maneuver',   Amount=1},
			{Name='Light Maneuver', 	  Amount=1},
			{Name='Wind Maneuver',	  Amount=1},
		},
		DD = {
      {Name='Fire Maneuver',   Amount=1},
			{Name='Light Maneuver', 	  Amount=1},
			{Name='Wind Maneuver',	  Amount=1},
		},
		SpamDD = {
      {Name='Fire Maneuver',   Amount=1},
			{Name='Light Maneuver', 	  Amount=1},
			{Name='Wind Maneuver',	  Amount=1},
		},
		WHM = {
      {Name='Light Maneuver',   Amount=1},
			{Name='Dark Maneuver', 	  Amount=1},
			{Name='Ice Maneuver',	  Amount=1},
		},
		RDM = {
      {Name='Light Maneuver',   Amount=1},
      {Name='Dark Maneuver', 	  Amount=1},
      {Name='Ice Maneuver',	  Amount=1},
		},
    BLM = {
      {Name='Light Maneuver',   Amount=1},
      {Name='Dark Maneuver', 	  Amount=1},
      {Name='Ice Maneuver',	  Amount=1},
		},
	}

	deactivatehpp = 85

    select_default_macro_book()

	--send_command('bind @` gs c cycle SkillchainMode')
	--send_command('bind @f8 gs c toggle AutoPuppetMode')
	--send_command('bind @f7 gs c toggle AutoRepairMode')
end

-- Define sets used by this job file.
function init_gear_sets()

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
	head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
	body="Zendik Robe",hands=gear.herculean_dt_hands,ring1="Lebeche Ring",ring2="Prolix Ring",
	back="Perimede Cape",waist="Isa Belt",legs="Rawhide Trousers",feet="Regal Pumps +1"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})


    -- Precast sets to enhance JAs
    sets.precast.JA['Tactical Switch'] = {feet="Cirque Scarpe +2"}
    sets.precast.JA['Repair'] = {ammo="Automat. Oil +3"} --feet="Foire Babouches"
	  sets.precast.JA['Maintenance'] = {ammo="Automat. Oil +3"}
    sets.precast.JA.Maneuver = {
        main={ name="Midnights", augments={'Pet: Attack+25','Pet: Accuracy+25','Pet: Damage taken -3%',}},
        body="Karagoz Farsetto",
        neck="Buffoon's Collar",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Haste+10',}},
    }

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Lilitu Headpiece",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonlight Cape",waist="Chaac Belt",legs="Hiza. Hizayoroi +2",feet=gear.herculean_waltz_feet}

    sets.precast.Waltz['Healing Waltz'] = {}


    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Lilitu Headpiece",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Brutal Earring",
        body=gear.herculean_wsd_body,hands="Ryuo Tekko",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back="Visucius's Mantle",waist="Grunfeld Rope",legs="Hiza. Hizayoroi +2",feet=gear.herculean_ta_feet}
	sets.precast.WS.Acc = {
        head="Lilitu Headpiece",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Telos Earring",
        body=gear.herculean_wsd_body,hands="Ryuo Tekko",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back="Visucius's Mantle",waist="Grunfeld Rope",legs="Hiza. Hizayoroi +2",feet=gear.herculean_acc_feet}
	sets.precast.WS.FullAcc = {
        head="Lilitu Headpiece",neck="Combatant's Torque",ear1="Digni. Earring",ear2="Telos Earring",
        body=gear.herculean_wsd_body,hands="Ryuo Tekko",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Visucius's Mantle",waist="Olseni Belt",legs="Hiza. Hizayoroi +2",feet=gear.herculean_acc_feet}
	sets.precast.WS.Fodder = {
        head="Lilitu Headpiece",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Brutal Earring",
        body=gear.herculean_wsd_body,hands="Ryuo Tekko",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back="Visucius's Mantle",waist="Grunfeld Rope",legs="Hiza. Hizayoroi +2",feet=gear.herculean_ta_feet}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Victory Smite'] = set_combine(sets.precast.WS, {body="Abnoba Kaftan"})
    sets.precast.WS['Victory Smite'].Acc = set_combine(sets.precast.WS.Acc, {body="Sayadio's Kaftan"})
	sets.precast.WS['Victory Smite'].FullAcc = set_combine(sets.precast.WS.FullAcc, {body="Sayadio's Kaftan"})
	sets.precast.WS['Victory Smite'].Fodder = set_combine(sets.precast.WS.Fodder, {body="Abnoba Kaftan"})

    sets.precast.WS['Stringing Pummel'] = set_combine(sets.precast.WS, {body="Abnoba Kaftan"})
    sets.precast.WS['Stringing Pummel'].Acc = set_combine(sets.precast.WS.FullAcc, {body="Sayadio's Kaftan"})
	sets.precast.WS['Stringing Pummel'].FullAcc = set_combine(sets.precast.WS.FullAcc, {body="Sayadio's Kaftan"})
	sets.precast.WS['Stringing Pummel'].Fodder = set_combine(sets.precast.WS.Fodder, {body="Abnoba Kaftan"})

    sets.precast.WS['Shijin Spiral'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Shijin Spiral'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Shijin Spiral'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Shijin Spiral'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Asuran Fists'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Asuran Fists'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Asuran Fists'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Asuran Fists'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Dragon Kick'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Dragon Kick'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Dragon Kick'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Dragon Kick'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Tornado Kick'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tornado Kick'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Tornado Kick'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Tornado Kick'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Asuran Fists'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Asuran Fists'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Asuran Fists'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Asuran Fists'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Raging Fists'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Raging Fists'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Raging Fists'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Raging Fists'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Howling Fist'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Howling Fist'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Howling Fist'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Howling Fist'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Backhand Blow'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Backhand Blow'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Backhand Blow'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Backhand Blow'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Spinning Attack'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Spinning Attack'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Spinning Attack'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Spinning Attack'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Shoulder Tackle'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Shoulder Tackle'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Shoulder Tackle'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Shoulder Tackle'].Fodder = set_combine(sets.precast.WS.Fodder, {})
    -- Midcast Sets

    sets.midcast.FastRecast = {
	head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
	body="Zendik Robe",hands=gear.herculean_dt_hands,ring1="Lebeche Ring",ring2="Prolix Ring",
	back="Perimede Cape",waist="Isa Belt",legs="Rawhide Trousers",feet="Regal Pumps +1"}

	sets.midcast.Dia = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)

    -- Midcast sets for pet actions
    sets.midcast.Pet.Cure = {}
	sets.midcast.Pet['Enfeebling Magic'] = {neck="Adad Amulet",ear1="Enmerkar Earring",ear2="Handler's Earring +1",body="Taeon Tabard",hands="Regimen Mittens",ring1="Varar Ring +1",ring2="Varar Ring +1",waist="Incarnation Sash",legs="Tali'ah Sera. +2"}
    sets.midcast.Pet['Elemental Magic'] = {neck="Adad Amulet",ear1="Enmerkar Earring",ear2="Handler's Earring +1",body="Taeon Tabard",hands="Regimen Mittens",ring1="Varar Ring +1",ring2="Varar Ring +1",waist="Incarnation Sash",legs="Tali'ah Sera. +2"}
	sets.midcast.Pet.PetWSGear = {
      main={ name="Ohtas", augments={'Accuracy+70','Pet: Accuracy+70','Pet: Haste+10%',}},
      range="Animator P +1",
      head="Karagoz Capello +1",
      body={ name="Herculean Vest", augments={'Pet: Attack+21 Pet: Rng.Atk.+21','Pet: "Store TP"+10','Pet: AGI+1','Pet: "Mag.Atk.Bns."+9',}},
      hands="Karagoz Guanti +1",
      legs="Kara. Pantaloni +1",
      feet={ name="Naga Kyahan", augments={'Pet: HP+100','Pet: Accuracy+25','Pet: Attack+25',}},
      neck="Shulmanu Collar",
      waist="Incarnation Sash",
      left_ear="Handler's Earring +1",
      right_ear="Rimeice Earring",
      left_ring="Thurandaut Ring",
      right_ring="Varar Ring",
      back={ name="Dispersal Mantle", augments={'STR+2','DEX+3','Pet: TP Bonus+200',}},
  }
    sets.midcast.Pet.PetWSGear.Ranged = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.Melee = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.Tank = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.LightTank = set_combine(sets.midcast.Pet.PetWSGear, {})
    sets.midcast.Pet.PetWSGear.Magic = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.Heal = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.Nuke = set_combine(sets.midcast.Pet.PetWSGear, {})

	-- Currently broken, preserved in case of future functionality.
	sets.midcast.Pet.WeaponSkill = {}


    -- Sets to return to when not performing an action.

    -- Resting sets
    sets.resting = {}


    -- Idle sets

    sets.idle = {
        range="Animator P +1",
        head={ name="Rao Kabuto +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        body={ name="Rao Togi +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        neck="Loricate Torque +1",
        waist="Incarnation Sash",
        left_ear="Handler's Earring +1",
        right_ear="Rimeice Earring",
        left_ring="Thurandaut Ring",
        right_ring="Defending Ring",
        back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
    }

	sets.idle.Refresh = {
        head="Rawhide Mask",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Vrikodara Jupon",hands=gear.herculean_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Fucho-no-Obi",legs="Rawhide Trousers",feet="Hippo. Socks +1"}

    -- Set for idle while pet is out (eg: pet regen gear)
    sets.idle.Pet = {
        range="Animator P +1",
        head={ name="Rao Kabuto +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        body={ name="Rao Togi +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        neck="Loricate Torque +1",
        waist="Incarnation Sash",
        left_ear="Handler's Earring +1",
        right_ear="Rimeice Earring",
        left_ring="Thurandaut Ring",
        right_ring="Defending Ring",
        back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
    }

    -- Idle sets to wear while pet is engaged
    sets.idle.Pet.Engaged = {
        main={ name="Ohtas", augments={'Accuracy+70','Pet: Accuracy+70','Pet: Haste+10%',}},
        range="Animator P +1",
        head={ name="Herculean Helm", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Store TP"+11','Pet: Attack+2 Pet: Rng.Atk.+2','Pet: "Mag.Atk.Bns."+3',}},
        body={ name="Herculean Vest", augments={'Pet: Attack+21 Pet: Rng.Atk.+21','Pet: "Store TP"+10','Pet: AGI+1','Pet: "Mag.Atk.Bns."+9',}},
        hands={ name="Herculean Gloves", augments={'Pet: Accuracy+21 Pet: Rng. Acc.+21','Pet: "Store TP"+11','Pet: INT+1','Pet: Attack+4 Pet: Rng.Atk.+4',}},
        legs={ name="Herculean Trousers", augments={'Pet: Mag. Acc.+16','Pet: "Store TP"+11','Pet: STR+3','Pet: Attack+5 Pet: Rng.Atk.+5',}},
        feet={ name="Naga Kyahan", augments={'Pet: HP+100','Pet: Accuracy+25','Pet: Attack+25',}},
        neck="Shulmanu Collar",
        waist="Incarnation Sash",
        left_ear="Handler's Earring +1",
        right_ear="Rimeice Earring",
        left_ring="Thurandaut Ring",
        right_ring="Varar Ring",
        back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
    }

    sets.idle.Pet.Engaged.Turtle = set_combine(sets.idle.Pet.Engaged, {
        main={ name="Midnights", augments={'Pet: Attack+25','Pet: Accuracy+25','Pet: Damage taken -3%',}},
        range="Animator P +1",
        ammo="Automat. Oil +3",
        head={ name="Rao Kabuto +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        body={ name="Rao Togi +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        neck="Shulmanu Collar",
        waist="Incarnation Sash",
        left_ear="Handler's Earring +1",
        right_ear="Rimeice Earring",
        left_ring="Thurandaut Ring",
        right_ring="Varar Ring",
        back={ name="Dispersal Mantle", augments={'STR+2','DEX+3','Pet: TP Bonus+200',}},
    })
	  sets.idle.Pet.Engaged.Bruiser = set_combine(sets.idle.Pet.Engaged, {
        main={ name="Midnights", augments={'Pet: Attack+25','Pet: Accuracy+25','Pet: Damage taken -3%',}},
        range="Animator P +1",
        ammo="Automat. Oil +3",
        head={ name="Rao Kabuto +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        body={ name="Rao Togi +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        neck="Shulmanu Collar",
        waist="Incarnation Sash",
        left_ear="Handler's Earring +1",
        right_ear="Rimeice Earring",
        left_ring="Thurandaut Ring",
        right_ring="Varar Ring",
        back={ name="Dispersal Mantle", augments={'STR+2','DEX+3','Pet: TP Bonus+200',}},
    })
	  sets.idle.Pet.Engaged.Harle = set_combine(sets.idle.Pet.Engaged, {
        main={ name="Midnights", augments={'Pet: Attack+25','Pet: Accuracy+25','Pet: Damage taken -3%',}},
        range="Animator P +1",
        ammo="Automat. Oil +3",
        head={ name="Rao Kabuto +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        body={ name="Rao Togi +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        neck="Shulmanu Collar",
        waist="Incarnation Sash",
        left_ear="Handler's Earring +1",
        right_ear="Rimeice Earring",
        left_ring="Thurandaut Ring",
        right_ring="Varar Ring",
        back={ name="Dispersal Mantle", augments={'STR+2','DEX+3','Pet: TP Bonus+200',}},
    })
	  sets.idle.Pet.Engaged.Sharpshot = set_combine(sets.idle.Pet.Engaged, {
        main={ name="Midnights", augments={'Pet: Attack+25','Pet: Accuracy+25','Pet: Damage taken -3%',}},
        range="Animator P +1",
        ammo="Automat. Oil +3",
        head={ name="Rao Kabuto +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        body={ name="Rao Togi +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        neck="Shulmanu Collar",
        waist="Incarnation Sash",
        left_ear="Handler's Earring +1",
        right_ear="Rimeice Earring",
        left_ring="Thurandaut Ring",
        right_ring="Varar Ring",
        back={ name="Dispersal Mantle", augments={'STR+2','DEX+3','Pet: TP Bonus+200',}},
    })
    sets.idle.Pet.Engaged.DD = set_combine(sets.idle.Pet.Engaged, {})
    sets.idle.Pet.Engaged.SpamDD = set_combine(sets.idle.Pet.Engaged, {})
	  sets.idle.Pet.Engaged.WHM = sets.idle.Pet.Engaged.Magic
	  sets.idle.Pet.Engaged.RDM = sets.idle.Pet.Engaged.Magic
    sets.idle.Pet.Engaged.BLM = sets.idle.Pet.Engaged.Magic


    -- Defense sets

    sets.defense.PDT = {
        head="Blistering Sallet",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
        body="Vrikodara Jupon",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Isa Belt",legs=gear.herculean_dt_legs,feet=gear.herculean_dt_feet}

    sets.defense.MDT = {
        head="Blistering Sallet",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
        body="Vrikodara Jupon",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Isa Belt",legs=gear.herculean_dt_legs,feet=gear.herculean_dt_feet}

    sets.defense.MEVA = {
        head="Blistering Sallet",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
        body="Vrikodara Jupon",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Isa Belt",legs=gear.herculean_dt_legs,feet=gear.herculean_dt_feet}

    sets.Kiting = {feet="Hermes' Sandals"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
        head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Cessance Earring",ear2="Telos Earring",
        body="Sayadio's Kaftan",hands="Ryuo Tekko",ring1="Niqmaddu Ring",ring2="Epona's Ring",
        back="Visucius's Mantle",waist="Windbuffet Belt +1",legs="Ryuo Hakama",feet=gear.herculean_ta_feet}
    sets.engaged.Acc = {
        head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Cessance Earring",ear2="Telos Earring",
        body="Sayadio's Kaftan",hands="Ryuo Tekko",ring1="Niqmaddu Ring",ring2="Ramuh Ring +1",
        back="Visucius's Mantle",waist="Grunfeld Rope",legs="Ryuo Hakama",feet=gear.herculean_ta_feet}
    sets.engaged.FullAcc = {
        head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Cessance Earring",ear2="Telos Earring",
        body="Sayadio's Kaftan",hands="Ryuo Tekko",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Visucius's Mantle",waist="Grunfeld Rope",legs="Hiza. Hizayoroi +2",feet=gear.herculean_acc_feet}
	sets.engaged.Fodder = {
        head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Cessance Earring",ear2="Brutal Earring",
        body=gear.herculean_wsd_body,hands="Ryuo Tekko",ring1="Niqmaddu Ring",ring2="Epona's Ring",
        back="Visucius's Mantle",waist="Windbuffet Belt +1",legs="Ryuo Hakama",feet=gear.herculean_ta_feet}
    sets.engaged.DT = {
        head="Lilitu Headpiece",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Brutal Earring",
        body=gear.herculean_wsd_body,hands="Ryuo Tekko",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back="Visucius's Mantle",waist="Grunfeld Rope",legs="Hiza. Hizayoroi +2",feet=gear.herculean_ta_feet}
    sets.engaged.Acc.DT = {
        head="Lilitu Headpiece",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Brutal Earring",
        body=gear.herculean_wsd_body,hands="Ryuo Tekko",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back="Visucius's Mantle",waist="Grunfeld Rope",legs="Hiza. Hizayoroi +2",feet=gear.herculean_ta_feet}
    sets.engaged.FullAcc.DT = {
        head="Lilitu Headpiece",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Brutal Earring",
        body=gear.herculean_wsd_body,hands="Ryuo Tekko",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back="Visucius's Mantle",waist="Grunfeld Rope",legs="Hiza. Hizayoroi +2",feet=gear.herculean_ta_feet}
    sets.engaged.Fodder.DT = {
        head="Lilitu Headpiece",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Brutal Earring",
        body=gear.herculean_wsd_body,hands="Ryuo Tekko",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back="Visucius's Mantle",waist="Grunfeld Rope",legs="Hiza. Hizayoroi +2",feet=gear.herculean_ta_feet}
    sets.engaged.Pet = {
        head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Cessance Earring",ear2="Telos Earring",
        body="Sayadio's Kaftan",hands="Ryuo Tekko",ring1="Niqmaddu Ring",ring2="Epona's Ring",
        back="Visucius's Mantle",waist="Klouskap Sash",legs="Ryuo Hakama",feet=gear.herculean_ta_feet}
    sets.engaged.Acc.Pet = {
        head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Cessance Earring",ear2="Telos Earring",
        body="Sayadio's Kaftan",hands="Ryuo Tekko",ring1="Niqmaddu Ring",ring2="Epona's Ring",
        back="Visucius's Mantle",waist="Klouskap Sash",legs="Ryuo Hakama",feet=gear.herculean_ta_feet}
    sets.engaged.FullAcc.Pet = {
        head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Cessance Earring",ear2="Telos Earring",
        body="Sayadio's Kaftan",hands="Ryuo Tekko",ring1="Niqmaddu Ring",ring2="Epona's Ring",
        back="Visucius's Mantle",waist="Klouskap Sash",legs="Ryuo Hakama",feet=gear.herculean_ta_feet}
    sets.engaged.Fodder.Pet = {
        head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Cessance Earring",ear2="Telos Earring",
        body="Sayadio's Kaftan",hands="Ryuo Tekko",ring1="Niqmaddu Ring",ring2="Epona's Ring",
        back="Visucius's Mantle",waist="Klouskap Sash",legs="Ryuo Hakama",feet=gear.herculean_ta_feet}

	-- Weapons sets
	sets.weapons.PetWeapons = {main="Ohtas",range="Animator P +1",}
	sets.weapons.Godhands = {main="Godhands",range="Animator P +1",}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(1, 6)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 6)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 6)
    else
        set_macro_page(1, 6)
    end
end
