extends Control

var product = preload("res://Scenes/Item/item.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in Global.products:
		var productInstance = product.instantiate()
		productInstance.set_attributes(i["price"],i["name"],i["description"])
		$MarginContainer/FlowContainer.add_child(productInstance)

func _on_back_button_pressed():
	Transition.transition_scene("res://Scenes/Map/map.tscn")
