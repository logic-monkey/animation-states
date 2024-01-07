extends State
class_name ST_move

@export var animation_name:= "walk"
@export var speed_modes : Array[String]
@export var intro:= ""

@onready var anim = %AnimationPlayer


func enter(previous_state = "", _msg: Dictionary = {}):
	if previous_state==name: return

	if speed_modes and previous_state in speed_modes:
		var dist = anim.current_animation_position / anim.current_animation_length
		anim.play(animation_name)
		anim.advance(0)
		anim.seek(dist * anim.current_animation_length)
		return
	if not intro.is_empty():
		anim.play(intro)
		await anim.animation_finished
	if active: anim.play(animation_name)
	#print("active: %s" % active)

func proc(_delta):
	pass
	
func phys(_delta):
	pass

func exit():
	pass


