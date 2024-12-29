extends CharacterBody2D

const SPEED = 430.0  # Paddle speed
const SMOOTH_ACCEL = 10.0  # Higher = faster acceleration
var ball
var initial_x_pos

func _ready() -> void:
	ball = get_node("../Ball")
	initial_x_pos = position.x

func _physics_process(delta: float) -> void:
	# Lock the paddle's x position
	velocity.x = 0
	position.x = initial_x_pos
	
	# Calculate the direction to move toward the ball
	var ballPosition = ball.position.y
	position.y = ballPosition
	if position.y != ballPosition:
		velocity.y = ball.linear_velocity.y

	# Move the paddle using the physics engine
	move_and_slide()
	
	# Correct collision if enemy paddl touches upper or lower bounds
	var collision = get_slide_collision(0)
	if collision: 
		if collision.get_collider().name == 'CollisionShape2D4':
			position.y = position.y - 1
		elif collision.get_collider().name == 'CollisionShape2D2':
			position.y = position.y + 1
		
