extends Control


func play_sound(sountrack: AudioStream, seek: float = 0.0) -> void:
	$AudioStreamPlayer.stream = sountrack
	$AudioStreamPlayer.seek(seek)
	Global.Audio.play_once($AudioStreamPlayer, get_tree())


func fade_in() -> void:
	$AnimationPlayer.play("fade_in")


func fade_out() -> void:
	$AnimationPlayer.play("fade_out")
