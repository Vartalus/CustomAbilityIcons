--- @class (partial) CustomAbilityIcons
local CustomAbilityIcons = CustomAbilityIcons

CustomAbilityIcons.SAVEDVARIABLES_VERSION = 1.5

CustomAbilityIcons.MIN_INDEX = 3                  -- First ability index
CustomAbilityIcons.MAX_INDEX = 8                  -- Last ability: 7, Ultimate: 8
CustomAbilityIcons.SLOT_INDEX_OFFSET = 20         -- Offset for backbar abilities indices
CustomAbilityIcons.COMPANION_INDEX_OFFSET = 30    -- Offset for companion ultimate

local BANNER_BEARER_ABILITYID = 217699
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
local MULTITARGET = "multi-target"
local BLEED = "bleed"
local TRAUMA = "trauma"
local POISON = "poison"
local DISEASE = "disease"

CustomAbilityIcons.DEFAULT = "default"
local DEFAULT = CustomAbilityIcons.DEFAULT

CustomAbilityIcons.DEFAULT_ADDON_CONFIG = {
    version = CustomAbilityIcons.SAVEDVARIABLES_VERSION,
    saveSettingsGlobally = false,
}

CustomAbilityIcons.DEFAULT_SETTINGS = {
    version = CustomAbilityIcons.SAVEDVARIABLES_VERSION,
    showSkillStyleIcons = true,
    showCustomScribeIcons = true,
    replaceMismatchedBaseIcons = false
}

local ESO_ROOT = "esoui/art/icons/"
local ADDON_ROOT = "/CustomAbilityIcons/icons/"

--- Holds all custom icon configurations for scribed skills.
CustomAbilityIcons.CUSTOM_ABILITY_ICONS = {
    [BANNER_BEARER_ABILITYID] = {
        [FLAME] = ESO_ROOT .. "ability_grimoire_support.dds",
        [SHOCK] = ADDON_ROOT .. "ability_grimoire_support_shock.dds",
        [MAGIC] = ADDON_ROOT .. "ability_grimoire_support_magic.dds",
        [RESOURCES] = ADDON_ROOT .. "ability_grimoire_support_resources.dds",
        [MULTITARGET] = ADDON_ROOT .. "ability_grimoire_support_multi.dds",
        [DEFAULT] = ADDON_ROOT .. "ability_grimoire_support_physical.dds"
    },
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
        [POISON] = ADDON_ROOT .. "ability_grimoire_2handed_poison.dds",
        [DEFAULT] = ESO_ROOT .. "ability_grimoire_2handed.dds"
    },
    [SOUL_BURST_ABILITYID] = {
        [FLAME] = ADDON_ROOT .. "ability_grimoire_soulmagic2_flame.dds",
        [FROST] = ADDON_ROOT .. "ability_grimoire_soulmagic2_frost.dds",
        [SHOCK] = ADDON_ROOT .. "ability_grimoire_soulmagic2_shock.dds",
        [MAGIC] = ESO_ROOT .. "ability_grimoire_soulmagic2.dds",
        [HEAL] = ADDON_ROOT .. "ability_grimoire_soulmagic2_heal.dds",
        [IMMOBILIZE] = ESO_ROOT .. "ability_grimoire_soulmagic2.dds",
        [SHIELD] = ADDON_ROOT .. "ability_grimoire_soulmagic2_shield.dds",
        [BLEED] = ADDON_ROOT .. "ability_grimoire_soulmagic2_bleed.dds",
        [DISEASE] = ADDON_ROOT .. "ability_grimoire_soulmagic2_disease.dds",
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
        [FROST] = ADDON_ROOT .. "ability_grimoire_assault_frost.dds",
        [MAGIC] = ADDON_ROOT .. "ability_grimoire_assault_magic.dds",
        [STUN] = ADDON_ROOT .. "ability_grimoire_assault_stun.dds",
        [DISPEL] = ADDON_ROOT .. "ability_grimoire_assault_magic.dds",
        [PHYSICAL] = ADDON_ROOT .. "ability_grimoire_assault_physical.dds",
        [TRAUMA] = ADDON_ROOT .. "ability_grimoire_assault_trauma.dds",
        [DISEASE] = ADDON_ROOT .. "ability_grimoire_assault_disease.dds",
        [DEFAULT] = ESO_ROOT .. "ability_grimoire_assault.dds"
    },
    [TRAVELING_KNIFE_ABILITYID] = {
        [FROST] = ADDON_ROOT .. "ability_grimoire_dualwield_frost.dds",
        [MAGIC] = ADDON_ROOT .. "ability_grimoire_dualwield_magic.dds",
        [BLEED] = ADDON_ROOT .. "ability_grimoire_dualwield_bleed.dds",
        [POISON] = ADDON_ROOT .. "ability_grimoire_dualwield_poison.dds",
        [DEFAULT] = ESO_ROOT .. "ability_grimoire_dualwield.dds"
    },
    [ULFSILDS_CONTINGENCY_ABILITYID] = {
        [FLAME] = ADDON_ROOT .. "ability_grimoire_magesguild_flame.dds",
        [FROST] = ADDON_ROOT .. "ability_grimoire_magesguild_frost.dds",
        [SHOCK] = ADDON_ROOT .. "ability_grimoire_magesguild_shock.dds",
        [MAGIC] = ADDON_ROOT .. "ability_grimoire_magesguild_magic.dds",
        [BLEED] = ADDON_ROOT .. "ability_grimoire_magesguild_bleed.dds",
        [DEFAULT] = ADDON_ROOT .. "ability_grimoire_magesguild_heal.dds"
    },
    [VAULT_ABILITYID] = {
        [FLAME] = ADDON_ROOT .. "ability_grimoire_bow_flame.dds",
        [HEAL] = ADDON_ROOT .. "ability_grimoire_bow_heal.dds",
        [BLEED] = ADDON_ROOT .. "ability_grimoire_bow_bleed.dds",
        [POISON] = ADDON_ROOT .. "ability_grimoire_bow_poison.dds",
        [DISEASE] = ADDON_ROOT .. "ability_grimoire_bow_poison.dds",
        [DEFAULT] = ESO_ROOT .. "ability_grimoire_bow.dds"
    },
    [WIELD_SOUL_ABILITYID] = {
        [FLAME] = ADDON_ROOT .. "ability_grimoire_soulmagic1_flame.dds",
        [FROST] = ADDON_ROOT .. "ability_grimoire_soulmagic1_frost.dds",
        [SHOCK] = ADDON_ROOT .. "ability_grimoire_soulmagic1_shock.dds",
        [MAGIC] = ESO_ROOT .. "ability_grimoire_soulmagic1.dds",
        [HEAL] = ADDON_ROOT .. "ability_grimoire_soulmagic1_heal.dds",
        [STUN] = ADDON_ROOT .. "ability_grimoire_soulmagic1_frost.dds",
        [SHIELD] = ADDON_ROOT .. "ability_grimoire_soulmagic1_shield.dds",
        [BLEED] = ADDON_ROOT .. "ability_grimoire_soulmagic1_bleed.dds",
        [DISEASE] = ADDON_ROOT .. "ability_grimoire_soulmagic1_disease.dds",
        [DEFAULT] = ADDON_ROOT .. "ability_grimoire_soulmagic1_physical.dds"
    }
}

CustomAbilityIcons.BASE_GAME_ICONS_TO_REPLACE = {
    [ESO_ROOT .. "ability_destructionstaff_008_b.dds"] = ADDON_ROOT .. "ability_destructionstaff_008_b.dds"
}
