extends Node2D
@export var plant_seed : Node2D
@export var sound_spawner : SoundSpawner

func _ready() -> void:
	plant_seed.connect("bought",play)
func play():
	sound_spawner.play()
