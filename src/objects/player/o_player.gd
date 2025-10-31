class_name OPlayer
extends KinematicBody2D


const SPEED: float = 50.0
const ACCELERATION: float = 500.0

export var skin: SpriteFrames = preload("res://src/objects/player/o_player_sprites_default.tres")

onready var _velocity: Vector2 = Vector2.ZERO
onready var _direction_name: String = "down"


# --- Main ---------------------------------------------------------------------

func _ready() -> void:
	$AnimatedSprite.frames = skin


func _physics_process(delta: float) -> void:
	_handle_movement(delta)
	_handle_animation($AnimatedSprite)

# ------------------------------------------------------------------------------


# --- Handlers -----------------------------------------------------------------

func _handle_movement(delta: float) -> void:
	var _aadd: Vector2 = Vector2(
		Input.is_key_pressed(KEY_RIGHT), # x+
		Input.is_key_pressed(KEY_DOWN)   # y+
	)
	var _asub: Vector2 = Vector2(
		Input.is_key_pressed(KEY_LEFT),  # x-
		Input.is_key_pressed(KEY_UP)     # y-
	)
	
	var _direction: Vector2 = (_aadd - _asub).normalized()
	
	_velocity = _velocity.move_toward(_direction * SPEED, ACCELERATION * delta)
	_velocity = move_and_slide(_velocity)


func _handle_animation(sprites: AnimatedSprite) -> void:
	var _state: String = "idle" if _velocity == Vector2.ZERO else "run"
	
	if   _velocity.x >=  1: _direction_name = "right"
	elif _velocity.x <= -1: _direction_name = "left"
	elif _velocity.y >=  1: _direction_name = "down"
	elif _velocity.y <= -1: _direction_name = "up"
	
	sprites.play("%s_%s" % [_state, _direction_name])

# ------------------------------------------------------------------------------
