extends Node2D

signal removeScene

@export var PaintParticles2D: PackedScene
var initCount = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var size = Vector2i(3,4)
	var pattern = $TileMap.tile_set.get_pattern(randi() % 10)
	($TileMap as TileMap).set_layer_modulate(0,Color(randf(), randf(), randf(), randf_range(0.5,0.9)))
	$TileMap.set_pattern(0, Vector2i(1,1), pattern)
	initCount = $TileMap.get_used_cells(0).size()


func get_tile(mouse_pos):
	var cell_pos = $TileMap.local_to_map(mouse_pos)
	return cell_pos

func _input(event):
	if event is InputEventMouseButton and event.is_pressed() and not (event.is_action_pressed("ui_scroll_up") or event.is_action_pressed("ui_scroll_down")):
		var clicked = get_tile(event.position)
		var remplaazar =[]
		
		match  Global.backpack[Global.item_selected]:
			0:
				Messages.show_message("No tienes ningun objeto seleccionado")
			2,5:
				var layer = Global.products[Global.backpack[Global.item_selected]]["layer"]

				remplaazar.append(Vector2i(clicked.x, clicked.y))
				$TileMap.erase_cell(layer,Vector2i(clicked.x, clicked.y))
				$TileMap.set_cells_terrain_connect(layer, remplaazar, 0, -1)
				
				var particle = PaintParticles2D.instantiate()
				particle.position = event.position
				particle.emitting = true
				add_child(particle)
				
				get_parent().get_parent().get_node('Hotbar').emit_signal("updateUses")
			3:
				if $PointLight2D.visible == false:
					$PointLight2D.show()
					get_parent().get_parent().get_node('Hotbar').emit_signal("updateUses")
				else:
					$PointLight2D.hide()
			6:
				get_parent().get_parent().get_node('Hotbar').emit_signal("updateUses")
				var layer = Global.products[Global.backpack[Global.item_selected]]["layer"]
				$TileMap.set_cell(layer, Vector2i(clicked.x, clicked.y), 2, Vector2i(13, 2))
				Global.wanted = true
			_:
				Messages.show_message("No se puede usar este objeto")



func _on_hud_return_map():
	emit_signal("removeScene")

func get_score():
	var tmpCount:float = initCount - $TileMap.get_used_cells(0).size()
	var porcentaje:float = (tmpCount / initCount)*100 if initCount != 0 else 0.0
	return porcentaje
