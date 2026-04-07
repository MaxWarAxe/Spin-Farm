extends Node
var _upgrades: Dictionary = {}  # { node_id: Array[UpgradeData] }

func apply_upgrade(node: Node, upgrade: Upgrade) -> void:
	var id = node.get_instance_id()
	if not _upgrades.has(id):
		_upgrades[id] = []
	_upgrades[id].append(upgrade)
