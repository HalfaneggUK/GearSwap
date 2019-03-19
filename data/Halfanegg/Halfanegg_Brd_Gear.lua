function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant','AoE')
    state.IdleMode:options('Normal','Refresh','Melee')
	  state.Weapons:options('Carnwenhan','TwashTP','TwashAcc', 'CarnKali')

	-- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Daurdabla'
	-- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 2

	-- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(false, 'Use Custom Timers')

	-- Additional local binds
  --send_command('bind ^` gs c cycle ExtraSongsMode')
  --send_command('bind !` input /ma "Chocobo Mazurka" <me>')
	--send_command('bind @` gs c cycle MagicBurstMode')
	--send_command('bind @f10 gs c cycle RecoverMode')
	--send_command('bind @f8 gs c toggle AutoNukeMode')
	--send_command('bind !q gs c weapons NukeWeapons;gs c update')
	--send_command('bind ^q gs c weapons Swords;gs c update')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Weapons sets
	sets.weapons.Carnwenhan = {main="Carnwenhan",sub="Genmei Shield"}
	sets.weapons.TwashTP = {main="Twashtar",sub="Centovente"}
	sets.weapons.TwashAcc = {main="Twashtar",sub="Kaja Knife"}
	sets.weapons.CarnKali = {main="Carnwenhan",sub="Kali"}

	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {
	    head="Fili Calot +1",
	    body="Inyanga Jubbah +2",
	    hands="Gendewitha Gages",
	    legs="Aya. Cosciales +2",
	    feet="Telchine Pigaches",
	    neck="Mnbw. Whistle +1",
	    waist="Flume Belt +1",
	    left_ear="",
	    right_ear="",
	    left_ring="Defending Ring",
	    right_ring="Kishar Ring",
	    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
	}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {feet="Vanya Clogs"})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

	sets.precast.FC.BardSong = {
	    head="Fili Calot +1",
	    body="Inyanga Jubbah +2",
	    hands="Gendewitha Gages",
	    legs="Gende. Spats +1",
	    feet="Telchine Pigaches",
	    neck="Aoidos' Matinee",
	    waist="Flume Belt +1",
	    left_ear="",
	    right_ear="",
	    left_ring="Defending Ring",
	    right_ring="Kishar Ring",
	    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
	}

	sets.precast.FC.BardSong = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC.SongDebuff = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC.SongDebuff.Resistant = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC['Magic Finale'] = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC['Horde Lullaby'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Horde Lullaby'].Resistant = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC['Horde Lullaby'].AoE = set_combine(sets.precast.FC.BardSong,{range="Daurdabla"})
	sets.precast.FC['Horde Lullaby II'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Horde Lullaby II'].Resistant = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC['Horde Lullaby II'].AoE = set_combine(sets.precast.FC.BardSong,{range="Daurdabla"})
	sets.precast.FC.Paeon = set_combine(sets.precast.FC.BardSong,{range="Daurdabla"})

	sets.precast.FC.Mazurka = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})

	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy = sets.precast.FC.Daurdabla


	-- Precast sets to enhance JAs

	sets.precast.JA.Nightingale = {feet="Bihu Slippers +1"}
	sets.precast.JA.Troubadour = {body="Bihu Justaucorps"}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +1"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
	    ammo="Ginsen",
	    head="Aya. Zucchetto +2",
	    body="Ashera Harness",
	    hands="Aya. Manopolas +2",
	    legs="Aya. Cosciales +2",
	    feet="Aya. Gambieras +2",
	    neck="Shadow Gorget",
	    waist="Fotia Belt",
	    left_ear="Ishvara Earring",
	    right_ear="Moonshade Earring",
	    left_ring="Ilabrat Ring",
	    right_ring="Ramuh Ring",
	    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+6','Weapon skill damage +10%',}},
	}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Telos Earring",ear2="Ishvara Earring"}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

