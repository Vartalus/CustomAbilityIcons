--- @class (partial) CustomAbilityIcons
local CustomAbilityIcons = CustomAbilityIcons

local ELEMENTAL_EXPLOSION_ABILITYID = 217228
local MENDERS_BOND_ABILITYID = 220549
local SHIELD_THROW_ABILITYID = 222966
local SMASH_ABILITYID = 217184
local SOUL_BURST_ABILITYID = 217459
local TORCHBEARER_ABILITYID = 217607
local TRAMPLE_ABILITYID = 217663
local TRAVELING_KNIFE_ABILITYID = 217872
local ULFSILDS_CONTINGENCY_ABILITYID = 222678
local VAULT_ABILITYID = 214960
local WIELD_SOUL_ABILITYID = 215731
local FLAME = "flame"
local FROST = "frost"
local SHOCK = "shock"
local MAGIC = "magic"
local HEAL = "heal"
local RESOURCES = "resources"
local ULTIMATE = "ultimate"
local STUN = "stun"
local IMMOBILIZE = "immobilize"
local DISPEL = "dispel"
local SHIELD = "shield"
local PHYSICAL = "physical"
local BLEED = "bleed"
local TRAUMA = "trauma"
local POISON = "poison"
local DISEASE = "disease"

DEFAULT = "default"

local ESO_ROOT = "esoui/art/icons/"
local ADDON_ROOT = "/CustomAbilityIcons/icons/"

