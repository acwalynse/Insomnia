extends Control


func _ready() -> void:
	$Metainfo.text = "%s v%s" % [
		Global.PREFIX,
		Global.VERSION
	]
	$Metainfo.text = $Metainfo.text.strip_edges()
	$Hint/Timer.connect("timeout", self, "_on_hint_timer_timeout")


func _input(event) -> void:
	# Check: Any key pressed.
	if InputEventKey && event.is_pressed():
		get_tree().change_scene("res://src/rooms/cutscene_inbed/r_cutscene_inbed.tscn")


func _on_hint_timer_timeout() -> void:
	$Hint.visible = !$Hint.visible
