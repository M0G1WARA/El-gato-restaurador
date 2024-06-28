extends Node2D

signal removeScene

@export var PaintParticles2D: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	var size = Vector2i(3,4)
	var pattern = $TileMap.tile_set.get_pattern(1)
	($TileMap as TileMap).set_layer_modulate(0,Color(0.12, 0.12, 0.12, 0.5))
	$TileMap.set_pattern(0, Vector2i(1,1), pattern)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(($TileMap as TileMap).get_used_cells(0))
	pass
	
	
func get_tile(mouse_pos):
	var cell_pos = $TileMap.local_to_map(mouse_pos)
	return cell_pos

func _input(event):
	if event is InputEventMouseButton and event.is_pressed() and not (event.is_action_pressed("ui_scroll_up") or event.is_action_pressed("ui_scroll_down")):
		var clicked = get_tile(event.position)
		var remplaazar =[]
		
		$HUD/MarginContainer/Hotbar.emit_signal("updateUses")
		
		var layer = Global.products[Global.backpack[Global.item_selected]]["layer"]
		
		remplaazar.append(Vector2i(clicked.x, clicked.y))
		$TileMap.erase_cell(layer,Vector2i(clicked.x, clicked.y))
		$TileMap.set_cells_terrain_connect(layer, remplaazar, 0, -1)
		
		var particle = PaintParticles2D.instantiate()
		particle.position = event.position
		particle.emitting = true
		add_child(particle)

func _on_hud_return_map():
	emit_signal("removeScene")
