extends Control

	
func Menu():
	pass # Replace with function body.

func _on_button2_2_pressed():
	$CanvasLayer.show()

func _Menu():
	get_tree().change_scene_to_file("res://Menu.tscn")

func _on_button__pressed():
	pass # Replace with function body.
	

func _on_button_2_pressed():
	$CanvasLayer.show()
	
func _win():
	get_tree().change_scene_to_file("res://win.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://win.tscn")



func _on_Level_pressed():
	get_tree().change_scene_to_file("res://level menu.tscn")
