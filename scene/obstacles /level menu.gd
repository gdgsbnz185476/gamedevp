extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://l2/level2.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scene/obstacles /levelmenu.tscn")


func _on_Thebegening_pressed():
	get_tree().change_scene_to_file("res://The begening.tscn")
