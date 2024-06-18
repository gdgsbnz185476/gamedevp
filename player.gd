extends CharacterBody2D

@export var SPEED = 400.0
@export var JUMP_VELOCITY = -450.0
@export var DOUBLE_JUMP_VELOCITY = -550.0


var double_jump = true
var coin = 0
var total_coins = 0

@onready var coins_group = get_tree().get_nodes_in_group("coins")

@onready var global = get_node("/root/Global")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready():
	global.coin = 0
	global.lives = 3
	@warning_ignore("shadowed_variable", "shadowed_variable", "shadowed_variable", "shadowed_variable", "shadowed_variable", "shadowed_variable", "shadowed_variable", "shadowed_variable", "shadowed_variable", "shadowed_variable", "shadowed_variable", "shadowed_variable", "shadowed_variable", "shadowed_variable", "shadowed_variable", "shadowed_variable", "shadowed_variable", "shadowed_variable", "shadowed_variable", "shadowed_variable", "shadowed_variable", "shadowed_variable", "shadowed_variable", "shadowed_variable", "shadowed_variable", "shadowed_variable", "shadowed_variable")
	for coin in coins_group:
		total_coins += 1


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	elif Input.is_action_just_pressed("ui_accept") and double_jump:
		velocity.y = DOUBLE_JUMP_VELOCITY
		double_jump = false
		
	if is_on_floor() and not double_jump:
		double_jump = true

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions ok.
	
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _death(area):
	if area.has_meta("spike"):
		if global.lives > 0:
			position = Vector2(560, 337)
			global.lives -= 1
		else:
			get_tree().reload_current_scene()
		

func _coin(area):
	if area.has_meta("coin"):
		global.coin += 1
		print(global.coin)
		
		
func _win(area):
	if area.has_meta("door"):
		if total_coins == global.coin:
			get_tree().change_scene_to_file("res://win.tscn")
