class_name ODoor
extends StaticBody2D


export var locked: bool = false


func _ready() -> void:
	if locked:
		$Sprite.texture = load("res://assets/sprites/environment/home/door_locked.png")
		$Hitbox.disabled = false
		$AudioStreamPlayer.stream = load("res://assets/sounds/sfx/door_closed.ogg")
	$Area.connect("body_entered", self, "_on_area_body_entered")
	$Area.connect("body_exited" , self, "_on_area_body_exited" )


func _on_area_body_entered(body: Object) -> void:
	if body is OPlayer:
		if !locked:
			$Sprite.texture = load("res://assets/sprites/environment/home/door.png")
			$Sprite.modulate = Color(1, 1, 1, 0.5)
			$AudioStreamPlayer.stream = load("res://assets/sounds/sfx/door_opened.ogg")
			$Hitbox.set_deferred("disabled", true)
			# $LightOccluder.visible = false
		Global.Audio.play_once($AudioStreamPlayer, get_tree())


func _on_area_body_exited(body: Object) -> void:
	if body is OPlayer:
		$Sprite.modulate = Color(1, 1, 1, 1)
		# $LightOccluder.visible = true
