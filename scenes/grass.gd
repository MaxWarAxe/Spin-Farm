extends AudioStreamPlayer
@export var harvest_component : HarvestableComponent

func _ready() -> void:
	harvest_component.connect("harvested",play_sound)

func play_sound():
	pitch_scale += randf_range(-0.05,0.05)
	play()
