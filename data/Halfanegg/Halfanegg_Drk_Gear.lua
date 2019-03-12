function user_setup()
	-- Options: Override default values

  state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
  state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder')
  state.HybridMode:options('Normal','DT')
  state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
  state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal','Refresh','Reraise')
	state.Weapons:options('Caladbolg','Apocalypse')
  state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Twilight'}
	state.DrainSwapWeaponMode = M{'Never','Always','300','1000'}

	-- Additional local binds

	--send_command('bind ^` input /ja "Hasso" <me>')
	--send_command('bind !` input /ja "Seigan" <me>')
	--send_command('bind @` gs c cycle SkillchainMode')

	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	-- Start defining the sets

	-- Weapons sets
	sets.weapons.Caladbolg = {main="Caladbolg",sub="Utu Grip"}
	sets.weapons.Apocalypse = {main="Apocalypse",sub="Utu Grip"}

	-- Precast Sets

	-- Precast sets to enhance JAs
	sets.precast.JA['Diabolic Eye'] = {}
	sets.precast.JA['Arcane Circle'] = {}
	sets.precast.JA['Souleater'] = {}
	sets.precast.JA['Weapon Bash'] = {}
	sets.precast.JA['Nether Void'] = {}
	sets.precast.JA['Blood Weapon'] = {}
	sets.precast.JA['Dark Seal'] = {}
	sets.precast.JA['Last Resort'] = {back="Ankou's Mantle"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {}

	sets.precast.Flourish1 = {}

	-- Fast cast sets for spells
	sets.precast.FC = {
	    ammo="Staunch Tathlum +1",
	    head={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst dmg.+10%','"Refresh"+1',}},
	    body={ name="Valorous Mail", augments={'Accuracy+28','"Dbl.Atk."+5','Attack+12',}},
	    hands={ name="Leyline Gloves", augments={'Accuracy+7','"Mag.Atk.Bns."+10',}},
	    legs="Sulev. Cuisses +2",
	    feet="Sulev. Leggings +2",
	    neck="Abyssal Beads +2",
	    waist="Tempus Fugit",
	    left_ear="Cessance Earring",
	    right_ear="Etiolation Earring",
	    left_ring="Niqmaddu Ring",
	    right_ring="Kishar Ring",
	    back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
	}

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})

	-- Midcast Sets

	sets.midcast.FastRecast = {
	    ammo="Staunch Tathlum +1",
	    head={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst dmg.+10%','"Refresh"+1',}},
	    body={ name="Valorous Mail", augments={'Accuracy+28','"Dbl.Atk."+5','Attack+12',}},
	    hands={ name="Leyline Gloves", augments={'Accuracy+7','"Mag.Atk.Bns."+10',}},
	    legs="Sulev. Cuisses +2",
	    feet="Sulev. Leggings +2",
	    neck="Abyssal Beads +2",
	    waist="Tempus Fugit",
	    left_ear="Cessance Earring",
	    right_ear="Etiolation Earring",
	    left_ring="Niqmaddu Ring",
	    right_ring="Kishar Ring",
	    back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
	}

	-- Specific spells
	sets.midcast['Dark Magic'] = {
	    ammo="Staunch Tathlum +1",
	    head="Flam. Zucchetto +2",
	    body="Flamma Korazin +2",
	    hands={ name="Leyline Gloves", augments={'Accuracy+7','"Mag.Atk.Bns."+10',}},
	    legs="Sulev. Cuisses +2",
	    feet="Flam. Gambieras +2",
	    neck="Abyssal Beads +2",
	    waist="Tempus Fugit",
	    left_ear="Cessance Earring",
	    right_ear="Etiolation Earring",
	    left_ring="Stikini Ring +1",
	    right_ring="Stikini Ring +1",
	    back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
	}

	sets.midcast['Enfeebling Magic'] = {
	    ammo="Staunch Tathlum +1",
	    head="Flam. Zucchetto +2",
	    body="Flamma Korazin +2",
	    hands={ name="Leyline Gloves", augments={'Accuracy+7','"Mag.Atk.Bns."+10',}},
	    legs="Sulev. Cuisses +2",
	    feet="Flam. Gambieras +2",
	    neck="Abyssal Beads +2",
	    waist="Tempus Fugit",
	    left_ear="Cessance Earring",
	    right_ear="Etiolation Earring",
	    left_ring="Stikini Ring +1",
	    right_ring="Stikini Ring +1",
	    back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
	}

	sets.midcast['Dread Spikes'] = set_combine(sets.midcast['Dark Magic'], {})
	sets.midcast.Absorb = set_combine(sets.midcast['Dark Magic'], {back="Ankou Mantle"})

	sets.midcast.Stun = {
	    ammo="Staunch Tathlum +1",
	    head={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst dmg.+10%','"Refresh"+1',}},
	    body={ name="Valorous Mail", augments={'Accuracy+28','"Dbl.Atk."+5','Attack+12',}},
	    hands={ name="Leyline Gloves", augments={'Accuracy+7','"Mag.Atk.Bns."+10',}},
	    legs="Sulev. Cuisses +2",
	    feet="Sulev. Leggings +2",
	    neck="Abyssal Beads +2",
	    waist="Tempus Fugit",
	    left_ear="Cessance Earring",
	    right_ear="Etiolation Earring",
	    left_ring="Niqmaddu Ring",
	    right_ring="Kishar Ring",
	    back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
	}

	sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {ring1="Evanescence Ring",ring2="Archon Ring",back="Niht Mantle"})

	sets.DrainWeapon = {main="Misanthropy",sub="Alber Strap"}

	sets.midcast.Aspir = sets.midcast.Drain

	sets.midcast.Impact = set_combine(sets.midcast['Dark Magic'], {head=empty,body="Twilight Cloak"})

	sets.midcast.Cure = {}

	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}

	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}

	sets.Self_Refresh = {waist="Gishdubar Sash"}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
  sets.precast.WS = {
	    ammo="Knobkierrie",
	    head="Ratri Sallet",
	    body="Ratri Plate",
	    hands="Ratri Gadlings",
	    legs="Sulev. Cuisses +2",
	    feet="Sulev. Leggings +2",
	    neck="Abyssal Beads +2",
	    waist="Fotia Belt",
	    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
	    right_ear="Ishvara Earring",
	    left_ring="Niqmaddu Ring",
	    right_ring="Karieyh Ring",
	    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	}

	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})

  -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
  sets.precast.WS['Catastrophe'] = set_combine(sets.precast.WS, {})
  sets.precast.WS['Catastrophe'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
  sets.precast.WS['Catastrophe'].Acc = set_combine(sets.precast.WS.Acc, {})
  sets.precast.WS['Catastrophe'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
  sets.precast.WS['Catastrophe'].Fodder = set_combine(sets.precast.WS.Fodder, {})

  sets.precast.WS['Torcleaver'] = {
	    ammo="Knobkierrie",
	    head={ name="Odyssean Helm", augments={'Weapon skill damage +4%','VIT+15','Accuracy+5',}},
	    body="Ratri Plate",
	    hands={ name="Odyssean Gauntlets", augments={'Weapon skill damage +4%','VIT+8','Accuracy+12','Attack+9',}},
	    legs="Sulev. Cuisses +2",
	    feet="Sulev. Leggings +2",
	    neck="Abyssal Beads +2",
	    waist="Fotia Belt",
	    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
	    right_ear="Ishvara Earring",
	    left_ring="Niqmaddu Ring",
	    right_ring="Karieyh Ring",
	    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	}
  sets.precast.WS['Torcleaver'].SomeAcc = set_combine(sets.precast.WS['Torcleaver'], {
	    head="Sulevia's Mask +2",
	    body="Sulevia's Plate. +2",
	})
  sets.precast.WS['Torcleaver'].Acc = set_combine(sets.precast.WS['Torcleaver'].SomeAcc, {})
  sets.precast.WS['Torcleaver'].FullAcc = set_combine(sets.precast.WS['Torcleaver'].SomeAcc, {})
  sets.precast.WS['Torcleaver'].Fodder = set_combine(sets.precast.WS['Torcleaver'], {})

  sets.precast.WS['Entropy'] = set_combine(sets.precast.WS, {})
  sets.precast.WS['Entropy'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
  sets.precast.WS['Entropy'].Acc = set_combine(sets.precast.WS.Acc, {})
  sets.precast.WS['Entropy'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
  sets.precast.WS['Entropy'].Fodder = set_combine(sets.precast.WS.Fodder, {})

  sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {})
  sets.precast.WS['Resolution'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
  sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc, {})
  sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
  sets.precast.WS['Resolution'].Fodder = set_combine(sets.precast.WS.Fodder, {})

  -- Sets to return to when not performing an action.

  -- Resting sets
  sets.resting = {}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Lugra Earring +1",ear2="Lugra Earring",}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}

  -- Idle sets

  sets.idle = {
	    ammo="Staunch Tathlum +1",
	    head="Sulevia's Mask +2",
	    body="Tartarus Platemail",
	    hands="Sulev. Gauntlets +2",
	    legs="Sulev. Cuisses +2",
	    feet="Sulev. Leggings +2",
	    neck="Abyssal Beads +2",
	    waist="Flume Belt +1",
	    left_ear="Genmei Earring",
	    right_ear="Etiolation Earring",
	    left_ring="Defending Ring",
	    right_ring="Moonlight Ring",
	    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}

	sets.idle.Weak = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})

	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})

    -- Defense sets
	sets.defense.PDT = {
	    ammo="Staunch Tathlum +1",
	    head="Sulevia's Mask +2",
	    body="Tartarus Platemail",
	    hands="Sulev. Gauntlets +2",
	    legs="Sulev. Cuisses +2",
	    feet="Sulev. Leggings +2",
	    neck="Loricate Torque +1",
	    waist="Flume Belt +1",
	    left_ear="Genmei Earring",
	    right_ear="Etiolation Earring",
	    left_ring="Defending Ring",
	    right_ring="Moonlight Ring",
	    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}

	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {head="Twilight Helm",body="Twilight Mail"})

	sets.defense.MDT = {
	    ammo="Staunch Tathlum +1",
	    head="Sulevia's Mask +2",
	    body="Tartarus Platemail",
	    hands="Sulev. Gauntlets +2",
	    legs="Sulev. Cuisses +2",
	    feet="Sulev. Leggings +2",
	    neck="Loricate Torque +1",
	    waist="Flume Belt +1",
	    left_ear="Genmei Earring",
	    right_ear="Etiolation Earring",
	    left_ring="Defending Ring",
	    right_ring="Moonlight Ring",
	    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}

	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Twilight Helm",body="Twilight Mail"})

	sets.defense.MEVA = {ammo="Staunch Tathlum",
		head="Loess Barbuta +1",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Moonbeam Ring",ring2="Moonbeam Ring",
		back="Moonlight Cape",waist="Flume Belt",legs="Sulev. Cuisses +2",feet="Amm Greaves"}

	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.passive.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}

	-- Engaged (Caladbolg)
	sets.engaged = {
	    ammo="Ginsen",
	    head="Flam. Zucchetto +2",
	    body={ name="Valorous Mail", augments={'Accuracy+28','"Dbl.Atk."+5','Attack+12',}},
	    hands="Sulev. Gauntlets +2",
	    legs="Sulev. Cuisses +2",
	    feet="Flam. Gambieras +2",
	    neck="Abyssal Beads +2",
	    waist="Ioskeha Belt +1",
	    left_ear="Cessance Earring",
	    right_ear="Brutal Earring",
	    left_ring="Niqmaddu Ring",
	    right_ring="Hetairoi Ring",
	    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}

	sets.engaged.DT = {
			ammo="Ginsen",
			head="Sulevia's Mask +2",
			body="Sulevia's Plate. +2",
			hands="Sulev. Gauntlets +2",
			legs="Sulev. Cuisses +2",
			feet="Flam. Gambieras +2",
			neck="Loricate Torque +1",
			waist="Ioskeha Belt +1",
			left_ear="Cessance Earring",
			right_ear="Brutal Earring",
			left_ring="Defending Ring",
			right_ring="Moonlight Ring",
			back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}

	sets.engaged.SomeAcc = {
	    ammo="Ginsen",
	    head="Flam. Zucchetto +2",
	    body={ name="Emicho Haubert +1", augments={'HP+65','DEX+12','Accuracy+20',}},
	    hands={ name="Emi. Gauntlets +1", augments={'HP+65','DEX+12','Accuracy+20',}},
	    legs="Sulev. Cuisses +2",
	    feet="Flam. Gambieras +2",
	    neck="Abyssal Beads +2",
	    waist="Ioskeha Belt +1",
	    left_ear="Cessance Earring",
	    right_ear="Telos Earring",
	    left_ring="Niqmaddu Ring",
	    right_ring="Chirich Ring +1",
	    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}

	sets.engaged.Acc = set_combine(sets.engaged.SomeAcc, {})
	sets.engaged.FullAcc = set_combine(sets.engaged.Acc, {})
  sets.engaged.Fodder = set_combine(sets.engaged, {})

