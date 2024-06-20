extends Area2D

# Called when the node enters the scene tree for the first time.

# Function to handle when a body enters the spike area
func _on_body_entered(body):
	if body.is_in_group("player"):
		body.kill() # Assuming the player has a 'kill' method to handle death
