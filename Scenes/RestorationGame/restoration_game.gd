extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(($TileMap as TileMap).get_used_cells(0))
	pass
	
	
func get_tile(mouse_pos):
	var cell_pos = $TileMap.local_to_map(mouse_pos)
	return cell_pos

func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		var clicked = get_tile(event.position)
		var remplaazar =[]
		
		remplaazar.append(Vector2i(clicked.x, clicked.y))
		$TileMap.erase_cell(0,Vector2i(clicked.x, clicked.y))
		$TileMap.set_cells_terrain_connect(0, remplaazar, 0, -1)
