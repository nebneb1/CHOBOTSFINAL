extends Spatial


const BULLET_MPS = 10.0
const BULLET_HEIGHT = 0.5

var travel_dist: int = 5
var targZ: float = float(travel_dist)
var targY: float = 0.0
onready var explode = preload("res://Scenes/particles.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	print("bullet spawn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if targZ-translation.z < 0:
		var inst = explode.instance()
		inst.translate(translation)
		$"../".add_child(inst)
		print("BOOM!")
		queue_free()
#		translation.z = targZ
#		translation.y = targY
		
	else:
		translation.z += BULLET_MPS*delta
#		translation.y = ((targZ-translation.z)/travel_dist)*BULLET_HEIGHT
	
#	print(translation.z)
	
func _input(event):
	if event.is_action_pressed("debug"):
		translation = Vector3(0,0.5,0)
