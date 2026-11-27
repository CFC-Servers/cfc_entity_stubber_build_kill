# cfc_buildkill_entity_stubs

Entity Stubber definitions for the Build/Kill server.

Requires the [cfc_entity_stubber](https://github.com/CFC-Servers/cfc_entity_stubber) version supporting filename-based weapon and entity stubs through PreRegisterSWEP and PreRegisterSENT and automatic client distribution.

## Weapon patches

Individual patches live in `lua/cfc_entity_stubber/weapons/<group>/<weapon_class>.lua`, grouped under `cw`, `m9k`, `tfa`, and `simple_weapons`. Each file returns a function receiving the weapon table. No AddCSLuaFile, weapon lookup, or group registration is needed.

```lua
return function( weapon )
    weapon.Damage = 33
end
```

Filenames must match the full class: for example, `weapons/m9k/m9k_m98b.lua` replaces `m9k/m89b.lua`, and `weapons/m9k/m9k_remington7615p.lua` replaces `m9k/elephant_gun.lua`. Only one grouping level is supported.

Weapon tuning is preserved. Spawn-menu names now come directly from the patched PrintName at registration. The Combine sniper resolves its base-class table inside CanPrimaryFire, after bases have loaded. CW retains its saved original sensitivity method to avoid stacking wrappers.

The former `basic_patches.lua` range and accuracy settings now live in individual `weapons/simple_weapons/<weapon_class>.lua` files. Commented-out entries remain inactive.

## Entity patches

Entity stubs live in `lua/cfc_entity_stubber/entities/<group>/<entity_class>.lua` and receive the actual ENT definition before registration. LFS helicopter health and Simple Weapons projectile/smoke patches now use this format. The restricted M9K weapons and 11 ammo entities set AdminOnly = true and Spawnable = false. They stay registered for other addons to create while being hidden from normal spawn-menu use. The old LFS and Simple Weapons registration files are removed.

## Delayed patches

CW attachments and CSS set_max_ammo.lua retain the delayed API and their group registrations. These need attachment/entity availability or apply to multiple weapons. Their Lua distribution is also handled by the framework. Existing autorun hooks remain in place.
