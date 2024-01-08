extends State
class_name ST_PassThru

@export var animation := ""
@onready var anim = %AnimationPlayer

signal transition_done
func enter(previous_state = "", _msg: Dictionary = {}):
	if animation.is_empty(): return
	anim.play(animation)
	await anim.animation_finished
	if not active or not "to" in _msg: return
	transition(_msg.to, _msg)
	transition_done.emit()
	
