extends KinematicBody2D

export var speed = 200.0
export var bounce = 800
export var acceleration = 0.25
export var slowdown = 0.3
var velocity = Vector2.ZERO
var movable = true

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
	if movable:
		_get_inputs()
		var collision = move_and_collide(velocity)

		if collision:
			# If we're colliding on the left or right
			if collision.normal.x != 0:
				var collision_layer = collision.collider.get_collision_layer()
				
				# Don't want it to bounce as much on the ball
				var ball_divider = 1

				# If the player hits the watermelon (enemy layer), bounce a little less
				if collision_layer == 3:
					ball_divider = 4

				if velocity.angle() == 0:
					velocity.x = -(bounce / ball_divider)
				else:
					velocity.x = (bounce / ball_divider)
			else:
				_on_hit()

func _on_miss():
	movable = false
	$BodySprite.play("miss")
	
func _on_hit():
	$BodySprite.play("hit_1")

func _on_BodySprite_animation_finished():
	if $BodySprite.animation == "hit_1":
		$BodySprite.animation = "default"
