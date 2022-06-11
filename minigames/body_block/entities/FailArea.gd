extends Area2D

signal loss

func _on_FailArea_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	emit_signal("loss")
