extends Node2D

var _capitals = [
	{ "character": "A", "width": 14 },
	{ "character": "B", "width": 14 },
	{ "character": "C", "width": 14 },
	{ "character": "D", "width": 13 },
	{ "character": "E", "width": 14 },
	{ "character": "F", "width": 13 },
	{ "character": "G", "width": 14 },
	{ "character": "H", "width": 14 },
	{ "character": "I", "width": 12 },
	{ "character": "J", "width": 14 },
	{ "character": "K", "width": 13 },
	{ "character": "L", "width": 13 },
	{ "character": "M", "width": 16 },
	{ "character": "N", "width": 14 },
	{ "character": "O", "width": 14 },
	{ "character": "P", "width": 14 },
	{ "character": "Q", "width": 14 },
	{ "character": "R", "width": 13 },
	{ "character": "S", "width": 13 },
	{ "character": "T", "width": 14 },
	{ "character": "U", "width": 13 },
	{ "character": "V", "width": 14 },
	{ "character": "W", "width": 15 },
	{ "character": "X", "width": 15 },
	{ "character": "Y", "width": 14 },
	{ "character": "Z", "width": 14 },
]

var _lowercase = [
	{ "character": "a", "width": 8, "y_offset": 0 },
	{ "character": "b", "width": 8, "y_offset": 0 },
	{ "character": "c", "width": 8, "y_offset": 0 },
	{ "character": "d", "width": 8, "y_offset": 0 },
	{ "character": "e", "width": 8, "y_offset": 0 },
	{ "character": "f", "width": 8, "y_offset": 0 },
	{ "character": "g", "width": 8, "y_offset": 3 },
	{ "character": "h", "width": 8, "y_offset": 0 },
	{ "character": "i", "width": 4, "y_offset": 0 },
	{ "character": "j", "width": 7, "y_offset": 0 },
	{ "character": "k", "width": 8, "y_offset": 0 },
	{ "character": "l", "width": 5, "y_offset": 0 },
	{ "character": "m", "width": 8, "y_offset": 0 },
	{ "character": "n", "width": 8, "y_offset": 0 },
	{ "character": "o", "width": 8, "y_offset": 0 },
	{ "character": "p", "width": 8, "y_offset": 3 },
	{ "character": "q", "width": 8, "y_offset": 3 },
	{ "character": "r", "width": 8, "y_offset": 0 },
	{ "character": "s", "width": 8, "y_offset": 0 },
	{ "character": "t", "width": 8, "y_offset": 0 },
	{ "character": "u", "width": 8, "y_offset": 0 },
	{ "character": "v", "width": 8, "y_offset": 0 },
	{ "character": "w", "width": 8, "y_offset": 0 },
	{ "character": "x", "width": 8, "y_offset": 0 },
	{ "character": "y", "width": 8, "y_offset": 3 },
	{ "character": "z", "width": 8, "y_offset": 0 },
]

var _numbers = [
	{ "character": "0", "width": 14 },
	{ "character": "1", "width": 12 },
	{ "character": "2", "width": 13 },
	{ "character": "3", "width": 13 },
	{ "character": "4", "width": 13 },
	{ "character": "5", "width": 13 },
	{ "character": "6", "width": 13 },
	{ "character": "7", "width": 13 },
	{ "character": "8", "width": 13 },
	{ "character": "9", "width": 13 },
]

var _punctuation = [
	{ "character": ",", "width": 4, "y_offset": 1 },
	{ "character": ".", "width": 4, "y_offset": 0 },
	{ "character": ":", "width": 4, "y_offset": 0 },
	{ "character": ";", "width": 4, "y_offset": 2 },
	{ "character": "?", "width": 12, "y_offset": 0 },
	{ "character": "!", "width": 8, "y_offset": 0 },
	{ "character": " ", "width": 8, "y_offset": 0 },
]

var font = null

func _get_font():
	if not font is BitmapFont:
		font = BitmapFont.new()
		font.height = 16
		var texture = load("res://assets/art/font_sheet.png")
		
		font.add_texture(texture)

		for i in range (0, _capitals.size()):
			font.add_char(_capitals[i].character.ord_at(0), 0, Rect2(16 * i, 0, 16, 16), Vector2(0, 0), _capitals[i].width)

		for i in range (0, _lowercase.size()):
			font.add_char(_lowercase[i].character.ord_at(0), 0, Rect2(16 * i, 16, 16, 16), Vector2(0, _lowercase[i].y_offset), _lowercase[i].width)
			
		for i in range (0, _numbers.size()):
			font.add_char(_numbers[i].character.ord_at(0), 0, Rect2(16 * i, 32, 16, 16), Vector2(0, 0), _numbers[i].width)

		for i in range (0, _punctuation.size()):
			font.add_char(_punctuation[i].character.ord_at(0), 0, Rect2(16 * i, 48, 16, 16), Vector2(0, _punctuation[i].y_offset), _punctuation[i].width)

	return font

func _ready():
	self._get_font()
