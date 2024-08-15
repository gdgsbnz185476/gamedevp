extends Control

#func _ready():
	#$CanvasLayer.hide()
	
func Door():
	pass # Replace with function body.


func _on_visibility_changed():
	$CanvasLayer.show()
	

func _replay():
	get_tree().change_scene_to_file("res://The begening.tscn")



func Menu():
	pass # Replace with function body.

func _on_button2_2_pressed():
	$CanvasLayer.show()

func _Menu():
	get_tree().change_scene_to_file("res://Menu.tscn")
	

func _level2():
	get_tree().change_scene_to_file("res://l2/level2.tscn")
