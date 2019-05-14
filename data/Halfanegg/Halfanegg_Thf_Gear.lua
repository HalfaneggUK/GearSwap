-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','PDT')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder')
		state.IdleMode:options('Normal', 'Sphere')
    state.PhysicalDefenseMode:options('PDT')
		state.MagicalDefenseMode:options('MDT')
		state.ResistDefenseMode:options('MEVA')
		state.Weapons:options('TwashTP','TwashACC','Aeneas','Tauret','Dummy')
		--state.Weapons:options('TwashACC','Dagger','Club','Sword','Staff','Scythe','Polearm')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Suppa','DWEarrings','DWMax'}
		state.AmbushMode = M(false, 'Ambush Mode')

		gear.da_jse_back = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
		gear.wsd_jse_back = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},

    -- Additional local binds
    --send_command('bind ^` input /ja "Flee" <me>')
    --send_command('bind !` input /ra <t>')
		--send_command('bind @` gs c cycle SkillchainMode')
		--send_command('bind @f10 gs c toggle AmbushMode')
		--send_command('bind ^backspace gs c weapons Throwing;gs c update')
		--send_command('bind !backspace input /ja "Hide" <me>')
		--send_command('bind !r gs c weapons MagicWeapons;gs c update')
		--send_command('bind ^\\\\ input /ja "Despoil" <t>')
		--send_command('bind !\\\\ input /ja "Mug" <t>')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Special sets (required by rules)
    --------------------------------------

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {hands="Plunderer's Armlets +1",feet="Skulk. Poulaines"})

	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}

  sets.buff['Sneak Attack'] = {}
  sets.buff['Trick Attack'] = {}

  -- Extra Melee sets.  Apply these on top of melee sets.
  sets.Knockback = {}
	sets.Suppa = {ear1="Suppanomimi", ear2="Sherida Earring"}
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Reiki Yotai"}
	sets.Ambush = {} --body="Plunderer's Vest +1"

	-- Weapons sets
	sets.weapons.TwashTP = {main="Twashtar",sub="Centovente"}
	sets.weapons.TwashACC = {main="Twashtar",sub="Tauret"}
	sets.weapons.Aeneas = {main="Aeneas",sub="Twashtar"}
	sets.weapons.Tauret = {main="Tauret",sub="Twashtar"}
	sets.weapons.Dummy = {main="Tauret",sub=empty}
	--sets.weapons.Dagger = {main="Qutrub Knife",sub=empty}
	--sets.weapons.Club = {main="Shellbuster",sub=empty}
	--sets.weapons.Sword = {main="Bronze Sword",sub=empty}
	--sets.weapons.Staff = {main="Earth Staff",sub=empty}
	--sets.weapons.Scythe = {main="Lost Sickle"}
	--sets.weapons.Polearm = {main="Tzee Xicu's Blade"}

  -- Actions we want to use to tag TH.
  sets.precast.Step = {ammo="Falcon Eye",
      head="Dampening Tam",neck="Combatant's Torque",ear1="Telos Earring",ear2="Digni. Earring",
      body="Mummu Jacket +2",hands="Adhemar Wrist. +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
      back=gear.da_jse_back,waist="Olseni Belt",legs="Mummu Kecks +2",feet=gear.herculean_acc_feet}

  sets.precast.JA['Violent Flourish'] = {ammo="Falcon Eye",
      head="Dampening Tam",neck="Combatant's Torque",ear1="Telos Earring",ear2="Digni. Earring",
      body="Mummu Jacket +2",hands="Adhemar Wrist. +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
      back=gear.da_jse_back,waist="Olseni Belt",legs="Mummu Kecks +2",feet=gear.herculean_acc_feet}

	sets.precast.JA['Animated Flourish'] = sets.TreasureHunter
	sets.precast.JA.Provoke = sets.TreasureHunter

    --------------------------------------
    -- Precast sets
    --------------------------------------

  -- Precast sets to enhance JAs
  sets.precast.JA['Collaborator'] = {} --head="Skulker's Bonnet"
  sets.precast.JA['Accomplice'] = {} --head="Skulker's Bonnet"
  sets.precast.JA['Flee'] = {} --feet="Pillager's Poulaines +1"
  sets.precast.JA['Hide'] = {} --body="Pillager's Vest +1"
  sets.precast.JA['Conspirator'] = {} --body="Skulker's Vest"
  sets.precast.JA['Steal'] = {hands="Pill. Armlets +1"}
	sets.precast.JA['Mug'] = {}
  sets.precast.JA['Despoil'] = {legs="Skulker's Culottes",feet="Skulk. Poulaines +1"}
  sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets +1"}
  sets.precast.JA['Feint'] = {} -- {legs="Assassin's Culottes +2"}
  sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
  sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']

  -- Waltz set (chr and vit)
  sets.precast.Waltz = {ammo="Yamarang",
      head="Mummu Bonnet +2",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
      body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
      back="Moonlight Cape",waist="Chaac Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}

	sets.Self_Waltz = {head="Mummu Bonnet +2",body="Passion Jacket",ring1="Asklepian Ring"}

  -- Don't need any special gear for Healing Waltz.
  sets.precast.Waltz['Healing Waltz'] = {}


  -- Fast cast sets for spells
  sets.precast.FC = {ammo="Impatiens",
		head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Dread Jupon",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
		legs="Rawhide Trousers"}

  sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})


  -- Ranged snapshot gear
  sets.precast.RA = {range="Comet Tail"}


  -- Weaponskill sets

  -- Default set for any weaponskill that isn't any more specifically defined
  sets.precast.WS = {
	    ammo="Jukukik Feather",
	    head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
	    body={ name="Plunderer's Vest +3", augments={'Enhances "Ambush" effect',}},
	    hands="Meg. Gloves +2",
	    legs={ name="Plun. Culottes +3", augments={'Enhances "Feint" effect',}},
	    feet={ name="Plun. Poulaines +3", augments={'Enhances "Assassin\'s Charge" effect',}},
	    neck="Asn. Gorget +2",
	    waist="Grunfeld Rope",
	    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
	    right_ear="Sherida Earring",
	    left_ring="Ilabrat Ring",
	    right_ring="Ramuh Ring",
	    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
	}

  -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
  sets.precast.WS["Rudra's Storm"] = {
	    ammo="Jukukik Feather",
	    head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
	    body={ name="Plunderer's Vest +3", augments={'Enhances "Ambush" effect',}},
	    hands="Meg. Gloves +2",
	    legs={ name="Plun. Culottes +3", augments={'Enhances "Feint" effect',}},
	    feet={ name="Plun. Poulaines +3", augments={'Enhances "Assassin\'s Charge" effect',}},
	    neck="Asn. Gorget +2",
	    waist="Grunfeld Rope",
	    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
	    right_ear="Sherida Earring",
	    left_ring="Ilabrat Ring",
	    right_ring="Ramuh Ring",
	    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
	}
  sets.precast.WS["Rudra's Storm"].SomeAcc = set_combine(sets.precast.WS["Rudra's Storm"])
  sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS["Rudra's Storm"])
	sets.precast.WS["Rudra's Storm"].FullAcc = set_combine(sets.precast.WS["Rudra's Storm"])
  sets.precast.WS["Rudra's Storm"].Fodder = set_combine(sets.precast.WS["Rudra's Storm"])
  sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila +1"})
  sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila +1"})
  sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila +1"})

  sets.precast.WS["Mandalic Stab"] = set_combine(sets.precast.WS, {})
  sets.precast.WS["Mandalic Stab"].SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS["Mandalic Stab"].Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS["Mandalic Stab"].FullAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS["Mandalic Stab"].Fodder = set_combine(sets.precast.WS, {})
  sets.precast.WS["Mandalic Stab"].SA = set_combine(sets.precast.WS, {})
  sets.precast.WS["Mandalic Stab"].TA = set_combine(sets.precast.WS, {})
  sets.precast.WS["Mandalic Stab"].SATA = set_combine(sets.precast.WS, {})

  sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {})
  sets.precast.WS["Shark Bite"].SomeAcc = set_combine(sets.precast.WS, {})
  sets.precast.WS["Shark Bite"].Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS["Shark Bite"].FullAcc = set_combine(sets.precast.WS, {})
  sets.precast.WS["Shark Bite"].Fodder = set_combine(sets.precast.WS, {})
  sets.precast.WS["Shark Bite"].SA = set_combine(sets.precast.WS, {})
  sets.precast.WS["Shark Bite"].TA = set_combine(sets.precast.WS, {})
  sets.precast.WS["Shark Bite"].SATA = set_combine(sets.precast.WS, {})

  sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {})
  sets.precast.WS['Evisceration'].SomeAcc = set_combine(sets.precast.WS, {})
  sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS['Evisceration'].FullAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS['Evisceration'].Fodder = set_combine(sets.precast.WS, {})
  sets.precast.WS['Evisceration'].SA = set_combine(sets.precast.WS, {})
  sets.precast.WS['Evisceration'].TA = set_combine(sets.precast.WS, {})
  sets.precast.WS['Evisceration'].SATA = set_combine(sets.precast.WS, {})

  sets.precast.WS['Last Stand'] = {
      head="Mummu Bonnet +2",neck="Fotia Gorget",ear1="Clearview Earring",ear2="Neritic Earring",
      body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Apate Ring",ring2="Regal Ring",
      back=gear.wsd_jse_back,waist="Fotia Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}

  sets.precast.WS['Aeolian Edge'] = {ammo="Seeth. Bomblet +1",
      head=gear.herculean_nuke_head,neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Crematio Earring",
      body="Samnuha Coat",hands="Leyline Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
      back=gear.wsd_jse_back,waist="Chaac Belt",legs=gear.herculean_wsd_legs,feet=gear.herculean_nuke_feet}

  sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Sherida Earring"}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Sherida Earring"}

    --------------------------------------
    -- Midcast sets
    --------------------------------------

  sets.midcast.FastRecast = {
      head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
      body="Dread Jupon",hands="Leyline Gloves",ring1="Defending Ring",ring2="Prolix Ring",
      back="Moonlight Cape",waist="Tempus Fugit",legs="Rawhide Trousers",feet=gear.herculean_dt_feet}

    -- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})

	sets.midcast.Dia = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)

    -- Ranged gear

  sets.midcast.RA = {
      head="Mummu Bonnet +2",neck="Combatant's Torque",ear1="Clearview Earring",ear2="Neritic Earring",
      body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Apate Ring",ring2="Regal Ring",
      back=gear.da_jse_back,waist="Chaac Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}

  sets.midcast.RA.Acc = {
      head="Mummu Bonnet +2",neck="Combatant's Torque",ear1="Clearview Earring",ear2="Neritic Earring",
      body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Apate Ring",ring2="Regal Ring",
      back=gear.da_jse_back,waist="Chaac Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}

    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets

	sets.resting = {}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

  sets.idle = {
	    ammo="Ginsen",
	    head={ name="Plun. Bonnet +3", augments={'Enhances "Aura Steal" effect',}},
	    body="Pillager's Vest +3",
	    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
	    legs="Pill. Culottes +3",
	    feet={ name="Plun. Poulaines +3", augments={'Enhances "Assassin\'s Charge" effect',}},
	    neck="Asn. Gorget +2",
	    waist="Reiki Yotai",
	    left_ear="Telos Earring",
	    right_ear="Sherida Earring",
	    left_ring="Epona's Ring",
	    right_ring="Hetairoi Ring",
	    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
	}

  sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})

  sets.idle.Weak = set_combine(sets.idle, {})

	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Defense sets

  sets.defense.PDT = {
	    ammo="Staunch Tathlum +1",
	    head="Meghanada Visor +2",
	    body="Ashera Harness",
	    hands="Meg. Gloves +2",
	    legs="Meg. Chausses +2",
	    feet="Meg. Jam. +2",
	    neck="Loricate Torque +1",
	    waist="Flume Belt +1",
	    left_ear="Genmei Earring",
	    right_ear="Etiolation Earring",
	    left_ring="Defending Ring",
	    right_ring="Moonlight Ring",
	    back="Moonlight Cape",
	}

  sets.defense.MDT = {
	    ammo="Staunch Tathlum +1",
	    head="Meghanada Visor +2",
	    body="Ashera Harness",
	    hands="Meg. Gloves +2",
	    legs="Meg. Chausses +2",
	    feet="Meg. Jam. +2",
	    neck="Loricate Torque +1",
	    waist="Flume Belt +1",
	    left_ear="Genmei Earring",
	    right_ear="Etiolation Earring",
	    left_ring="Defending Ring",
	    right_ring="Moonlight Ring",
	    back="Moonlight Cape",
	}
	sets.defense.MEVA = {
	    ammo="Staunch Tathlum +1",
	    head="Meghanada Visor +2",
	    body="Ashera Harness",
	    hands="Meg. Gloves +2",
	    legs="Meg. Chausses +2",
	    feet="Meg. Jam. +2",
	    neck="Loricate Torque +1",
	    waist="Flume Belt +1",
	    left_ear="Genmei Earring",
	    right_ear="Etiolation Earring",
	    left_ring="Defending Ring",
	    right_ring="Moonlight Ring",
	    back="Moonlight Cape",
	}


    --------------------------------------
    -- Melee sets
    --------------------------------------

    -- Normal melee group
  sets.engaged = {
	    ammo="Ginsen",
	    head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
	    body="Pillager's Vest +3",
	    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
	    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
	    feet={ name="Plun. Poulaines +3", augments={'Enhances "Assassin\'s Charge" effect',}},
	    neck="Asn. Gorget +2",
	    waist="Reiki Yotai",
	    left_ear="Telos Earring",
	    right_ear="Sherida Earring",
	    left_ring="Epona's Ring",
	    right_ring="Hetairoi Ring",
	    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
	}

  sets.engaged.SomeAcc = {
	    ammo="Ginsen",
	    head={ name="Plun. Bonnet +3", augments={'Enhances "Aura Steal" effect',}},
	    body="Pillager's Vest +3",
	    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
	    legs="Pill. Culottes +3",
	    feet={ name="Plun. Poulaines +3", augments={'Enhances "Assassin\'s Charge" effect',}},
	    neck="Asn. Gorget +2",
	    waist="Reiki Yotai",
	    left_ear="Telos Earring",
	    right_ear="Sherida Earring",
	    left_ring="Epona's Ring",
	    right_ring="Hetairoi Ring",
	    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
	}

	sets.engaged.Acc = {
	    ammo="Ginsen",
	    head={ name="Plun. Bonnet +3", augments={'Enhances "Aura Steal" effect',}},
	    body="Pillager's Vest +3",
	    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
	    legs="Pill. Culottes +3",
	    feet={ name="Plun. Poulaines +3", augments={'Enhances "Assassin\'s Charge" effect',}},
	    neck="Asn. Gorget +2",
	    waist="Reiki Yotai",
	    left_ear="Telos Earring",
	    right_ear="Sherida Earring",
	    left_ring="Epona's Ring",
	    right_ring="Hetairoi Ring",
	    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
	}

  sets.engaged.FullAcc = {
	    ammo="Ginsen",
	    head={ name="Plun. Bonnet +3", augments={'Enhances "Aura Steal" effect',}},
	    body="Pillager's Vest +3",
	    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
	    legs="Pill. Culottes +3",
	    feet={ name="Plun. Poulaines +3", augments={'Enhances "Assassin\'s Charge" effect',}},
	    neck="Asn. Gorget +2",
	    waist="Reiki Yotai",
	    left_ear="Telos Earring",
	    right_ear="Sherida Earring",
	    left_ring="Epona's Ring",
	    right_ring="Hetairoi Ring",
	    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
	}

  sets.engaged.Fodder = {
	    body="Pillager's Vest +3",
	    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
	    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
	    feet={ name="Plun. Poulaines +3", augments={'Enhances "Assassin\'s Charge" effect',}},
	    neck="Asn. Gorget +2",
	    waist="Reiki Yotai",
	    left_ear="Telos Earring",
	    right_ear="Sherida Earring",
	    left_ring="Epona's Ring",
	    right_ring="Hetairoi Ring",
	    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
	}

  sets.engaged.PDT = {
	    ammo="Ginsen",
	    head={ name="Plun. Bonnet +3", augments={'Enhances "Aura Steal" effect',}},
	    body="Ashera Harness",
	    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
	    legs="Pill. Culottes +3",
	    feet={ name="Plun. Poulaines +3", augments={'Enhances "Assassin\'s Charge" effect',}},
	    neck="Loricate Torque +1",
	    waist="Reiki Yotai",
	    left_ear="Telos Earring",
	    right_ear="Sherida Earring",
	    left_ring="Moonlight Ring",
	    right_ring="Defending Ring",
	    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
	}

  sets.engaged.SomeAcc.PDT = {
	    ammo="Ginsen",
	    head={ name="Plun. Bonnet +3", augments={'Enhances "Aura Steal" effect',}},
	    body="Ashera Harness",
	    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
	    legs="Pill. Culottes +3",
	    feet={ name="Plun. Poulaines +3", augments={'Enhances "Assassin\'s Charge" effect',}},
	    neck="Loricate Torque +1",
	    waist="Reiki Yotai",
	    left_ear="Telos Earring",
	    right_ear="Sherida Earring",
	    left_ring="Moonlight Ring",
	    right_ring="Defending Ring",
	    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
	}

  sets.engaged.Acc.PDT = {
	    ammo="Ginsen",
	    head={ name="Plun. Bonnet +3", augments={'Enhances "Aura Steal" effect',}},
	    body="Ashera Harness",
	    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
	    legs="Pill. Culottes +3",
	    feet={ name="Plun. Poulaines +3", augments={'Enhances "Assassin\'s Charge" effect',}},
	    neck="Loricate Torque +1",
	    waist="Reiki Yotai",
	    left_ear="Telos Earring",
	    right_ear="Sherida Earring",
	    left_ring="Moonlight Ring",
	    right_ring="Defending Ring",
	    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
	}

  sets.engaged.FullAcc.PDT = {
	    ammo="Ginsen",
	    head={ name="Plun. Bonnet +3", augments={'Enhances "Aura Steal" effect',}},
	    body="Ashera Harness",
	    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
	    legs="Pill. Culottes +3",
	    feet={ name="Plun. Poulaines +3", augments={'Enhances "Assassin\'s Charge" effect',}},
	    neck="Loricate Torque +1",
	    waist="Reiki Yotai",
	    left_ear="Telos Earring",
	    right_ear="Sherida Earring",
	    left_ring="Moonlight Ring",
	    right_ring="Defending Ring",
	    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
	}

  sets.engaged.Fodder.PDT = {
	    ammo="Ginsen",
	    head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
	    body="Ashera Harness",
	    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
	    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
	    feet={ name="Plun. Poulaines +3", augments={'Enhances "Assassin\'s Charge" effect',}},
	    neck="Loricate Torque +1",
	    waist="Reiki Yotai",
	    left_ear="Telos Earring",
	    right_ear="Sherida Earring",
	    left_ring="Moonlight Ring",
	    right_ring="Defending Ring",
	    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
	}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 4)
    elseif player.sub_job == 'DNC' then
        set_macro_page(2, 4)
    elseif player.sub_job == 'NIN' then
        set_macro_page(3, 4)
    else
        set_macro_page(1, 4)
    end
end
