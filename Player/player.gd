extends CharacterBody2D

const SPEED = 430.0

var mPointsLabel
var mTimer
var mBall

var initial_x = 0
var points = 0

func _ready() -> void:
	initial_x = position.x
	mPointsLabel = get_node('../PointsLabel')
	mTimer = get_node('../Timer')
	mBall = get_node('../Ball')

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("up"):
		velocity.y = -SPEED
	elif Input.is_action_pressed("down"):
		velocity.y = SPEED
	else:
		velocity.y = 0		
		
	velocity.x = 0
	position.x = initial_x
	
	# Use move_and_collide for one-step collision
	var collision = move_and_collide(velocity * delta)  


func _on_area_2d_body_entered(body: Node2D) -> void:
	if mTimer.is_stopped():
		if body.name == 'Ball':
			points += 1
			mPointsLabel.text = str(points)			
			
			# Increase Ball speed
			if mBall.speed < 1000:
				mBall.speed += 30


func _on_timer_timeout() -> void:
	mTimer.start() 
