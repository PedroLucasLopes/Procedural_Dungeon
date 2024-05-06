class_name MoveInputComponent
extends Node

@export var move_component: MoveComponent
@export var speed: float = 100.0
@export var roll_speed: float = 150.0
@export var roll_duration: float = 0.5

var is_rolling: bool = false
var roll_timer: float = 0.0

func _physics_process(delta):
	var input_axis = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var input_accept = Input.is_action_just_pressed("ui_accept")

	if input_accept and not is_rolling:
		is_rolling = true
		roll_timer = roll_duration
		move_component.velocity = input_axis * roll_speed
	elif is_rolling:
		roll_timer -= delta
		if roll_timer < 0:
			is_rolling = false
	else:
		move_component.velocity = input_axis * speed
