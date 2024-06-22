extends Control


func set_attributes(price:int,name:String,description:String):
	$VBoxContainer/BuyButton.text = "$ "+str(price)
	$ItemDetails.set_attributes(name,description)


func _on_item_button_pressed():
	$ItemDetails.showDetails()


func _on_buy_button_pressed():
	Global.backpack.append_array([0,0])
