extends CanvasLayer

var currentTimeHour = 12
var currentTimeMinutes = 0

signal removeScene

func _ready():
	Global.IntensityLevel = 1
	Global.money = randi() % (1800 - 1200 + 1) + 1200
	$MarginContainer/PanelContainer/TimeContainer/HourLabel.text = str(currentTimeHour)
	$MarginContainer/PanelContainer/TimeContainer/Label.text = '$ ' + str(Global.money)

func _on_return_button_pressed():
	emit_signal("removeScene")


func _on_finish_button_pressed():
	get_parent().get_node('Timer').stop()
	$Finish.show()
	$Finish.load_score(get_parent().RestorationInstance.get_score())

func show_return_button():
	$MarginContainer/ReturnButton.show()

func hide_return_button():
	$MarginContainer/ReturnButton.hide()

func sleep():
	if 4 in Global.backpack:
		var tmpTime = 0
		if currentTimeHour >= 20 or (currentTimeHour>=0 and currentTimeHour<6):
			var index = Global.backpack.find(4)
			$Hotbar.emit_signal("updateUses",index)
			tmpTime = 30-currentTimeHour if currentTimeHour>= 20 else 6-currentTimeHour
			for n in tmpTime:
				update_canvas()
		else:
			Messages.show_message("No puedes dormir durante el dia")
	else:
		Messages.show_message("Necesitas una Tienda de campaña para dormir \nPuedes comprarla en la tienda")
		

func update_canvas():
	if currentTimeHour <23:
		currentTimeHour+=1
		Global.tmp_hours +=1
	else:
		Global.tmp_days +=1
		Global.tmp_hours = 0
		currentTimeHour = 0
	
	$MarginContainer/PanelContainer/TimeContainer/HourLabel.text =  '00' if (currentTimeHour==0) else str(currentTimeHour)
	
	if currentTimeHour >= 18 and currentTimeHour <= 23:
		Global.IntensityLevel -= 0.15
		get_parent().update_canvas_modulate()
		get_parent().close_store()
	elif currentTimeHour >= 1 and currentTimeHour <= 6:
		Global.IntensityLevel += 0.15
		get_parent().update_canvas_modulate()
	elif currentTimeHour >= 8 and currentTimeHour < 18:
		get_parent().open_store()

func _on_timer_timeout():
	if currentTimeMinutes <40:
		currentTimeMinutes+=20
	else:
		currentTimeMinutes=0
		update_canvas()
	
	$MarginContainer/PanelContainer/TimeContainer/MinutesLabel.text = '00' if (currentTimeMinutes==0) else str(currentTimeMinutes)

func update_money():
	$MarginContainer/PanelContainer/TimeContainer/Label.text = '$ ' + str(Global.money)
