extends Area2D

signal win
signal loss

var left_nostril_collision_index;
var right_nostril_collision_index;
var left_fail_collision_index;
var middle_fail_collision_index;
var right_fail_collision_index;

func _ready():
	left_nostril_collision_index = $LeftNostrilCollision.get_index()
	right_nostril_collision_index = $RightNostrilCollision.get_index()
	left_fail_collision_index = $LeftFailCollision.get_index()
	middle_fail_collision_index = $MiddleFailCollision.get_index()
	right_fail_collision_index = $RightFailCollision.get_index()

func _on_success_entered():
	emit_signal("win")
	
func _on_failure_entered():
	emit_signal("loss")
	$NoseSprite.z_index = 1

func _on_left_collision_entered():
	$NoseSprite.animation = "left"
	_on_failure_entered()

func _on_middle_collision_entered():
	$NoseSprite.animation = "middle"
	_on_failure_entered()

func _on_right_collision_entered():
	$NoseSprite.animation = "right"
	_on_failure_entered()

func _on_Nose_area_shape_entered(area_id, area, area_shape, local_shape):
	print("area_shape", area_shape)
	print("local_shape", local_shape)
	match local_shape:
		left_nostril_collision_index, right_nostril_collision_index:
			_on_success_entered()
		left_fail_collision_index:
			_on_left_collision_entered()
		middle_fail_collision_index:
			_on_middle_collision_entered()
		right_fail_collision_index:
			_on_right_collision_entered()
