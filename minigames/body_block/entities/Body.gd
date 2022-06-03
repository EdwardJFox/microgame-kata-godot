extends KinematicBody2D

export var speed = 200.0
export var bounce = 800
export var acceleration = 0.25
export var slowdown = 0.3
var velocity = Vector2.ZERO

func _get_inputs():
	var direction = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if direction.x != 0:
		velocity.x = lerp(velocity.x, direction.x * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, slowdown)

func _physics_process(delta):
	_get_inputs()
	move_and_slide(velocity, Vector2.UP)
	print(velocity)
	var slide_count = get_slide_count()
	if slide_count:
		var collision = get_slide_collision(slide_count - 1)
		var collider = collision.collider
		if collider.name == "BorderCollision":
			if velocity.angle() == 0:
				velocity.x = -bounce
			else:
				velocity.x = bounce

