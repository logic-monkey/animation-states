extends State
class_name ST_PlayLoop

@onready
var anim = %AnimationPlayer

@export
var animation:= "airborn"


func enter(previous_state = "", _msg: Dictionary = {}):
	anim.play(animation)
