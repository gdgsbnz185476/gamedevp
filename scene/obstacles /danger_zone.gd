extends Area2D

#signal for body entring this area
func _on_body_entered(body):
	if body is Player:
		body.handle_danger()
		
