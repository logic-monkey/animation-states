extends State
class_name ST_PassThru

@export var animation := ""
@onready var anim = %AnimationPlayer
@export var sound_effect : AudioStreamPlayer2D
@export var ancillary_sound_effects : Array[AudioStreamPlayer2D]

signal transition_done
func enter(previous_state = "", _msg: Dictionary = {}):
	if animation.is_empty(): return
	if sound_effect: 
		if sound_effect.playing: sound_effect.stop()
		sound_effect.play()
	anim.play(animation)
	if ancillary_sound_effects:
		for sound in ancillary_sound_effects:
			if sound.playing: sound.stop()
			sound.play()
	await anim.animation_finished
	if not active: 
		transition_done.emit()
		return
	if "to" in _msg: transition(_msg.to, _msg)
	transition_done.emit()
	
