tool

extends KinematicBody2D

export var speed = 100.0
export var spawn_width = 150 setget set_spawn_width
export var min_angle = 20
export var max_angle = 45
var spawn_location = Vector2.ZERO
var angle = 0
var direction = Vector2(1, 0)
var dev_line = Line2D.new()
var moving = false

func _ready():
	if !Engine.editor_hint:
		angle = rand_range(min_angle, max_angle)
		direction = Vector2.DOWN.rotated(angle)
		direction = direction * speed

func _draw():
	if Engine.editor_hint and dev_line.get_parent() != get_parent():
		get_parent().add_child(dev_line)
		_draw_dev_spawn_line()

func _physics_process(delta):
	if !Engine.editor_hint and moving:
		var collision = move_and_collide(direction * speed * delta)

		if collision:
			if collision.normal.x != 0:
				direction.x = -direction.x
			if collision.normal.y != 0:
				direction.y = -direction.y

# For drawing the area where the watermelon can be spawned along in the editor
func _draw_dev_spawn_line(y = self.position.y):
	if Engine.editor_hint and get_viewport() != null:
		var viewport_width = get_viewport().get_visible_rect().size.x
		var starting_x = (viewport_width - spawn_width) / 2
		
		dev_line.clear_points()
		dev_line.add_point(Vector2(starting_x, y))
		dev_line.add_point(Vector2(starting_x + spawn_width, y))
		dev_line.width = 2
	
func set_spawn_width(value):
	spawn_width = value
	_draw_dev_spawn_line()
	
func _start_moving():
	moving = true

# Hack for having the dev line update when its position changes
func _set(property:String, value) -> bool:
	if property == "position":
		_draw_dev_spawn_line(value.y)
		
	return false
