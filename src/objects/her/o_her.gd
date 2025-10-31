class_name OHer
extends KinematicBody2D


const SPEED: float = 400.0

export var pursue: bool = false
export var target: NodePath

onready var _velocity: Vector2 = Vector2.ZERO


func _ready() -> void:
	_update_nav_target()
	$Timer.connect("timeout", self, "_update_nav_target")
	$Area.connect("body_entered", self, "_on_area_body_entered")


func _physics_process(delta: float) -> void:
	_handle_pursuing(delta)


func _update_nav_target() -> void:
	if target != null:
		assert(get_node(target) is KinematicBody2D)
		$NavigationAgent.set_target_location((get_node(target) as KinematicBody2D).global_position)


func _handle_pursuing(delta: float) -> void:
	if target != null && pursue:
		if $NavigationAgent.is_navigation_finished():
			return
		var _direction: Vector2 = global_position.direction_to($NavigationAgent.get_next_location()) * SPEED
		var _steering: Vector2 = (_direction - _velocity) * delta * 4.0
		_velocity += _steering
		_velocity = move_and_slide(_velocity)


func _on_area_body_entered(body: Object) -> void:
	if body is OPlayer:
		get_tree().change_scene("res://src/rooms/end_screen/r_end_screen.tscn")
