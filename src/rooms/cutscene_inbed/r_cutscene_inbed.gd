extends Control


func _ready() -> void:
	$Foreground.play("default")
	$Foreground.connect("animation_finished", self, "_on_foreground_animation_fisnished")


func _on_foreground_animation_fisnished(_animation: String):
	get_tree().change_scene("res://src/rooms/home/r_home.tscn")
