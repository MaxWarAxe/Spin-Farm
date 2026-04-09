extends Node2D
@export var tile_map_layer_grass: TileMapLayer
@export var tile_map_layer_dirt: TileMapLayer
@export var tile_map_layer_plants: TileMapLayer
@export var initial_cord : Vector2i = Vector2i(35,20)

func _ready() -> void:
	set_seed(initial_cord)
	await get_tree().process_frame
	first_seed_anim()

func first_seed_anim():
	var seed = tile_map_layer_plants.get_children().back()
	seed.cost = 0
	seed.set_cost_label()
	var tween = get_tree().create_tween()
	for i in range(0,10):
		tween.tween_property(seed,"scale",Vector2(1.5,1.5),0.5)
		tween.tween_property(seed,"scale",Vector2(1,1),0.5)
func set_seed(cord):
	if tile_map_layer_plants.get_cell_source_id(cord) != -1:
		return
	tile_map_layer_plants.set_cell(cord,7,Vector2i(0,0),2)
	await get_tree().process_frame
	var seed = tile_map_layer_plants.get_children().back()
	seed.connect("planted",planted)

func planted(plant: Plant):
	upgrade_plant(plant)
	set_seeds_around(plant.global_position)
	set_dirt(plant.global_position)

func upgrade_plant(plant: Plant):
	pass

func set_seeds_around(cord : Vector2):
	cord = tile_map_layer_grass.local_to_map(cord)
	var surounds_cord = tile_map_layer_plants.get_surrounding_cells(cord)
	for pos in surounds_cord:
		set_seed(pos)
		await get_tree().process_frame

func set_dirt(cord : Vector2):
	cord = tile_map_layer_grass.local_to_map(cord)
	tile_map_layer_dirt.set_cells_terrain_connect([cord],0,0,false)
