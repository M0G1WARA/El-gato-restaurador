extends CanvasLayer

signal returnMap

func _ready():
	pass


func _on_return_pressed():
	emit_signal("returnMap")
