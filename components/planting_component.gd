extends Node2D
@export var tile_map_layer_grass: TileMapLayer
@export var tile_map_layer_dirt: TileMapLayer
@export var tile_map_layer_plants: TileMapLayer
@export var initial_cord : Vector2i = Vector2i(35,20)

func _ready() -> void:
	set_seed(initial_cord)

func set_seed(cord):
	if tile_map_layer_plants.get_cell_tile_data(cord):
		return
	tile_map_layer_plants.set_cell(cord,7,Vector2i(0,0),2)
	await get_tree().process_frame
	var seed = tile_map_layer_plants.get_children().back()
	seed.connect("planted_on_position",set_seeds_around)
	seed.connect("planted_on_position",set_dirt)

func set_seeds_around(cord : Vector2):
	cord = tile_map_layer_grass.local_to_map(cord)
	var surounds_cord = tile_map_layer_plants.get_surrounding_cells(cord)
	for pos in surounds_cord:
		set_seed(pos)
		await get_tree().process_frame
func set_dirt(cord:Vector2):
	cord = tile_map_layer_grass.local_to_map(cord)
	tile_map_layer_dirt.set_cells_terrain_connect([cord],0,0,false)
