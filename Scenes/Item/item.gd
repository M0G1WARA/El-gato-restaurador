extends Control

var productIndex = 0

signal buy_item

func set_attributes(index:int, price:int,itemName:String,description:String):
	$VBoxContainer/ItemButton/Sprite2D.frame = index
	$VBoxContainer/BuyButton.text = "$ "+str(price)
	$ItemDetails.set_attributes(itemName,description)
	productIndex = index

func _on_item_button_pressed():
	$ItemDetails.showDetails()


func _on_buy_button_pressed():
	emit_signal("buy_item")
	match productIndex:
		0:
			if Global.backpack.size() < 5 and Global.money>Global.products[productIndex]['price']:
				Global.backpack.append_array([0])
				$VBoxContainer/BuyButton.disabled = true
				Global.weight += 1.0
		1:
			if Global.backpack.size() < 5 and Global.money>Global.products[productIndex]['price']:
				Global.backpack.append_array([0,0,0])
				$VBoxContainer/BuyButton.disabled = true
				Global.weight += 3.0
		2,3,4,5,6:
			if 0 in Global.backpack and Global.money>Global.products[productIndex]['price']:
				var index = Global.backpack.find(0)
				Global.backpack[index] = productIndex
		
