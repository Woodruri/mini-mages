extends CharacterBody2D

@export var SPEED: float = 400.0
@export var JUMP_VELOCITY:float = -400.0
@export var DASH_IMPULSE: float = 800
@export var DASH_DURATION: float = 0.2

var is_dashing: bool = false
var dash_timer: float = 0.0

func _physics_process(delta: float) -> void:
	
	var move_dir:Vector2 = get_direction()

	if is_dashing:
		dash_timer -= delta
		if dash_timer <= 0.0:
			is_dashing = false
	
	else:
		if move_dir:
			velocity = move_dir * SPEED
		else:
			velocity = Vector2.ZERO


	if Input.is_action_just_pressed("Dash") and not is_dashing:
		dash(move_dir)

	'''if velocity.length() > SPEED:
		velocity -= SPEED * delta'''
	move_and_slide()

func get_direction() -> Vector2:
	return Input.get_vector("Left", "Right", "Up", "Down")

func dash(move_dir: Vector2) -> void:
	var dir = move_dir if move_dir.length() > 0 else Vector2.RIGHT
	velocity = dir * DASH_IMPULSE
	is_dashing = true
	dash_timer = DASH_DURATION