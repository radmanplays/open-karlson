extends CharacterBody3D

@onready var barrel = $"."
@onready var collision = $CollisionShape3D
@onready var player = $"../player"
var explode = false
func _ready():
	pass

