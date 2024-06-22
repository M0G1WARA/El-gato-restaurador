extends Control

var product = preload("res://Scenes/Item/item.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in Global.products:
		$MarginContainer/FlowContainer.add_child(product.instantiate())

func _on_back_button_pressed():
	Transition.transition_scene("res://Scenes/Map/map.tscn")
