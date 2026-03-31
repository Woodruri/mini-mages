extends CharacterBody2D

const SPEED = 400.0


const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	
	var MOVE = Vector2(Input.get_axis("Left", "Right"),Input.get_axis("Up","Down"))
	
	if MOVE:
		velocity = MOVE * SPEED
	else:
		velocity = Vector2.ZERO
		
		
		
	move_and_slide()
