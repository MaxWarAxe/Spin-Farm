class_name PlantUpgrade
extends Upgrade

func append():
	UpgradeSystem.plants_upgrades.append(self)
	UpgradeSystem.upgrade_plants(self)
func upgrade(plant: Plant):
	pass
func reset(plant: Plant):
	pass
