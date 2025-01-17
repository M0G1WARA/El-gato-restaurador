extends PanelContainer

signal item_selected

func set_attributes(valor: int = 0):
	if(valor!=0):
		$VBoxContainer.show()
		$VBoxContainer/TextureRect/Sprite2D.frame = valor
		$VBoxContainer/ProgressBar.max_value = Global.products[valor]["uses"]
		$VBoxContainer/ProgressBar.value =  Global.products[valor]["uses"]
	else:
		$VBoxContainer.hide()

func _on_select_button_pressed():
	emit_signal("item_selected")

func updateUses():
	if $VBoxContainer/ProgressBar.value > 1:
		$VBoxContainer/ProgressBar.value -= 1
	else:
		Global.backpack[Global.item_selected] = 0
		set_attributes()
