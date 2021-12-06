extends CanvasLayer

export var text = "Example Text"

func _ready():
	$Text.add_font_override("font", MinigameFont.font)
	$Text.text = text
