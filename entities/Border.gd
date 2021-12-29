tool

extends CanvasLayer

export var outer_color = Color("#4767a8") setget set_outer_color 
export var ridge_color = Color("#ffffff") setget set_ridge_color 
export var inner_color = Color("#333333") setget set_inner_color 
export var outer_width = 20 setget set_outer_width
export var outer_height = 10 setget set_outer_height
export var screen_width = 240 setget set_screen_width
export var screen_height = 160 setget set_screen_height

var RIDGE_WIDTH = 5

func _ready():
	_update_outer_border()
	_update_ridge()
	_update_inner()

func _update_outer_border():
	_update_outer_border_color()
	_update_outer_border_sizing_and_position()

func _update_outer_border_color():
	for border_piece in $Outer.get_children():
		border_piece = border_piece as ColorRect
		border_piece.color = outer_color
	
func _update_outer_border_sizing_and_position():
	$Outer/OuterLeft.rect_size = Vector2(outer_width + 1, screen_height)
	$Outer/OuterRight.rect_size = Vector2(outer_width + 1, screen_height)
	$Outer/OuterRight.rect_position = Vector2(screen_width - outer_width - 1, 0)
	
	$Outer/OuterTop.rect_size = Vector2(screen_width, outer_height + 1)
	$Outer/OuterBottom.rect_size = Vector2(screen_width, outer_height + 1)
	$Outer/OuterBottom.rect_position = Vector2(0, screen_height - outer_height - 1)

func _update_ridge():
	_update_ridge_color()
	_update_ridge_sizing_and_position()

func _update_ridge_color():
	$Ridge.modulate = ridge_color

func _update_ridge_sizing_and_position():
	$Ridge.rect_size = Vector2(screen_width - (outer_width * 2), screen_height - (outer_height * 2))
	$Ridge.rect_position = Vector2(outer_width, outer_height)

func _update_inner():
	_update_inner_color()
	_update_inner_sizing_and_position()

func _update_inner_color():
	$Inner.modulate = inner_color

func _update_inner_sizing_and_position():
	$Inner.rect_size = Vector2(
		screen_width - (outer_width * 2) - (RIDGE_WIDTH * 2) + 2,
		screen_height - (outer_height * 2) - (RIDGE_WIDTH * 2) + 2
	)
	$Inner.rect_position = Vector2(outer_width + RIDGE_WIDTH - 1, outer_height + RIDGE_WIDTH - 1)

func _update_sizing_and_positions():
	_update_outer_border_sizing_and_position()
	_update_ridge_sizing_and_position()
	_update_inner_sizing_and_position()

func set_outer_color(value):
	outer_color = value
	_update_outer_border_color()

func set_ridge_color(value):
	ridge_color = value
	_update_ridge_color()

func set_inner_color(value):
	inner_color = value
	_update_inner_color()

func set_outer_width(value):
	outer_width = value
	_update_sizing_and_positions()

func set_outer_height(value):
	outer_height = value
	_update_sizing_and_positions()

func set_screen_width(value):
	screen_width = value
	_update_sizing_and_positions()

func set_screen_height(value):
	screen_height = value
	_update_sizing_and_positions()
