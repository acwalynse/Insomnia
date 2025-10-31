extends Node


const VERSION: String = "0.1.1"
const PREFIX : String = "Alpha"
# const BUILD  : String = "insm2510a"


class Audio:
	## Same as `AudioStreamPlayer.play()` but does it once.
	static func play_once(audio_stream_player: AudioStreamPlayer, tree: SceneTree) -> void:
		audio_stream_player.play()
		yield(tree.create_timer(audio_stream_player.stream.get_length()), "timeout")
		audio_stream_player.stop()


func _input(_event: InputEvent) -> void:
	# Switch window mode.
	if Input.is_key_pressed(KEY_F11):
		OS.window_fullscreen = !OS.window_fullscreen
		OS.window_size = Vector2(
			ProjectSettings.get_setting("display/window/size/test_width"),
			ProjectSettings.get_setting("display/window/size/test_height")
		)
		OS.move_window_to_foreground()
