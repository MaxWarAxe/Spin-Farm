extends Node2D
class_name SoundSpawner
@export var delta_pitch: float = 0.15
@export var sound : AudioStream



func play():
	# 1. Create player
	var player = AudioStreamPlayer2D.new()
	get_tree().get_root().add_child(player)
	
	player.stream = sound
	player.pitch_scale += randf_range(-delta_pitch,delta_pitch)
	player.play()
	
	# 3. Clean up node when finished
	player.finished.connect(player.queue_free)
