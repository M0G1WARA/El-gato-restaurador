extends CanvasLayer

signal returnMap

func _ready():
	pass


func _on_return_pressed():
	if(get_parent().get_parent().get_parent().name == "Map"):
		print("parent de map")
		emit_signal("returnMap")
	else:
		print(get_parent().get_parent().name)
