extends Area2D
class_name PickupComponent
signal picked_up


func pickup():
	picked_up.emit()
