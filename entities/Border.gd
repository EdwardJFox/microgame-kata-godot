tool

extends CanvasLayer

export var outer_color = Color("#4767a8")
export var ridge_color = Color("#ffffff")
export var inner_color = Color("#333333")
export var outer_width = 20
export var outer_height = 10
export var screen_width = 240
export var screen_height = 160

var RIDGE_WIDTH = 5


func _ready():
	_set_outer_border()
	_set_ridge()
	_set_inner()

func _set_outer_border():
	for border_piece in $Outer.get_children():
		border_piece = border_piece as ColorRect
		border_piece.color = outer_color
		
	$Outer/OuterLeft.rect_size = Vector2(outer_width + 1, screen_height)
	$Outer/OuterRight.rect_size = Vector2(outer_width + 1, screen_height)
	$Outer/OuterRight.rect_position = Vector2($Outer/OuterRight.rect_position.x - outer_width - 1, 0)
	
	$Outer/OuterTop.rect_size = Vector2(screen_width, outer_height + 1)
	$Outer/OuterBottom.rect_size = Vector2(screen_width, outer_height + 1)
	$Outer/OuterBottom.rect_position = Vector2(0, $Outer/OuterBottom.rect_position.y - outer_height - 1)

func _set_ridge():
	$Ridge.modulate = ridge_color
	$Ridge.rect_size = Vector2(screen_width - (outer_width * 2), screen_height - (outer_height * 2))
	$Ridge.rect_position = Vector2(outer_width, outer_height)

func _set_inner():
	$Inner.modulate = inner_color
	$Inner.rect_size = Vector2(
		screen_width - (outer_width * 2) - (RIDGE_WIDTH * 2) + 2,
		screen_height - (outer_height * 2) - (RIDGE_WIDTH * 2) + 2
	)
	$Inner.rect_position = Vector2(outer_width + RIDGE_WIDTH - 1, outer_height + RIDGE_WIDTH - 1)
