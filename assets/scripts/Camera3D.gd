extends Camera3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var f = fov

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("zoom"):
		fov = fov - 50
	if Input.is_action_just_released("zoom"):
		fov = f
	pass
