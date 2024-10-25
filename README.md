# CustomAbilityIcons
Enhances and customizes various skill icons for the Elder Scrolls Online (ESO) game.

## Description
This addon affects the following areas:
- **Skill Styles:** The skill's normal icon found in the ability bar can be replaced with the selected skill style icon.
- **Scribed Skills:** The appropriate recolor of the original icon of a scribed skill can be replaced, based on the focus script that's been used.
- **Base Game Icons:** Specifically for the destruction staff skill Pulsar (Impulse morph) while using a frost staff, the base game icon can be replaced with something a bit more frosty.

## Customization
This addon can use (but does not rely on) [**LibAddonMenu-2.0**](https://www.esoui.com/downloads/info7-LibAddonMenu-2.0.html) for customizing its in-game settings.

If LibAddonMenu is enabled, the following settings screen will be available via *Settings -> Addons -> Custom Ability Icons*.
![Settings](images/LibAddonMenu_Settings.png "Settings")

The available options are the following:
> Use the same settings for all characters
- **ON:** Any selections you make from the three options below will apply to all characters on your account (on both NA and EU servers).
- **OFF:** Any selections you make from the three options below will only apply to the character you're logged in as. You'll need to set these separately for all other characters.

> Use Skill Style Icons on ability bar
- **ON:** When a skill style is applied to an equipped active skill, the skill style icon _will_ appear as the skill's icon on your ability bar.
- **OFF:** When a skill style is applied to an equipped active skill, the skill style icon _will not_ appear on your ability bar.

> Use Custom Scribed Ability Icons on ability bar
- **ON:** When a scribed skill is equipped on your ability bar, a _recolored_ version of the base skill icon will be displayed on your ability bar. The icon colors have been selected based on each skill's visual effects, while also trying to preserve consistency with the existing skills.
- **OFF:** When a scribed skill is equipped on your ability bar, only the _base_ skill icon will be displayed.

> Replace low quality Default Ability Icons

_(This only applies to the **Pulsar** morph of the Destruction Staff skill **Impulse**, for the time being)_
- **ON:** A new icon will be displayed if you have a Frost Staff equipped.
- **OFF:** The default icon will be displayed regardless of the type of staff you're using.

## New Icons
### Scribed Skills
One icon from each set has been configured as the default for that skill (based on the most often encountered color for the skill's possible Focus Scripts). In some cases the default icon is a new one and in some cases the default icon is the base skill icon.

| Skill | Flame&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Frost&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Shock&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Magic&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Heal&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Resources&nbsp; | Ultimate&nbsp;&nbsp; | Stun&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Immobilize | Dispel&nbsp;&nbsp;&nbsp;&nbsp; | Shield&nbsp;&nbsp;&nbsp;&nbsp; | Physical&nbsp;&nbsp; | Bleed&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Trauma&nbsp;&nbsp;&nbsp;&nbsp; | Poison&nbsp;&nbsp;&nbsp;&nbsp; | Disease&nbsp;&nbsp;&nbsp; | Default&nbsp;&nbsp;&nbsp; |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Elemental Explosion | ![Elemental Explosion (Flame)](images/ability_grimoire_staffdestro.png "Elemental Explosion (Flame)") | ![Elemental Explosion (Frost)](images/ability_grimoire_staffdestro_frost.png "Elemental Explosion (Frost)") | ![Elemental Explosion (Shock)](images/ability_grimoire_staffdestro_shock.png "Elemental Explosion (Shock)") | ![Elemental Explosion (Magic & Dispel)](images/ability_grimoire_staffdestro_magic.png "Elemental Explosion (Magic & Dispel)") | | | | | | ![Elemental Explosion (Magic & Dispel)](images/ability_grimoire_staffdestro_magic.png "Elemental Explosion (Magic & Dispel)") | | ![Elemental Explosion (Physical)](images/ability_grimoire_staffdestro_physical.png "Elemental Explosion (Physical)") | | ![Elemental Explosion (Trauma)](images/ability_grimoire_staffdestro_trauma.png "Elemental Explosion (Trauma)") | | | ![Elemental Explosion (Physical)](images/ability_grimoire_staffdestro_physical.png "Elemental Explosion (Physical)") |
| Mender's Bond | | | | ![Mender's Bond (Magic)](images/ability_grimoire_staffresto_magic.png "Mender's Bond (Magic)") | | ![Mender's Bond (Resource Restoration)](images/ability_grimoire_staffresto_resources.png "Mender's Bond (Resource Restoration)") | | | | | ![Mender's Bond (Shield)](images/ability_grimoire_staffresto_shield.png "Mender's Bond (Shield)") | | | | | | ![Mender's Bond](images/ability_grimoire_staffresto.png "Mender's Bond") |
| Shield Throw | | ![Shield Throw (Frost)](images/ability_grimoire_1handed_frost.png "Shield Throw (Frost)") | | ![Shield Throw (Magic & Immobilize)](images/ability_grimoire_1handed_magic.png "Shield Throw (Magic & Immobilize)") | | | | | ![Shield Throw (Magic & Immobilize)](images/ability_grimoire_1handed_magic.png "Shield Throw (Magic & Immobilize)") | | | | | | | | ![Shield Throw](images/ability_grimoire_1handed.png "Shield Throw") |
| Smash | | | | ![Smash (Magic)](images/ability_grimoire_2handed_magic.png "Smash (Magic)") | ![Smash (Heal)](images/ability_grimoire_2handed_heal.png "Smash (Heal)") | | | | | | ![Smash (Shield)](images/ability_grimoire_2handed_shield.png "Smash (Shield)") | | ![Smash (Bleed)](images/ability_grimoire_2handed_bleed.png "Smash (Bleed)") | | | | ![Smash](images/ability_grimoire_2handed.png "Smash") |
| Soul Burst | | ![Soul Burst (Frost)](images/ability_grimoire_soulmagic2_frost.png "Soul Burst (Frost)") | ![Soul Burst (Shock)](images/ability_grimoire_soulmagic2_shock.png "Soul Burst (Shock)") | ![Soul Burst (Magic & Immobilize)](images/ability_grimoire_soulmagic2.png "Soul Burst (Magic & Immobilize)") | ![Soul Burst (Heal)](images/ability_grimoire_soulmagic2_heal.png "Soul Burst (Heal)") | | | | ![Soul Burst (Magic & Immobilize)](images/ability_grimoire_soulmagic2.png "Soul Burst (Magic & Immobilize)") | | ![Soul Burst (Shield)](images/ability_grimoire_soulmagic2_shield.png "Soul Burst (Shield)") | ![Soul Burst (Physical)](images/ability_grimoire_soulmagic2_physical.png "Soul Burst (Physical)") | | | | | ![Soul Burst (Physical)](images/ability_grimoire_soulmagic2_physical.png "Soul Burst (Physical)") |
| Torchbearer | ![Torchbearer (Flame)](images/ability_grimoire_fightersguild.png "Torchbearer (Flame)") | ![Torchbearer (Frost)](images/ability_grimoire_fightersguild_frost.png "Torchbearer (Frost)") | | | ![Torchbearer (Heal)](images/ability_grimoire_fightersguild_heal.png "Torchbearer (Heal)") | | ![Torchbearer (Ultimate)](images/ability_grimoire_fightersguild_ultimate.png "Torchbearer (Ultimate)") | | | | | ![Torchbearer (Physical)](images/ability_grimoire_fightersguild_physical.png "Torchbearer (Physical)") | ![Torchbearer (Bleed)](images/ability_grimoire_fightersguild_bleed.png "Torchbearer (Bleed)") | | | | ![Torchbearer (Physical)](images/ability_grimoire_fightersguild_physical.png "Torchbearer (Physical)") |
| Trample | | | | ![Trample (Magic & Dispel)](images/ability_grimoire_assault_magic.png "Trample (Magic & Dispel)") | | | | ![Trample (Stun)](images/ability_grimoire_assault_stun.png "Trample (Stun)") | | ![Trample (Magic & Dispel)](images/ability_grimoire_assault_magic.png "Trample (Magic & Dispel)") | | ![Trample (Physical)](images/ability_grimoire_assault_physical.png "Trample (Physical)") | | ![Trample (Trauma)](images/ability_grimoire_assault_trauma.png "Trample (Trauma)") | | ![Trample (Disease)](images/ability_grimoire_assault_disease.png "Trample (Disease)") | ![Trample](images/ability_grimoire_assault.png "Trample") |
| Traveling Knife | | | | ![Traveling Knife (Magic)](images/ability_grimoire_dualwield_magic.png "Traveling Knife (Magic)") | | | | | | | | | ![Traveling Knife (Bleed)](images/ability_grimoire_dualwield_bleed.png "Traveling Knife (Bleed)") | | ![Traveling Knife (Poison)](images/ability_grimoire_dualwield_poison.png "Traveling Knife (Poison)") | | ![Traveling Knife](images/ability_grimoire_dualwield.png "Traveling Knife") |
| Ulfsild's Contingency | ![Ulfsild's Contingency (Flame)](images/ability_grimoire_magesguild_flame.png "Ulfsild's Contingency (Flame)") | ![Ulfsild's Contingency (Frost)](images/ability_grimoire_magesguild_frost.png "Ulfsild's Contingency (Frost)") | | ![Ulfsild's Contingency (Magic)](images/ability_grimoire_magesguild_magic.png "Ulfsild's Contingency (Magic)") | ![Ulfsild's Contingency (Heal)](images/ability_grimoire_magesguild_heal.png "Ulfsild's Contingency (Heal)") | | | | | | | | | | | | ![Ulfsild's Contingency (Heal)](images/ability_grimoire_magesguild_heal.png "Ulfsild's Contingency (Heal)") |
| Vault | ![Vault (Flame)](images/ability_grimoire_bow_fire.png "Vault (Flame)") | | | | ![Vault (Heal)](images/ability_grimoire_bow_heal.png "Vault (Heal)") | | | | | | | | | | ![Vault (Poison & Disease)](images/ability_grimoire_bow_poison.png "Vault (Poison & Disease)") | ![Vault (Poison & Disease)](images/ability_grimoire_bow_poison.png "Vault (Poison & Disease)") | ![Vault](images/ability_grimoire_bow.png "Vault") |
| Wield Soul | | ![Wield Soul (Frost & Stun)](images/ability_grimoire_soulmagic1_frost.png "Wield Soul (Frost & Stun)") | ![Wield Soul (Shock)](images/ability_grimoire_soulmagic1_shock.png "Wield Soul (Shock)") | ![Wield Soul](images/ability_grimoire_soulmagic1.png "Wield Soul") | ![Wield Soul (Heal)](images/ability_grimoire_soulmagic1_heal.png "Wield Soul (Heal)") | | | ![Wield Soul (Frost & Stun)](images/ability_grimoire_soulmagic1_frost.png "Wield Soul (Frost & Stun)") | | | ![Wield Soul (Shield)](images/ability_grimoire_soulmagic1_shield.png "Wield Soul (Shield)") | ![Wield Soul (Physical)](images/ability_grimoire_soulmagic1_physical.png "Wield Soul (Physical)") | | | | | ![Wield Soul (Physical)](images/ability_grimoire_soulmagic1_physical.png "Wield Soul (Physical)") |

### Base Game Skills
**Pulsar (Frost)**

![Pulsar (Frost)](images/ability_destructionstaff_008_b.png "Pulsar (Frost)")
