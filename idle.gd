extends State
class_name ST_idle

@onready var anim = %AnimationPlayer

func enter(previous_state = "", _msg: Dictionary = {}):
	if previous_state==name: return
	pick_idle()
	if attached: return
	anim.animation_finished.connect(_on_anim_finished)
	attached = true

func proc(_delta):
	pass
	
func phys(_delta):
	pass

func exit():
	pass

@export var idles = ["idle"]

func pick_idle():
	if idles.size() == 1:
		anim.play(idles[0])
		return
	var success := false
	for i in idles.size():
		if randi() % 4 == 0: continue
		success = true
		anim.play(idles[i])
		break
	if not success: anim.play(idles[0])
	
var attached = false
func _on_anim_finished(animation):
	if active: pick_idle()
