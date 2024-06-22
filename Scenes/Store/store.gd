extends Control

var product = preload("res://Scenes/Item/item.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var index = 0
	for i in Global.products:
		var productInstance = product.instantiate()
		productInstance.set_attributes(index,i["price"],i["name"],i["description"])
		$MarginContainer/FlowContainer.add_child(productInstance)
		index+=1

func _on_back_button_pressed():
	Transition.transition_scene("res://Scenes/Map/map.tscn")
