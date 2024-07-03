extends Control

var scene = preload("res://Scenes/RestorationGame/restoration_game.tscn")
var store = load("res://Scenes/Store/store.tscn")
var RestorationInstance = scene.instantiate()
var storeInstance = store.instantiate()
var currentTimeHour = 12
var currentTimeMinutes = 0

func _ready():
	RestorationInstance.connect("removeScene", _on_return_signal.bind(RestorationInstance))
	storeInstance.connect("removeScene", _on_return_signal.bind(storeInstance))
	$HUD/PanelContainer/TimeContainer/HourLabel.text = str(currentTimeHour)
	Global.money = randi() % (1800 - 1200 + 1) + 1200
	$HUD/PanelContainer/TimeContainer/Label.text = '$ ' + str(Global.money)

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
	$Instances.add_child(RestorationInstance)
	$Hotbar.show()
	$City/MarginContainer/PointLight2D.hide()
	
func _on_return_signal(instance):
	$Instances.remove_child(instance)
	$Hotbar.hide()
	$HUD.show()
	$City/MarginContainer/PointLight2D.show()
	if $Timer.is_stopped():
		$Timer.start()
	if Global.wanted == true:
		$GameOver.show()


var IntensityLevel = 1
func _on_timer_timeout():
	if currentTimeMinutes <40:
		currentTimeMinutes+=20
	else:
		currentTimeMinutes=0
		update_canvas()
	
	$HUD/PanelContainer/TimeContainer/MinutesLabel.text = '00' if (currentTimeMinutes==0) else str(currentTimeMinutes)


func update_canvas():
	if currentTimeHour <23:
		currentTimeHour+=1
		Global.record_hours +=1
	else:
		Global.record_days +=1
		currentTimeHour = 0
	
	$HUD/PanelContainer/TimeContainer/HourLabel.text =  '00' if (currentTimeHour==0) else str(currentTimeHour)
	
	if currentTimeHour >= 18 and currentTimeHour <= 23:
		IntensityLevel -= 0.15#0.126
		$CanvasModulate.color = Color(IntensityLevel, IntensityLevel, IntensityLevel)
		$City/MarginContainer/Store.disabled = true
		$City/MarginContainer/PointLight2D.visible = true
	elif currentTimeHour >= 1 and currentTimeHour <= 6:
		IntensityLevel += 0.15
		$CanvasModulate.color = Color(IntensityLevel, IntensityLevel, IntensityLevel)
	elif currentTimeHour >= 8 and currentTimeHour < 18:
		$City/MarginContainer/Store.disabled = false
		$City/MarginContainer/PointLight2D.visible = false

func refresh_hotbar(item):
	$Hotbar.refresh(item)
	$HUD/PanelContainer/TimeContainer/Label.text = '$ ' + str(Global.money)


func _on_tent_pressed():
	if 4 in Global.backpack:
		var tmpTime = 0
		if currentTimeHour >= 20 or (currentTimeHour>=0 and currentTimeHour<6):
			tmpTime = 30-currentTimeHour if currentTimeHour>= 20 else 6-currentTimeHour
			for n in tmpTime:
				update_canvas()
		else:
			Messages.show_message("No puedes dormir durante el dia")
	else:
		Messages.show_message("Necesitas una Tienda de campaña para dormir \nPuedes comprarla en la tienda")


func _on_button_pressed():
	$Timer.stop()
	$Finish.show()
	$Finish.load_score(RestorationInstance.get_score())
