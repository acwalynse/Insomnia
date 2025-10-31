class_name OCake
extends StaticBody2D


signal is_smashed


func _ready() -> void:
	$Area.connect("body_entered", self, "_on_area_body_entered")


func _on_area_body_entered(body: Object) -> void:
	if body is OPlayer:
		emit_signal("is_smashed")
		Global.Audio.play_once($AudioStreamPlayer, get_tree())
		$Area.set_deferred("monitoring", false)
		$Sprite.texture = load("res://assets/sprites/environment/home/cake_smashed.png")
