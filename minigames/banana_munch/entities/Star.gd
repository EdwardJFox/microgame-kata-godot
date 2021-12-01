extends Sprite

export var animated = false

func _ready():
	if self.animated:
		$AnimationPlayer.play("Idle")