--[[

	sets.engaged.PDT = {
	    ammo="Ginsen",
	    head="Sulevia's Mask +2",
	    body="Sulevia's Plate. +2",
	    hands="Sulev. Gauntlets +2",
	    legs="Sulev. Cuisses +2",
	    feet="Flam. Gambieras +2",
	    neck="Loricate Torque +1",
	    waist="Ioskeha Belt +1",
	    left_ear="Cessance Earring",
	    right_ear="Brutal Earring",
	    left_ring="Defending Ring",
	    right_ring="Moonlight Ring",
	    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
	sets.engaged.SomeAcc.DT = {
	    ammo="Ginsen",
	    head="Sulevia's Mask +2",
	    body="Sulevia's Plate. +2",
	    hands="Sulev. Gauntlets +2",
	    legs="Sulev. Cuisses +2",
	    feet="Flam. Gambieras +2",
	    neck="Loricate Torque +1",
	    waist="Ioskeha Belt +1",
	    left_ear="Cessance Earring",
	    right_ear="Telos Earring",
	    left_ring="Defending Ring",
	    right_ring="Moonlight Ring",
	    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
	sets.engaged.Acc.DT = set_combine(sets.engaged.SomeAcc.DT, {})
	sets.engaged.FullAcc.DT = set_combine(sets.engaged.Acc.DT, {})
	sets.engaged.Fodder.DT = set_combine(sets.engaged.DT, {})

	sets.engaged.MDT = {
	    ammo="Ginsen",
	    head="Sulevia's Mask +2",
	    body="Sulevia's Plate. +2",
	    hands="Sulev. Gauntlets +2",
	    legs="Sulev. Cuisses +2",
	    feet="Flam. Gambieras +2",
	    neck="Loricate Torque +1",
	    waist="Ioskeha Belt +1",
	    left_ear="Cessance Earring",
	    right_ear="Brutal Earring",
	    left_ring="Defending Ring",
	    right_ring="Moonlight Ring",
	    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
	sets.engaged.SomeAcc.MDT = {
	    ammo="Ginsen",
	    head="Sulevia's Mask +2",
	    body="Sulevia's Plate. +2",
	    hands="Sulev. Gauntlets +2",
	    legs="Sulev. Cuisses +2",
	    feet="Flam. Gambieras +2",
	    neck="Loricate Torque +1",
	    waist="Ioskeha Belt +1",
	    left_ear="Cessance Earring",
	    right_ear="Telos Earring",
	    left_ring="Defending Ring",
	    right_ring="Moonlight Ring",
	    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
	sets.engaged.Acc.MDT = set_combine(sets.engaged.SomeAcc.MDT, {})
	sets.engaged.FullAcc.MDT = set_combine(sets.engaged.Acc.MDT, {})
	sets.engaged.Fodder.MDT = set_combine(sets.engaged.MDT, {})

  -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
  -- sets if more refined versions aren't defined.
  -- If you create a set with both offense and defense modes, the offense mode should be first.
  -- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Apocalypse melee sets
  sets.engaged.Apocalypse = {}
	sets.engaged.Apocalypse.SomeAcc = {}
	sets.engaged.Apocalypse.Acc = {}
	sets.engaged.Apocalypse.FullAcc = {}
	sets.engaged.Apocalypse.Fodder = {}

  sets.engaged.Apocalypse.AM = {}
	sets.engaged.Apocalypse.SomeAcc.AM = {}
	sets.engaged.Apocalypse.Acc.AM = {}
	sets.engaged.Apocalypse.FullAcc.AM = {}
	sets.engaged.Apocalypse.Fodder.AM = {}

	sets.engaged.Apocalypse.PDT = {}
	sets.engaged.Apocalypse.SomeAcc.PDT = {}
	sets.engaged.Apocalypse.Acc.PDT = {}
	sets.engaged.Apocalypse.FullAcc.PDT = {}
	sets.engaged.Apocalypse.Fodder.PDT = {}

	sets.engaged.Apocalypse.PDT.AM = {}
	sets.engaged.Apocalypse.SomeAcc.PDT.AM = {}
	sets.engaged.Apocalypse.Acc.PDT.AM = {}
	sets.engaged.Apocalypse.FullAcc.PDT.AM = {}
	sets.engaged.Apocalypse.Fodder.PDT.AM = {}

	sets.engaged.Apocalypse.PDT.Charge = {}
	sets.engaged.Apocalypse.SomeAcc.PDT.Charge = {}
	sets.engaged.Apocalypse.Acc.PDT.Charge = {}
	sets.engaged.Apocalypse.FullAcc.PDT.Charge = {}
	sets.engaged.Apocalypse.Fodder.PDT.Charge = {}

	sets.engaged.Apocalypse.PDT.Charge.AM = {}
	sets.engaged.Apocalypse.SomeAcc.PDT.Charge.AM = {}
	sets.engaged.Apocalypse.Acc.PDT.Charge.AM = {}
	sets.engaged.Apocalypse.FullAcc.PDT.Charge.AM = {}
	sets.engaged.Apocalypse.Fodder.PDT.Charge.AM = {}

	sets.engaged.Apocalypse.MDT = {}
	sets.engaged.Apocalypse.SomeAcc.MDT = {}
	sets.engaged.Apocalypse.Acc.MDT = {}
	sets.engaged.Apocalypse.FullAcc.MDT = {}
	sets.engaged.Apocalypse.Fodder.MDT = {}

	sets.engaged.Apocalypse.MDT.AM = {}
	sets.engaged.Apocalypse.SomeAcc.MDT.AM = {}
	sets.engaged.Apocalypse.Acc.MDT.AM = {}
	sets.engaged.Apocalypse.FullAcc.MDT.AM = {}
	sets.engaged.Apocalypse.Fodder.MDT.AM = {}

]]--
	--Extra Special Sets

	sets.buff.Souleater = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.latent_refresh = {waist="Fucho-no-Obi"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})

    end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 9)
    elseif player.sub_job == 'SAM' then
        set_macro_page(1, 9)
    elseif player.sub_job == 'DNC' then
        set_macro_page(1, 9)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 9)
    else
        set_macro_page(1, 9)
    end
end
