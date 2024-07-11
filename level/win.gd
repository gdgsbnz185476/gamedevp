extends Control

#func _ready():
	#$CanvasLayer.hide()
	
func Door():
	pass # Replace with function body.


func _on_visibility_changed():
	$CanvasLayer.show()

func _replay():
	get_tree().change_scene_to_file("res://level.tscn")
