extends CharacterBody3D

@onready var milk = $milk
var startTime

func _ready():
	startTime = Time.get_ticks_msec()

func _process(delta):
	var elapsedTime = (Time.get_ticks_msec() - startTime) / 1000.0
	var single = ping_pong(elapsedTime, 0, 1)
	var vector3 = Vector3(1, 1, single)
	milk.rotate(vector3.normalized(), 0.009)

func ping_pong(x, minx, maxx):
	# FIXME: this assumes maxx >= minx
	var d = maxx - minx
	var dx = x - minx
	return minx + abs(wrapf(dx, -d, d))

func wrapf(value, min, max):
	return fmod(max - min, value - min) + min
