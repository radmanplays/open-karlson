extends Label
const player = preload("res://assets/scripts/player.gd")

var pressed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (player.issneaking() == true):
		text = "sneaking"
	else:
		text = "not sneaking"
	
	if Input.is_action_just_pressed("debug"):
		if(pressed == true):
			visible = false
			pressed = false
		else:
			visible = true
			pressed = true
	pass
