extends State
class_name ST_move

@export var animation_name:= "walk"
@export var speed_modes : Array[String]
@export var intro:= ""

@onready var anim = %AnimationPlayer

@export var move_speed_multiplier : float = 1
@export var maximum_animation_speed : float = 3.0
@export var minimum_animation_speed : float = 0.25

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
	if "move_speed" in owner and owner.move_speed > 0:
		var speed = clampf(owner.move_speed * move_speed_multiplier, \
				minimum_animation_speed, maximum_animation_speed)
		anim.speed_scale = speed
	
func phys(_delta):
	pass

func exit(_next_state:String=""):
	anim.speed_scale=1


