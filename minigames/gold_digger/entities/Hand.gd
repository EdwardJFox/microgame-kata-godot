extends Node2D

export (float, 3, 10) var frequency = 3.5
export (float, 200) var distance = 76
export var entering_speed = 100
export var moving_cutoff = Vector2(0, 119)

var total_time = 0.0

enum State {STATE_MOVING, STATE_ENTERING, STATE_STOPPED}
var current_state = State.STATE_MOVING

func start(start_position):
	position = start_position

func _physics_process(delta):
	total_time += delta
	
	if Input.is_action_pressed("action"):
		current_state = State.STATE_ENTERING
	
	match current_state:
		State.STATE_MOVING:
			var direction = Vector2.ZERO
			direction.x = cos(total_time * frequency)
			
			position += direction * delta * distance
		State.STATE_ENTERING:
			var direction = Vector2.UP
			position += direction * delta * entering_speed
			if position.y < moving_cutoff.y:
				position.y = moving_cutoff.y
				current_state = State.STATE_STOPPED
