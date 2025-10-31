class_name OKey
extends StaticBody2D


signal is_collected(key)


func _ready() -> void:
	$Area.connect("body_entered", self, "_on_area_body_entered")


func _on_area_body_entered(body: Object) -> void:
	if body is OPlayer:
		emit_signal("is_collected", self)
		Global.Audio.play_once($AudioStreamPlayer, get_tree())
		set_deferred("visible", false)
		$Area.set_deferred("monitoring", false)
