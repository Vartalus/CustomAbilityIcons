# CustomAbilityIcons
Enhances and customizes various skill icons for the Elder Scrolls Online (ESO) game.

## Description
This addon affects the following areas:
- **Skill Styles:** The skill's normal icon found in the ability bar can be replaced with the selected skill style icon.
- **Scribed Skills:** The appropriate recolor of the original icon of a scribed skill can be replaced, based on the focus script that's been used.
- **Base Game Icons:** Specifically for the destruction staff skill Pulsar (Impulse morph) while using a frost staff, the base game icon can be replaced with something a bit more frosty.

## Customization
This addon can use (but does not rely on) [**LibAddonMenu-2.0**](https://www.esoui.com/downloads/info7-LibAddonMenu-2.0.html) for customizing its in-game settings.

> [!IMPORTANT]
> If LibAddonMenu is not enabled, each one of the available settings will only be accessible via its corresponding chat command. All chat commands can accept the following as inputs:
> - **on** (or **off**)
> - **true** (or **false**)
> - **1** (or **0**)
>
> Using any of these input combinations enables (or disables) the corresponding setting.

If LibAddonMenu is enabled, the following settings screen will be available via
> *Settings -> Addons -> Custom Ability Icons*.

![Settings](images/LibAddonMenu_Settings.png "Settings")

### Use the same settings for all characters
- **ON:** Any selections you make from the three options below will apply to all characters on your account (on both NA and EU servers).
- **OFF:** Any selections you make from the three options below will only apply to the character you're logged in as. You'll need to set these separately for all other characters.

> [!TIP]
> This can also be enabled using:
> ```
> /setoptionglobalicons on
> ```

### Use Skill Style Icons on ability bar
- **ON:** When a skill style is applied to an equipped active skill, the skill style icon _will_ appear as the skill's icon on your ability bar.
- **OFF:** When a skill style is applied to an equipped active skill, the skill style icon _will not_ appear on your ability bar.

> [!TIP]
> This can also be enabled using:
> ```
> /setoptionskillstyleicons on
> ```

### Use Custom Scribed Ability Icons on ability bar
- **ON:** When a scribed skill is equipped on your ability bar, a _recolored_ version of the base skill icon will be displayed on your ability bar. The icon colors have been selected based on each skill's visual effects, while also trying to preserve consistency with the existing skills.
- **OFF:** When a scribed skill is equipped on your ability bar, only the _base_ skill icon will be displayed.

> [!TIP]
> This can also be enabled using:
> ```
> /setoptioncustomicons on
> ```

### Replace mismatched Base Ability Icons

_(This only applies to the frost version of the **Pulsar** morph of the Destruction Staff skill **Impulse**, for the time being)_
- **ON:** A new icon will be displayed if you have a Frost Staff equipped.
- **OFF:** The default icon will be displayed regardless of the type of staff you're using.

> [!TIP]
> This can also be enabled using:
> ```
> /setoptionmismatchedicons on
> ```

## New Icons
### Scribed Skills
The following table contains a mapping of newly added (and base) icons to the corresponding Focus Script effect, per scribed skill. New icons have been created based on the visual effect colors added by each skill's possible Focus Scripts. One icon from each set has been configured as the default for that skill (based on the most often encountered color for the skill's possible Focus Script effects). In some cases the default icon is a new one and in some cases the default icon is the base skill icon.

> [!NOTE]
> **Torchbearer**: You can't use a Frost Damage focus script on Torchbearer, but it looked cool and one can only hope.
>
> **Ulfsild's Contingency**: Even though the base game icon looked nice, it wasn't consistent with the focus script visual effects. So it has been completely replaced by the new ones.

