extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	visible = true
	pass # Replace with function body.


func _on_button_2_pressed():
	visible = false
	pass # Replace with function body.


func _on_buttonmenu_pressed():
	get_tree().change_scene_to_file("res://assets/scenes/level 1.tscn")
	pass # Replace with function body.


func _on_button_2_menu_2_pressed():
	get_tree().change_scene_to_file("res://assets/scenes/node_3d.tscn")
	pass # Replace with function body.
