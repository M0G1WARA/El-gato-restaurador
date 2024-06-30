extends Control

var product = preload("res://Scenes/Item/item.tscn")
signal removeScene

# Called when the node enters the scene tree for the first time.
func _ready():
	var index = 0
	for i in Global.products:
		var productInstance = product.instantiate()
		productInstance.set_attributes(index,i["price"],i["name"],i["description"])
		$MarginContainer/FlowContainer.add_child(productInstance)
		index+=1
	
	for child in $MarginContainer/FlowContainer.get_children():
		child.connect("buy_item", on_buy_item_pressed.bind(child.get_index()))

func _on_back_button_pressed():
	emit_signal("removeScene")

func on_buy_item_pressed(indexProduct):
	get_parent().get_parent().refresh_hotbar(indexProduct)
