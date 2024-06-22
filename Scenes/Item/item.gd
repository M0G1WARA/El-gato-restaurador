extends Control

var productIndex = 0

func set_attributes(index:int, price:int,name:String,description:String):
	$VBoxContainer/BuyButton.text = "$ "+str(price)
	$ItemDetails.set_attributes(name,description)
	productIndex = index

func _on_item_button_pressed():
	$ItemDetails.showDetails()


func _on_buy_button_pressed():
	match productIndex:
		0:
			Global.backpack.append_array([0,0])
		1:
			if 0 in Global.backpack:
				var index = Global.backpack.find(0)
				Global.backpack[index] = 1
		
