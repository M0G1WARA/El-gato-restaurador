extends CanvasLayer

func transition_scene(target: String) -> void:
	$AnimationPlayer.play("fade_animation")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards("fade_animation")

func show_transition():
	$AnimationPlayer.play_backwards("fade_animation")

func go_to_san_francisco():
	$AnimationPlayer.play("san_francisco")

func go_to_city():
	$AnimationPlayer.play("city")

func go_to_cave_painting():
	check_backpack()
	var tween = get_tree().create_tween()
	$AnimationPlayer.play("climb")
	tween.tween_property($ColorRect, "modulate:a",1.0 , 0.5)
	tween.tween_property($Cat, "position", Vector2(640,-136), Global.weight)
	tween.tween_property($ColorRect, "modulate:a",0.0 , 0.5)

func go_to_mountain_range():
	check_backpack()
	var tween = get_tree().create_tween()
	$AnimationPlayer.play("climb")
	tween.tween_property($ColorRect, "modulate:a",1.0 , 0.5)
	tween.tween_property($Cat, "position", Vector2(640,900), Global.weight)
	tween.tween_property($ColorRect, "modulate:a",0.0 , 0.5)

func check_backpack():
	if 4 in Global.backpack:
		$Cat/ClimbTent.show()
	else:
		$Cat/ClimbTent.hide()
	match Global.backpack.size():
		2:
			$Cat/ClimbBag.show()
		4:
			$Cat/ClimbBackpack.show()
		5:
			$Cat/ClimbBag.show()
			$Cat/ClimbBackpack.show()
		_:
			pass

func reset_position():
	$Cat.position = Vector2(640,900)
