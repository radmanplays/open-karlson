extends CharacterBody3D
const button = preload("res://assets/scripts/Button.gd")
const label = preload("res://assets/scripts/Label2.gd")
const shakycamera = preload("res://addons/shaky_camera_3d/internal/scripts/shaky_camera_3d.gd")



var SPEED = 3.5
static var JUMP_VELOCITY = 4.5
const SENSITIVITY = 0.004
var s = scale.y
static var sneaking = false


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 9.8

@onready var head = $Node3D
@onready var camera = $Node3D/ShakyCamera3D


static func issneaking():
	return sneaking
	
func setsneaking(sneak):
	if (sneak == true):
		scale.y = scale.y - 0.14
		SPEED = SPEED - 1.5
		sneaking = true
	if (sneak == false):
		scale.y = s
		SPEED = 3.0
		sneaking = false

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * SENSITIVITY)
		camera.rotate_x(-event.relative.y * SENSITIVITY)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-40), deg_to_rad(60))

	if event is InputEventScreenTouch:
		head.rotate_y(-event.relative.x * SENSITIVITY)
		camera.rotate_x(-event.relative.y * SENSITIVITY)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-40), deg_to_rad(60))

func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if (Input.is_action_just_pressed("jump") and is_on_floor()):
		velocity.y = JUMP_VELOCITY
	
	if (button.jump == true and is_on_floor()):
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("sneak") :
		if (issneaking() == false):
			setsneaking(true)
	
	if Input.is_action_just_released("sneak"):
		if(issneaking() == true):
			setsneaking(false)
	
	
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	label.txt = " X: "+str(global_transform.origin.x)+" Y: "+str(global_transform.origin.y)+" Z: "+str(global_transform.origin.z)
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = 0.0
		velocity.z = 0.0

	move_and_slide()
