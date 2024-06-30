extends Control

var scene = load("res://Scenes/RestorationGame/restoration_game.tscn")
var store = load("res://Scenes/Store/store.tscn")
var RestorationInstance = scene.instantiate()
var storeInstance = store.instantiate()
var currentTimeHour = 12
var currentTimeMinutes = 0

func _ready():
	RestorationInstance.connect("removeScene", _on_return_signal.bind(RestorationInstance))
	storeInstance.connect("removeScene", _on_return_signal.bind(storeInstance))
	$HUD/TimeContainer/HourLabel.text = str(currentTimeHour)

func _on_mountain_range_pressed():
	Transition.show_transition()
	$MountainRange.show()
	$City.hide()

func _on_city_pressed():
	Transition.show_transition()
	$City.show()
	$MountainRange.hide()

func _on_store_pressed():
	#Transition.transition_scene("res://Scenes/Store/store.tscn")
	$Instances.add_child(storeInstance)
	$Hotbar.show()
	$HUD.hide()
	$City/MarginContainer/PointLight2D.hide()

func _on_cave_painting_pressed():
	#Transition.transition_scene("res://Scenes/RestorationGame/restoration_game.tscn")
	$Instances.add_child(RestorationInstance)
	$Hotbar.show()
	$City/MarginContainer/PointLight2D.hide()
	
func _on_return_signal(instance):
	$Instances.remove_child(instance)
	$Hotbar.hide()
	$HUD.show()
	$City/MarginContainer/PointLight2D.show()


var IntensityLevel = 1
func _on_timer_timeout():
	if currentTimeMinutes <40:
		currentTimeMinutes+=20
	else:
		currentTimeMinutes=0
		update_canvas()
	
	$HUD/TimeContainer/MinutesLabel.text = '00' if (currentTimeMinutes==0) else str(currentTimeMinutes)


func update_canvas():
	if currentTimeHour <23:
		currentTimeHour+=1
	else:
		currentTimeHour = 0
	
	$HUD/TimeContainer/HourLabel.text =  '00' if (currentTimeHour==0) else str(currentTimeHour)
	
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


func _on_tent_pressed():
	var tmpTime = 0
	if currentTimeHour >= 20 or (currentTimeHour>=0 and currentTimeHour<6):
		tmpTime = 30-currentTimeHour if currentTimeHour>= 20 else 6-currentTimeHour
		print('waaa')
		for n in tmpTime:
			print('timeout ',n)
			update_canvas()
	else:
		print('no puedes dormir')
