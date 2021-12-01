tool
extends Node2D

signal timer_end

export var max_rope_length = 7.0
export var timer_length = 4.0

var starting_rope_position = Vector2(19.5, 156.5)
var first_rope_position = Vector2(28, 150)
var rope_width = 33
var base_fire_position = Vector2(10, 152)
var final_fire_position = Vector2(27, 140)
var remaining_steps = max_rope_length
var timer_interval_length = timer_length/max_rope_length

func _ready():
	_setup_rope()
	if not Engine.editor_hint:
		$IntervalTimer.wait_time = timer_interval_length
		_setup_next_timer()
	_move_fire(base_fire_position)

func _setup_rope():
	for n in max_rope_length:
		var rope_sprite = Sprite.new()
		if n == 0:
			rope_sprite.texture = load("res://assets/art/timer/rope_end.png")
			rope_sprite.position = first_rope_position
		else:
			rope_sprite.texture = load("res://assets/art/timer/rope.png")
			var rope_position = starting_rope_position
			rope_position.x += n * rope_width
			rope_sprite.position = rope_position
		$Ropes.add_child(rope_sprite)

func _setup_next_timer():
	$IntervalTimer.start()
	
func _on_end():
	$ExplosionSprite.visible = true
	$BombSprite.visible = false
	$Ropes.visible = false
	$FireSprite.visible = false
	$IntervalTimer.stop()
	emit_signal("timer_end")

func _on_IntervalTimer_timeout():
	$Numbers.animation = str(remaining_steps)
	if remaining_steps == 0:
		_on_end()
	else:
		_increment_rope()
		
func _increment_rope():
	remaining_steps -= 1
	$Ropes.remove_child($Ropes.get_children()[-1])
	if remaining_steps == 0:
		_move_fire(final_fire_position)
	else:
		_move_fire(base_fire_position)
	_setup_next_timer()

func _move_fire(new_fire_position):
	new_fire_position.x += remaining_steps * rope_width
	$FireSprite.position = new_fire_position
