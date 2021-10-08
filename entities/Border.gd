extends CanvasLayer

export var outer_color = Color("#4767a8")
export var ridge_color = Color("#ffffff")
export var inner_color = Color("#000000")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Outer.modulate = outer_color
	$Ridge.modulate = ridge_color
	$Inner.modulate = inner_color
