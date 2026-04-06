extends Node2D
@export var pickup_component : PickupComponent
@export var sound_spawner : SoundSpawner


func _ready() -> void:
	pickup_component.connect("picked_up",play)
	
func play():
	sound_spawner.play()
