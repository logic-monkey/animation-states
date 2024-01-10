extends State
class_name ST_PassThru

@export var animation := ""
@onready var anim = %AnimationPlayer
@export var sound_effect : AudioStreamPlayer2D

signal transition_done
func enter(previous_state = "", _msg: Dictionary = {}):
	if animation.is_empty(): return
	if sound_effect: sound_effect.play()
	anim.play(animation)
	await anim.animation_finished
	if not active: 
		transition_done.emit()
		return
	transition(_msg.to, _msg)
	transition_done.emit()
	
