extends Node2D

var progress = 0
var maximum_frames = 0

signal win

# Called when the node enters the scene tree for the first time.
func _ready():
	maximum_frames = $BananaSprite.frames.get_frame_count("default")
	$AnimationPlayer.play("shake")

func _input(event):
	if event.is_action_pressed("action"):
		action()

func action():
	progress += 1
	
	$BananaSprite.frame = progress
	
	if progress == 4:
		$FirstEatingParticle.emitting = true
	elif progress == 5:
		$SecondEatingParticle.emitting = true

	if progress == maximum_frames:
		$AnimationPlayer.stop()
		emit_signal("win")
