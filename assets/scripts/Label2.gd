extends Label

static var txt
var pressed = false
# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("debug"):
		if(pressed == true):
			visible = false
			pressed = false
		else:
			text = txt
			visible = true
			pressed = true
	pass
