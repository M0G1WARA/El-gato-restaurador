extends Control

var scene = preload("res://Scenes/RestorationGame/restoration_game.tscn")
var store = load("res://Scenes/Store/store.tscn")
var RestorationInstance = scene.instantiate()
var storeInstance = store.instantiate()

func _ready():
	$HUD.connect("removeScene", _on_return_signal.bind(RestorationInstance))
	storeInstance.connect("removeScene", _on_return_signal.bind(storeInstance))

func _on_mountain_range_pressed():
	Transition.go_to_san_francisco()
	$MountainRange.show()
	$City.hide()

func _on_city_pressed():
	Transition.go_to_city()
	$City.show()
	$MountainRange.hide()

func _on_store_pressed():
	$Timer.stop()
	Transition.show_transition()
	$Instances.add_child(storeInstance)
	$Hotbar.show()
	$HUD.hide()
	$City/MarginContainer/PointLight2D.hide()

func _on_cave_painting_pressed():
	$HUD.show_return_button()
	$Instances.add_child(RestorationInstance)
	$Hotbar.show()
	$HUD.show()
	$City/MarginContainer/PointLight2D.hide()
	
func _on_return_signal(instance):
	$HUD.hide_return_button()
	$Instances.remove_child(instance)
	$Hotbar.hide()
	$HUD.show()
	$City/MarginContainer/PointLight2D.show()
	if $Timer.is_stopped():
		$Timer.start()
	if Global.wanted == true:
		$GameOver.show()


func refresh_hotbar(item):
	$Hotbar.refresh(item)
	$HUD.update_money()
	storeInstance.update_money()


func _on_tent_pressed():
	$HUD.sleep()

func open_store():
	$City/MarginContainer/Store.disabled = false
	$City/MarginContainer/PointLight2D.visible = false

func close_store():
	$City/MarginContainer/Store.disabled = true
	$City/MarginContainer/PointLight2D.visible = true

func update_canvas_modulate():
	$CanvasModulate.color = Color(Global.IntensityLevel, Global.IntensityLevel, Global.IntensityLevel)


func _on_timer_timeout():
	$HUD._on_timer_timeout()
