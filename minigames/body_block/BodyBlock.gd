extends Node

signal game_win
signal game_loss

enum State {STATE_PLAYING, STATE_WIN, STATE_LOSS}

var game_state = State.STATE_PLAYING

func _on_loss():
	game_state = State.STATE_LOSS
	emit_signal("game_loss")

func _on_win():
	game_state = State.STATE_WIN
	emit_signal("game_win")
