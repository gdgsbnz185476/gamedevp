class_name Player
extends CharacterBody2D

@export var level_id : int
@export var level_start_pos : Node2D
@export var SPEED = 400.0
@export var JUMP_VELOCITY = -450.0
@export var DOUBLE_JUMP_VELOCITY = -550.0

var spawn_point
var double_jump = true
var coin = 0 
var total_coins = 0

@onready var coins_group = get_tree().get_nodes_in_group("coins")
@onready var global = get_node("/root/Global")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var can_control = true

func _ready():
	global.coin = 0
	global.lives = 3
	spawn_point = position
	for coin in coins_group:
		total_coins += 1

func _physics_process(delta):
	if not can_control: return
	
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
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.scale.x = direction
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _death(area):
	$reset_timer.start(0.10)

	if area.has_meta("spike"):
		if global.lives > 0:
			position = spawn_point
			global.lives -= 1
			can_control = false
			visible = false
		else:
			get_tree().reload_current_scene()

func _coin(area):
	if area.has_meta("coin"):
		global.coin += 1
		area.queue_free()
		print(global.coin)

func _win(area):
	if area.has_meta("door"):
		if total_coins == global.coin:
			show_win_screen()
func show_win_screen():
	get_tree().change_scene_to_file("res://win.tscn")
	
func _Menu(area):
	if area.has_meta("Menu"):
		
			show_Menu_screen()
func show_Menu_screen():
	get_tree().change_scene_to_file("res://Menu.tscn")

func handle_danger() -> void:
	print("Player Died!")
	visible = false
	can_control = false
	$reset_timer.start(0.10)

func reset_player():
	visible = true
	can_control = true

func _on_area_2d_6_body_entered(body):
	pass # Replace with function body.
