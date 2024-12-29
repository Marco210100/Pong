extends CharacterBody2D

const SPEED = 430.0  # Paddle speed
const SMOOTH_ACCEL = 10.0  # Higher = faster acceleration
var ball
var initial_x_pos

func _ready() -> void:
	ball = get_node("../Ball")
	initial_x_pos = position.x

func _physics_process(delta: float) -> void:
	# Calculate the direction to move toward the ball
	var target_y = ball.position.y
	var direction = sign(target_y - position.y)

	# Smoothly adjust velocity toward target
	velocity.y = lerp(velocity.y, direction * SPEED, SMOOTH_ACCEL * delta)

	# Lock the paddle's x position
	velocity.x = 0
	position.x = initial_x_pos

	# Move the paddle using the physics engine
	move_and_slide()
