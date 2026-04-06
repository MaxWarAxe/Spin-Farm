extends AudioStreamPlayer
@export var harvest_component : HarvestableComponent

func _ready() -> void:
	harvest_component.connect("harvested",play_sound)

func play_sound():
	pitch_scale = 1 + randf_range(-0.1,0.1)
	play()
