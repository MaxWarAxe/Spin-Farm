extends Node2D
class_name SoundSpawner
@export var sound : AudioStream



func play():
	# 1. Create player
	var player = AudioStreamPlayer2D.new()
	get_tree().get_root().add_child(player)
	
	player.stream = sound
	player.play()
	
	# 3. Clean up node when finished
	player.finished.connect(player.queue_free)