sets.precast.WS["Aeolian Edge"] = set_combine(sets.precast.WS, {body="Ashera Harness", legs="Gende. Spats +1"})

	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Inyanga Jubbah +2",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
		  back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},waist="Witful Belt",legs="Aya. Cosciales +2",feet="Gende. Galosh. +1"}

	-- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used.
	sets.midcast.Ballad = {}
	sets.midcast.Lullaby = {}
	sets.midcast['Horde Lullaby'] = {range="Marsyas"}
	sets.midcast['Horde Lullaby'].Resistant = {range="Linos"}
	sets.midcast['Horde Lullaby'].AoE = {range="Daurdabla"}
	sets.midcast['Horde Lullaby II'] = {range="Marsyas"}
	sets.midcast['Horde Lullaby II'].Resistant = {range="Linos"}
	sets.midcast['Horde Lullaby II'].AoE = {range="Daurdabla"}
	sets.midcast.Madrigal = {head="Fili Calot +1 +1"}
	sets.midcast.March = {hands="Fili Manchettes +1"}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{range="Marsyas"})
	sets.midcast.Minuet = {body="Fili Hongreline +1"}
	sets.midcast.Carol = {}
	sets.midcast["Sentinel's Scherzo"] = {} --feet="Fili Cothurnes +1" Brioso Slippers still provides more Duration
	sets.midcast['Magic Finale'] = {range="Linos"}
	sets.midcast.Mazurka = {range="Marsyas"}
	sets.midcast.Paeon = set_combine(sets.precast.FC.BardSong,{range="Daurdabla"})


	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {
	    head="Fili Calot +1",
	    body="Fili Hongreline +1",
	    hands="Fili Manchettes +1",
	    legs="Inyanga Shalwar +2",
	    feet="Brioso Slippers +2",
	    neck="Mnbw. Whistle +1",
	    waist="Flume Belt +1",
	    left_ear="",
	    right_ear="",
	    left_ring="Nereid Ring",
	    right_ring="Inyanga Ring",
	    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
	}

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {
	    head="Inyanga Tiara +2",
	    body="Inyanga Jubbah +2",
	    hands="Inyan. Dastanas +2",
	    legs="Brioso Cannions +3",
	    feet="Inyan. Crackows +2",
	    neck="Mnbw. Whistle +1",
	    waist="Gleeman's Belt",
	    left_ear="",
	    right_ear="",
			left_ring="Nereid Ring",
	    right_ring="Inyanga Ring",
	      back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
	}

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.SongDebuff.Resistant = {
	    head="Inyanga Tiara +2",
	    body="Inyanga Jubbah +2",
	    hands="Inyan. Dastanas +2",
	    legs="Brioso Cannions +3",
	    feet="Inyan. Crackows +2",
	    neck="Mnbw. Whistle +1",
	    waist="Gleeman's Belt",
	    left_ear="",
	    right_ear="",
			left_ring="Nereid Ring",
	    right_ring="Inyanga Ring",
	      back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
	}

	-- Song-specific recast reduction
	sets.midcast.SongRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",range="Terpander",ammo=empty,
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Inyanga Jubbah +2",hands="Gendewitha Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		  back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},waist="Witful Belt",legs="Fili Rhingrave +1",feet="Aya. Gambieras +2"}

	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	-- Other general spells and classes.
	sets.midcast.Cure = {
	    head="Inyanga Tiara +2",
	    body="Chironic Doublet",
	    hands="Inyan. Dastanas +2",
	    legs="Inyanga Shalwar +2",
	    feet="Vanya Clogs",
	    neck="Mnbw. Whistle +1",
	    waist="Gleeman's Belt",
	    left_ear="Evans Earring",
	    right_ear="Graiai Earring",
			left_ring="Nereid Ring",
			right_ring="Inyanga Ring",
	    back={ name="Intarabus's Cape", augments={'CHR+20','"Fast Cast"+10',}},
	}

	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}

	sets.midcast['Enhancing Magic'] = {main="Serenity",sub="Fulcio Grip",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Voltsurge Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Intarabus's Cape",waist="Witful Belt",legs="Telchine Braconi",feet="Telchine Pigaches"}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})

	sets.midcast['Elemental Magic'] = {main="Marin Staff +1",sub="Zuuxowu Grip",ammo="Dosis Tathlum",
		head="Buremte Hat",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Chironic Doublet",hands="Volte Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Sekhmet Corset",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}

	sets.midcast['Elemental Magic'].Resistant = {main="Marin Staff +1",sub="Clerisy Strap +1",ammo="Dosis Tathlum",
		head="Buremte Hat",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Chironic Doublet",hands="Volte Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Yamabuki-no-Obi",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Fodder

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		ring1="Haoma's Ring",ring2="Haoma's Ring",waist="Witful Belt",feet="Vanya Clogs"})

	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})

	-- Resting sets
	sets.resting = {main="Terra's Staff",sub="Oneiros Grip",ammo="Staunch Tathlum",
		head=empty,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Respite Cloak",hands=gear.chironic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Flume Belt",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}

	sets.idle = {
	    range="Marsyas",
	    head="Aya. Zucchetto +2",
	    body="Ashera Harness",
	    hands="Aya. Manopolas +2",
	    legs="Brioso Cannions +3",
	    feet="Aya. Gambieras +2",
	    neck="Loricate Torque +1",
	    waist="Flume Belt +1",
			left_ear="Genmei Earring",
			right_ear="Etiolation Earring",
	    left_ring="Defending Ring",
	    right_ring="Ayanmo Ring",
	    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
	}

	sets.idle.Refresh = {
	    range="Marsyas",
	    head="Inyanga Tiara +2",
	    body="Ashera Harness",
	    hands="Inyan. Dastanas +2",
	    legs="Inyanga Shalwar +2",
	    feet="Inyan. Crackows +2",
	    neck="Mnbw. Whistle +1",
	    waist="Flume Belt +1",
	    left_ear="Moonshade Earring",
	    right_ear="Graiai Earring",
			left_ring="Defending Ring",
	    right_ring="Inyanga Ring",
	    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
	}

	sets.idle.Melee = {
	    range="Marsyas",
	    head="Aya. Zucchetto +2",
	    body="Ashera Harness",
	    hands="Aya. Manopolas +2",
	    legs="Aya. Cosciales +2",
	    feet="Aya. Gambieras +2",
	    neck="Sanctity Necklace",
	    waist="Reiki Yotai",
	    left_ear="Telos Earring",
	    right_ear="Cessance Earring",
	    left_ring="Hetairoi Ring",
	    right_ring="Ilabrat Ring",
	    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
	}

	-- Defense sets

	sets.defense.PDT = {
	    range="Marsyas",
	    head="Aya. Zucchetto +2",
	    body="Ashera Harness",
	    hands="Aya. Manopolas +2",
	    legs="Aya. Cosciales +2",
	    feet="Aya. Gambieras +2",
	    neck="Loricate Torque +1",
	    waist="Flume Belt +1",
			left_ear="Telos Earring",
			right_ear="Cessance Earring",
	    left_ring="Defending Ring",
	    right_ring="Ayanmo Ring",
	    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
	}

	sets.defense.MDT = {
	    range="Marsyas",
	    head="Inyanga Tiara +2",
	    body="Ashera Harness",
	    hands="Inyan. Dastanas +2",
	    legs="Inyanga Shalwar +2",
	    feet="Inyan. Crackows +2",
	    neck="Loricate Torque +1",
	    waist="Flume Belt +1",
			left_ear="Telos Earring",
			right_ear="Cessance Earring",
	    left_ring="Defending Ring",
	    right_ring="Ayanmo Ring",
	    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
	}

	sets.Kiting = {}

	-- Gear for specific elemental nukes.
	sets.WindNuke = {main="Marin Staff +1"}
	sets.IceNuke = {main="Ngqoqwanb"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	sets.engaged = {
	    range="Marsyas",
	    head="Aya. Zucchetto +2",
	    body="Ashera Harness",
	    hands="Aya. Manopolas +2",
	    legs="Aya. Cosciales +2",
	    feet="Aya. Gambieras +2",
	    neck="Sanctity Necklace",
	    waist="Reiki Yotai",
	    left_ear="Telos Earring",
	    right_ear="Cessance Earring",
	    left_ring="Hetairoi Ring",
	    right_ring="Ilabrat Ring",
	    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
	}
	sets.engaged.Acc = {
	    range="Marsyas",
	    head="Aya. Zucchetto +2",
	    body="Ashera Harness",
	    hands="Aya. Manopolas +2",
	    legs="Aya. Cosciales +2",
	    feet="Aya. Gambieras +2",
	    neck="Sanctity Necklace",
	    waist="Reiki Yotai",
	    left_ear="Telos Earring",
	    right_ear="Cessance Earring",
	    left_ring="Hetairoi Ring",
	    right_ring="Ilabrat Ring",
	    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
	}
	sets.engaged.DW = {
	    range="Marsyas",
	    head="Aya. Zucchetto +2",
	    body="Ashera Harness",
	    hands="Aya. Manopolas +2",
	    legs="Aya. Cosciales +2",
	    feet="Aya. Gambieras +2",
	    neck="Sanctity Necklace",
	    waist="Reiki Yotai",
	    left_ear="Telos Earring",
	    right_ear="Cessance Earring",
	    left_ring="Hetairoi Ring",
	    right_ring="Ilabrat Ring",
	    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
	}
	sets.engaged.DW.Acc = {
	    range="Marsyas",
	    head="Aya. Zucchetto +2",
	    body="Ashera Harness",
	    hands="Aya. Manopolas +2",
	    legs="Aya. Cosciales +2",
	    feet="Aya. Gambieras +2",
	    neck="Sanctity Necklace",
	    waist="Reiki Yotai",
	    left_ear="Telos Earring",
	    right_ear="Cessance Earring",
	    left_ring="Hetairoi Ring",
	    right_ring="Ilabrat Ring",
	    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
	}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 1)
end
