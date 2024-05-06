extends Node2D

@onready var move_component: MoveComponent = $MoveComponent
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var move_input_component: MoveInputComponent = $MoveInputComponent
@onready var run_dust: CPUParticles2D = $RunDust

func _process(delta):
	animate_player()

func animate_player():
	run_dust.emitting = false
	if move_input_component.is_rolling and move_component.velocity != Vector2.ZERO:
		animated_sprite_2d.play("roll")
	elif move_component.velocity != Vector2.ZERO:
		animated_sprite_2d.flip_h = (move_component.velocity.x < 0)
		run_dust.emitting = true
		animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("idle")
