extends Node

enum State {STATE_PLAYING, STATE_WIN, STATE_LOSS}

var game_state = State.STATE_PLAYING

func _ready():
	$Hand.start(Vector2(93, 152))
	
func _on_loss():
	game_state = State.STATE_LOSS

func _on_win():
	game_state = State.STATE_WIN
