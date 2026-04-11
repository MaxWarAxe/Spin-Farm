extends Node
signal new_plant_upgrade
var plants_upgrades : Array[PlantUpgrade]
func upgrade_plant_full(plant : Plant):
	for upgrade in plants_upgrades:
		upgrade.upgrade(plant)
func upgrade_plants(plant_upgrade: PlantUpgrade):
	for plant in Global.plants:
		plant_upgrade.upgrade(plant)

var scythe_upgrades : Array[ScytheUpgrade]
func upgrade_scythe(scythe : Scythe,upgrade: ScytheUpgrade):
	upgrade.upgrade(scythe)
