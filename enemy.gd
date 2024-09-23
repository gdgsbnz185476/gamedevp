extends CharacterBody2D  # Use CharacterBody2D if you're using Godot 4.x

# Variables to control movement
var speed = 100
var direction = Vector2(1, 0)  # Moves horizontally, change to Vector2(0, 1) for vertical movement
var movement_range = 300  # How far the enemy moves before turning around
var distance_traveled = 0

func _physics_process(delta):
	# Move the enemy by a small step in the current direction
	var velocity = direction * speed * delta
	distance_traveled += velocity.length()

	# Turn the enemy around if it moves too far
	if distance_traveled > movement_range:
		direction *= -1  # Reverse the direction
		distance_traveled = 0  # Reset distance traveled

	# Move and slide the enemy
	#move_and_slide(velocity)
