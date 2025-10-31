extends Node2D


func _ready() -> void:
	for key in $YSort/Keys.get_children():
		(key as OKey).connect("is_collected", self, "_on_key_collected")
	$"%OCake".connect("is_smashed", self, "_on_cake_smashed")
	$"%TEnteredDeadZone".connect("body_entered", self, "_on_entered_dead_zone_triggered")


func _on_key_collected(key: OKey) -> void:
	assert(get_node("YSort/Doors/%sDoor" % key.name.rstrip("Key")))
	(get_node("YSort/Doors/%sDoor" % key.name.rstrip("Key")) as ODoor).locked = false


func _on_cake_smashed() -> void:
	$"%OBathroomKey".set_deferred("visible", true)
	yield(get_tree().create_timer(0.5), "timeout")
	$"%OBathroomKey/Area".set_deferred("monitoring", true)


func _on_entered_dead_zone_triggered(body: Object) -> void:
	if body is OPlayer:
		$"%OHer".pursue = true
		RGlobal.play_sound(preload("res://assets/sounds/sfx/scream.ogg"), 0.3)
		# RGlobal.fade_in()