| Skill | &nbsp;&nbsp;Flame&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;Frost&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;Shock&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;Magic&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;Heal&nbsp;&nbsp;&nbsp; | Resources&nbsp; | &nbsp;Ultimate&nbsp; | &nbsp;&nbsp;&nbsp;Stun&nbsp;&nbsp;&nbsp; | Immobilize | &nbsp;&nbsp;Dispel&nbsp;&nbsp; | &nbsp;&nbsp;Shield&nbsp;&nbsp; | &nbsp;Physical&nbsp; | &nbsp;&nbsp;Bleed&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;Trauma&nbsp;&nbsp; | &nbsp;&nbsp;Poison&nbsp;&nbsp; | &nbsp;Disease&nbsp;&nbsp; | &nbsp;Default&nbsp;&nbsp; |
| --- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| Elemental Explosion | ![Elemental Explosion (Base)](images/ability_grimoire_staffdestro.png "Elemental Explosion (Base)") | ![Elemental Explosion (Frost)](images/ability_grimoire_staffdestro_frost.png "Elemental Explosion (Frost)") | ![Elemental Explosion (Shock)](images/ability_grimoire_staffdestro_shock.png "Elemental Explosion (Shock)") | ![Elemental Explosion (Magic & Dispel)](images/ability_grimoire_staffdestro_magic.png "Elemental Explosion (Magic & Dispel)") | | | | | | ![Elemental Explosion (Magic & Dispel)](images/ability_grimoire_staffdestro_magic.png "Elemental Explosion (Magic & Dispel)") | | ![Elemental Explosion (Physical)](images/ability_grimoire_staffdestro_physical.png "Elemental Explosion (Physical)") | | ![Elemental Explosion (Trauma)](images/ability_grimoire_staffdestro_trauma.png "Elemental Explosion (Trauma)") | | | ![Elemental Explosion (Physical)](images/ability_grimoire_staffdestro_physical.png "Elemental Explosion (Physical)") |
| Mender's Bond | | | | ![Mender's Bond (Magic)](images/ability_grimoire_staffresto_magic.png "Mender's Bond (Magic)") | | ![Mender's Bond (Resource Restoration)](images/ability_grimoire_staffresto_resources.png "Mender's Bond (Resource Restoration)") | | | | | ![Mender's Bond (Shield)](images/ability_grimoire_staffresto_shield.png "Mender's Bond (Shield)") | | | | | | ![Mender's Bond (Base)](images/ability_grimoire_staffresto.png "Mender's Bond (Base)") |
| Shield Throw | | ![Shield Throw (Frost)](images/ability_grimoire_1handed_frost.png "Shield Throw (Frost)") | | ![Shield Throw (Magic & Immobilize)](images/ability_grimoire_1handed_magic.png "Shield Throw (Magic & Immobilize)") | | | | | ![Shield Throw (Magic & Immobilize)](images/ability_grimoire_1handed_magic.png "Shield Throw (Magic & Immobilize)") | | | | | | | | ![Shield Throw (Base)](images/ability_grimoire_1handed.png "Shield Throw (Base)") |
| Smash | | | | ![Smash (Magic)](images/ability_grimoire_2handed_magic.png "Smash (Magic)") | ![Smash (Heal)](images/ability_grimoire_2handed_heal.png "Smash (Heal)") | | | | | | ![Smash (Shield)](images/ability_grimoire_2handed_shield.png "Smash (Shield)") | | ![Smash (Bleed)](images/ability_grimoire_2handed_bleed.png "Smash (Bleed)") | | | | ![Smash (Base)](images/ability_grimoire_2handed.png "Smash (Base)") |
| Soul Burst | | ![Soul Burst (Frost)](images/ability_grimoire_soulmagic2_frost.png "Soul Burst (Frost)") | ![Soul Burst (Shock)](images/ability_grimoire_soulmagic2_shock.png "Soul Burst (Shock)") | ![Soul Burst (Base)](images/ability_grimoire_soulmagic2.png "Soul Burst (Base)") | ![Soul Burst (Heal)](images/ability_grimoire_soulmagic2_heal.png "Soul Burst (Heal)") | | | | ![Soul Burst (Base)](images/ability_grimoire_soulmagic2.png "Soul Burst (Base)") | | ![Soul Burst (Shield)](images/ability_grimoire_soulmagic2_shield.png "Soul Burst (Shield)") | ![Soul Burst (Physical)](images/ability_grimoire_soulmagic2_physical.png "Soul Burst (Physical)") | | | | | ![Soul Burst (Physical)](images/ability_grimoire_soulmagic2_physical.png "Soul Burst (Physical)") |
| Torchbearer | ![Torchbearer (Base)](images/ability_grimoire_fightersguild.png "Torchbearer (Base)") | ![Torchbearer (Frost)](images/ability_grimoire_fightersguild_frost.png "Torchbearer (Frost)") | | | ![Torchbearer (Heal)](images/ability_grimoire_fightersguild_heal.png "Torchbearer (Heal)") | | ![Torchbearer (Ultimate)](images/ability_grimoire_fightersguild_ultimate.png "Torchbearer (Ultimate)") | | | | | ![Torchbearer (Physical)](images/ability_grimoire_fightersguild_physical.png "Torchbearer (Physical)") | ![Torchbearer (Bleed)](images/ability_grimoire_fightersguild_bleed.png "Torchbearer (Bleed)") | | | | ![Torchbearer (Physical)](images/ability_grimoire_fightersguild_physical.png "Torchbearer (Physical)") |
| Trample | | | | ![Trample (Magic & Dispel)](images/ability_grimoire_assault_magic.png "Trample (Magic & Dispel)") | | | | ![Trample (Stun)](images/ability_grimoire_assault_stun.png "Trample (Stun)") | | ![Trample (Magic & Dispel)](images/ability_grimoire_assault_magic.png "Trample (Magic & Dispel)") | | ![Trample (Physical)](images/ability_grimoire_assault_physical.png "Trample (Physical)") | | ![Trample (Trauma)](images/ability_grimoire_assault_trauma.png "Trample (Trauma)") | | ![Trample (Disease)](images/ability_grimoire_assault_disease.png "Trample (Disease)") | ![Trample (Base)](images/ability_grimoire_assault.png "Trample (Base)") |
| Traveling Knife | | | | ![Traveling Knife (Magic)](images/ability_grimoire_dualwield_magic.png "Traveling Knife (Magic)") | | | | | | | | | ![Traveling Knife (Bleed)](images/ability_grimoire_dualwield_bleed.png "Traveling Knife (Bleed)") | | ![Traveling Knife (Poison)](images/ability_grimoire_dualwield_poison.png "Traveling Knife (Poison)") | | ![Traveling Knife (Base)](images/ability_grimoire_dualwield.png "Traveling Knife (Base)") |
| Ulfsild's Contingency | ![Ulfsild's Contingency (Flame)](images/ability_grimoire_magesguild_flame.png "Ulfsild's Contingency (Flame)") | ![Ulfsild's Contingency (Frost)](images/ability_grimoire_magesguild_frost.png "Ulfsild's Contingency (Frost)") | | ![Ulfsild's Contingency (Magic)](images/ability_grimoire_magesguild_magic.png "Ulfsild's Contingency (Magic)") | ![Ulfsild's Contingency (Heal)](images/ability_grimoire_magesguild_heal.png "Ulfsild's Contingency (Heal)") | | | | | | | | | | | | ![Ulfsild's Contingency (Heal)](images/ability_grimoire_magesguild_heal.png "Ulfsild's Contingency (Heal)") |
| Vault | ![Vault (Flame)](images/ability_grimoire_bow_flame.png "Vault (Flame)") | | | | ![Vault (Heal)](images/ability_grimoire_bow_heal.png "Vault (Heal)") | | | | | | | | | | ![Vault (Poison & Disease)](images/ability_grimoire_bow_poison.png "Vault (Poison & Disease)") | ![Vault (Poison & Disease)](images/ability_grimoire_bow_poison.png "Vault (Poison & Disease)") | ![Vault (Base)](images/ability_grimoire_bow.png "Vault (Base)") |
| Wield Soul | | ![Wield Soul (Frost & Stun)](images/ability_grimoire_soulmagic1_frost.png "Wield Soul (Frost & Stun)") | ![Wield Soul (Shock)](images/ability_grimoire_soulmagic1_shock.png "Wield Soul (Shock)") | ![Wield Soul (Base)](images/ability_grimoire_soulmagic1.png "Wield Soul (Base)") | ![Wield Soul (Heal)](images/ability_grimoire_soulmagic1_heal.png "Wield Soul (Heal)") | | | ![Wield Soul (Frost & Stun)](images/ability_grimoire_soulmagic1_frost.png "Wield Soul (Frost & Stun)") | | | ![Wield Soul (Shield)](images/ability_grimoire_soulmagic1_shield.png "Wield Soul (Shield)") | ![Wield Soul (Physical)](images/ability_grimoire_soulmagic1_physical.png "Wield Soul (Physical)") | | | | | ![Wield Soul (Physical)](images/ability_grimoire_soulmagic1_physical.png "Wield Soul (Physical)") |

### Base Game Skills
**Pulsar (Frost)**

| Skill | Old Icon | New Icon |
| --- | --- | --- |
| Pulsar | ![Pulsar](images/ability_destructionstaff_008_b_old.png "Pulsar") | ![Pulsar (Frost)](images/ability_destructionstaff_008_b.png "Pulsar (Frost)")

## How It Works
This addon assumes that ESO skills comply with the structure displayed in the following diagram:

![Skill Trees](images/Skill_Trees.drawio.png "Skill Trees")

What the above means is that unmorphed skills exist on the same level as the base scribed skills (i.e. the scribed skill "foundation" on which the actual skill is built, after the scripts are added to it). It also means that every scribed skill flavor exists on the same level as morphed skills.

Assuming the above, the actions taken by this addon are applied in the following order:

**[A]** If any skill styles are selected for a slotted skill, the default skill icon gets replaced by the skill style icon _(provided that the corresponding setting has been selected)_. This can apply to both normal and scribed skills (even though no skill styles for scribed skills exist at the moment). This icon is always a version of the unmorphed skill icon and there aren't any different icons for morphed skills or scribed skill flavors.

**[B]** If a scribed skill is slotted and no skill styles are selected for it (that's always the case for the time being), then a custom icon is selected, based on the focus script that has been used during scribing _(provided that the corresponding setting has been selected)_.

**[C]** If none of the above conditions apply, the base skill icon may get replaced by a new one, if the original skill icon is deemed "mismatched" _(provided that the corresponding setting has been selected)_. Currently, this applies only to the frost version of the **Pulsar** morph of the Destruction Staff skill **Impulse**.
