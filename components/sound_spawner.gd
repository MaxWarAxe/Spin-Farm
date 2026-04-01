extends Node2D
@export var sound : AudioStream



func play():
	# 1. Create player
	var player = AudioStreamPlayer2D.new()
	get_tree().get_root().add_child(player)
	
	player.stream = sound
	player.play()
	
	# 3. Clean up node when finished
	player.finished.connect(player.queue_free)


func _on_pickup_component_picked_up() -> void:
	play()
