extends Control

func _ready():
	$CanvasLayer.hide()

func _replay():
	get_tree().change_scene_to_file("res://level.tscn")

func _on_visibility_changed():
	$CanvasLayer.show()
