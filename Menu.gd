extends Control

	
func Menu():
	pass # Replace with function body.


func _on_visibility_changed():
	$CanvasLayer.show()

func _Menu():
	get_tree().change_scene_to_file("res://Menu.tscn")
