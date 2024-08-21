extends Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_7_body_entered(body):
	pass # Replace with function body.


var coin = 0 
var total_coins = 0

@onready var coins_group = get_tree().get_nodes_in_group("coins")
@onready var global = get_node("/root/Global")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var can_control = true
