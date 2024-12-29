extends RigidBody2D

@export var speed = 550.0

func _ready() -> void:
	linear_velocity.x = -speed

func _physics_process(delta: float) -> void:	
	#linear_velocity.y = 0
	gravity_scale = 0
	
	if linear_velocity.x < 0:
		linear_velocity.x = -speed
	else:
		linear_velocity.x = speed
	
	
	var collision_info = move_and_collide(linear_velocity * delta)
	if collision_info:
		linear_velocity = linear_velocity.bounce(collision_info.get_normal())
		
		# Randomize bounce
		linear_velocity.y += randi_range(-150, 150)
		# Reset to constant speed
		linear_velocity = linear_velocity.normalized() * speed
		
func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	for i in range(state.get_contact_count()):
		var collider = state.get_contact_collider_object(i)
		var collision_normal = state.get_contact_local_normal(i)
		
		if collider and collider.name == "Player":
			linear_velocity.y += collider.velocity.y * 0.5
