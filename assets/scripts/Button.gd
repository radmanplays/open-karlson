extends Button


static var jump = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if(InputEventScreenTouch.NOTIFICATION_POSTINITIALIZE):
		visible = true
	else:
		visible = false
	pass # Replace with function body.
	
func setjump(value):
	jump = value


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (pressed&&name=="button"): 
		setjump(true)
	if(name=="button"):
		setjump(false)
	
	pass
