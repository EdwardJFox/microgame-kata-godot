extends Area2D

export var speed = 200.0
var screen_size = Vector2.ZERO
var sprite_width
var border_width = 14
var screen_boundary_left
var screen_boundary_right

func _ready():
	screen_size = get_viewport_rect().size
	sprite_width = $BodySprite.get_sprite_frames().get_frame("default",0).get_size().x
	screen_boundary_left = border_width + (sprite_width / 2)
	screen_boundary_right = screen_size.x - border_width - (sprite_width / 2)

func _process(delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1

	if direction.length() > 0:
		direction = direction.normalized()

	position += direction * speed * delta
	position.x = clamp(position.x, screen_boundary_left, screen_boundary_right)