CustomAbilityIcons.custom_ability_icons = {
    [ELEMENTAL_EXPLOSION_ABILITYID] = {
        [FLAME] = ESO_ROOT .. "ability_grimoire_staffdestro.dds",
        [FROST] = ADDON_ROOT .. "ability_grimoire_staffdestro_frost.dds",
        [SHOCK] = ADDON_ROOT .. "ability_grimoire_staffdestro_shock.dds",
        [MAGIC] = ADDON_ROOT .. "ability_grimoire_staffdestro_magic.dds",
        [DISPEL] = ADDON_ROOT .. "ability_grimoire_staffdestro_magic.dds",
        [TRAUMA] = ADDON_ROOT .. "ability_grimoire_staffdestro_trauma.dds",
        [DEFAULT] = ADDON_ROOT .. "ability_grimoire_staffdestro_physical.dds"
    },
    [MENDERS_BOND_ABILITYID] = {
        [MAGIC] = ADDON_ROOT .. "ability_grimoire_staffresto_magic.dds",
        [RESOURCES] = ADDON_ROOT .. "ability_grimoire_staffresto_resources.dds",
        [SHIELD] = ADDON_ROOT .. "ability_grimoire_staffresto_shield.dds",
        [DEFAULT] = ESO_ROOT .. "ability_grimoire_staffresto.dds"
    },
    [SHIELD_THROW_ABILITYID] = {
        [FROST] = ADDON_ROOT .. "ability_grimoire_1handed_frost.dds",
        [MAGIC] = ADDON_ROOT .. "ability_grimoire_1handed_magic.dds",
        [IMMOBILIZE] = ADDON_ROOT .. "ability_grimoire_1handed_magic.dds",
        [DEFAULT] = ESO_ROOT .. "ability_grimoire_1handed.dds"
    },
    [SMASH_ABILITYID] = {
        [MAGIC] = ADDON_ROOT .. "ability_grimoire_2handed_magic.dds",
        [HEAL] = ADDON_ROOT .. "ability_grimoire_2handed_heal.dds",
        [SHIELD] = ADDON_ROOT .. "ability_grimoire_2handed_shield.dds",
        [BLEED] = ADDON_ROOT .. "ability_grimoire_2handed_bleed.dds",
        [DEFAULT] = ESO_ROOT .. "ability_grimoire_2handed.dds"
    },
    [SOUL_BURST_ABILITYID] = {
        [FROST] = ADDON_ROOT .. "ability_grimoire_soulmagic2_frost.dds",
        [SHOCK] = ADDON_ROOT .. "ability_grimoire_soulmagic2_shock.dds",
        [MAGIC] = ESO_ROOT .. "ability_grimoire_soulmagic2.dds",
        [HEAL] = ADDON_ROOT .. "ability_grimoire_soulmagic2_heal.dds",
        [IMMOBILIZE] = ESO_ROOT .. "ability_grimoire_soulmagic2.dds",
        [SHIELD] = ADDON_ROOT .. "ability_grimoire_soulmagic2_shield.dds",
        [DEFAULT] = ADDON_ROOT .. "ability_grimoire_soulmagic2_physical.dds"
    },
    [TORCHBEARER_ABILITYID] = {
        [FLAME] = ESO_ROOT .. "ability_grimoire_fightersguild.dds",
        [FROST] = ADDON_ROOT .. "ability_grimoire_fightersguild_frost.dds",
        [HEAL] = ADDON_ROOT .. "ability_grimoire_fightersguild_heal.dds",
        [ULTIMATE] = ADDON_ROOT .. "ability_grimoire_fightersguild_ultimate.dds",
        [BLEED] = ADDON_ROOT .. "ability_grimoire_fightersguild_bleed.dds",
        [DEFAULT] = ADDON_ROOT .. "ability_grimoire_fightersguild_physical.dds"
    },
    [TRAMPLE_ABILITYID] = {
        [MAGIC] = ADDON_ROOT .. "ability_grimoire_assault_magic.dds",
        [STUN] = ADDON_ROOT .. "ability_grimoire_assault_stun.dds",
        [DISPEL] = ADDON_ROOT .. "ability_grimoire_assault_magic.dds",
        [PHYSICAL] = ADDON_ROOT .. "ability_grimoire_assault_physical.dds",
        [TRAUMA] = ADDON_ROOT .. "ability_grimoire_assault_trauma.dds",
        [DISEASE] = ADDON_ROOT .. "ability_grimoire_assault_disease.dds",
        [DEFAULT] = ESO_ROOT .. "ability_grimoire_assault.dds"
    },
    [TRAVELING_KNIFE_ABILITYID] = {
        [MAGIC] = ADDON_ROOT .. "ability_grimoire_dualwield_magic.dds",
        [BLEED] = ADDON_ROOT .. "ability_grimoire_dualwield_bleed.dds",
        [POISON] = ADDON_ROOT .. "ability_grimoire_dualwield_poison.dds",
        [DEFAULT] = ESO_ROOT .. "ability_grimoire_dualwield.dds"
    },
    [ULFSILDS_CONTINGENCY_ABILITYID] = {
        [FLAME] = ADDON_ROOT .. "ability_grimoire_magesguild_flame.dds",
        [FROST] = ADDON_ROOT .. "ability_grimoire_magesguild_frost.dds",
        [MAGIC] = ADDON_ROOT .. "ability_grimoire_magesguild_magic.dds",
        [DEFAULT] = ADDON_ROOT .. "ability_grimoire_magesguild_heal.dds"
    },
    [VAULT_ABILITYID] = {
        [FLAME] = ADDON_ROOT .. "ability_grimoire_bow_fire.dds",
        [HEAL] = ADDON_ROOT .. "ability_grimoire_bow_heal.dds",
        [POISON] = ADDON_ROOT .. "ability_grimoire_bow_poison.dds",
        [DISEASE] = ADDON_ROOT .. "ability_grimoire_bow_poison.dds",
        [DEFAULT] = ESO_ROOT .. "ability_grimoire_bow.dds"
    },
    [WIELD_SOUL_ABILITYID] = {
        [FROST] = ADDON_ROOT .. "ability_grimoire_soulmagic1_frost.dds",
        [SHOCK] = ADDON_ROOT .. "ability_grimoire_soulmagic1_shock.dds",
        [MAGIC] = ESO_ROOT .. "ability_grimoire_soulmagic1.dds",
        [HEAL] = ADDON_ROOT .. "ability_grimoire_soulmagic1_heal.dds",
        [STUN] = ADDON_ROOT .. "ability_grimoire_soulmagic1_frost.dds",
        [SHIELD] = ADDON_ROOT .. "ability_grimoire_soulmagic1_shield.dds",
        [DEFAULT] = ADDON_ROOT .. "ability_grimoire_soulmagic1_physical.dds"
    }
}