//shield flail or longsword, tief can be this with red cross

/datum/advclass/paladin
	name = "Paladin"
	tutorial = "Paladins are holy warriors who have taken sacred vows to uphold justice and righteousness. Often, they were promised redemption for past sins if they crusaded in the name of the gods."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/adventurer/paladin
	traits_applied = list(TRAIT_HEAVYARMOR)
	category_tags = list(CTAG_ADVENTURER)
	maximum_possible_slots = 5		//Supposed to be a rare role, thus why it's in donator category. It's a Templar-equal role.
	cmode_music = 'sound/music/combat_clergy.ogg'

/datum/outfit/job/roguetown/adventurer/paladin
	allowed_patrons = ALL_CLERIC_PATRONS

/datum/outfit/job/roguetown/adventurer/paladin/pre_equip(mob/living/carbon/human/H)
	..()
	switch(H.patron.name)
		if("Zizo")
			neck = /obj/item/clothing/neck/roguetown/psicross/skull
		if("Astrata")
			neck = /obj/item/clothing/neck/roguetown/psicross/astrata
		if("Dendor")
			neck = /obj/item/clothing/neck/roguetown/psicross/dendor
		if("Necra")
			neck = /obj/item/clothing/neck/roguetown/psicross/necra
		if("Pestra")
			neck = /obj/item/clothing/neck/roguetown/psicross/pestra
		if("Noc")
			neck = /obj/item/clothing/neck/roguetown/psicross/noc
		if("Eora") //Eora content from Stonekeep
			neck = /obj/item/clothing/neck/roguetown/psicross/eora


	H.adjust_blindness(-3)
	var/classes = list("Paladin","Battle Master",)
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)

		if("Paladin")
			to_chat(src, span_warning("Paladins are holy warriors who have taken sacred vows to uphold justice and righteousness. Often, they were promised redemption for past sins if they crusaded in the name of the gods."))
			H.set_blindness(0) // No introduction text due to there being no real difference in Paladin archetypes for now.
			to_chat(H, span_warning("You are a paladin."))
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/labor/butchering, 1, TRUE)
			H.change_stat("perception", 1)
			H.change_stat("strength", 2)
			H.change_stat("constitution", 2) // Classic paladin is smurter then the battle master.
			H.change_stat("intelligence", 2)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
			H.mind.AddSpell(new	/obj/effect/proc_holder/spell/targeted/churn)
			H.mind.AddSpell(new	/obj/effect/proc_holder/spell/invoked/lesser_heal)
			shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
			neck = /obj/item/clothing/neck/roguetown/psicross/silver
			armor = /obj/item/clothing/suit/roguetown/armor/plate/half
			pants = /obj/item/clothing/under/roguetown/chainlegs
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather
			belt = /obj/item/storage/belt/rogue/leather/hand
			beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
			beltr = /obj/item/rogueweapon/huntingknife
			id = /obj/item/clothing/ring/silver
			cloak = /obj/item/clothing/cloak/tabard/crusader
			backr = /obj/item/rogueweapon/sword/long
			backl = /obj/item/storage/backpack/rogue/satchel
			switch(H.patron.name)
				if("Astrata")
					cloak = /obj/item/clothing/cloak/tabard/crusader/astrata
				if("Dendor")
					cloak = /obj/item/clothing/cloak/tabard/crusader/dendor
				if("Necra")
					cloak = /obj/item/clothing/cloak/tabard/crusader/necra
				if("Pestra")
					cloak = /obj/item/clothing/cloak/tabard/crusader/pestra
				if("Noc")
					cloak = /obj/item/clothing/cloak/tabard/crusader/noc
		if("Battle Master")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a battle-master."))
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/labor/butchering, 1, TRUE)
			H.change_stat("perception", 1)
			H.change_stat("strength", 2)
			H.change_stat("constitution", 2)
			H.change_stat("endurance", 2)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
			H.mind.AddSpell(new	/obj/effect/proc_holder/spell/targeted/churn)
			H.mind.AddSpell(new	/obj/effect/proc_holder/spell/invoked/lesser_heal)
			shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
			neck = /obj/item/clothing/neck/roguetown/psicross/silver
			armor = /obj/item/clothing/suit/roguetown/armor/plate/half
			pants = /obj/item/clothing/under/roguetown/chainlegs
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather
			belt = /obj/item/storage/belt/rogue/leather/hand
			beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
			beltr = /obj/item/rogueweapon/huntingknife
			id = /obj/item/clothing/ring/silver
			cloak = /obj/item/clothing/cloak/tabard/crusader
			switch(H.patron.name)
				if("Astrata")
					cloak = /obj/item/clothing/cloak/tabard/crusader/astrata
				if("Dendor")
					cloak = /obj/item/clothing/cloak/tabard/crusader/dendor
				if("Necra")
					cloak = /obj/item/clothing/cloak/tabard/crusader/necra
				if("Pestra")
					cloak = /obj/item/clothing/cloak/tabard/crusader/pestra
				if("Noc")
					cloak = /obj/item/clothing/cloak/tabard/crusader/noc
				if("Eora") //Eora content from Stonekeep
					cloak = /obj/item/clothing/cloak/tabard/crusader/eora
			backr = /obj/item/rogueweapon/flail
			if(prob(50))
				l_hand = /obj/item/rogueweapon/shield/wood
			else
				l_hand = /obj/item/rogueweapon/shield/tower
			backl = /obj/item/storage/backpack/rogue/satchel

	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
	if(H.dna.species.type == /datum/species/tieberian)
		cloak = /obj/item/clothing/cloak/tabard/crusader/tief
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	//Max devotion limit - Paladins are stronger but cannot pray to gain all abilities beyond t2
	C.grant_spells_templar(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
