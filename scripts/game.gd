extends Node2D

var current_room: String = ""
var quiz_scene = preload("res://scenes/quiz.tscn")
var quiz_instance = null

func _ready() -> void:
	# Connect room area signals
	for child in get_children():
		if child is Area2D:
			child.body_entered.connect(_on_room_entered.bind(child.name))
			child.body_exited.connect(_on_room_exited.bind(child.name))

func _on_room_entered(body: Node, room_name: String) -> void:
	if body.name == "Player" and current_room != room_name:
		current_room = room_name
		_start_quiz(room_name)

func _on_room_exited(body: Node, room_name: String) -> void:
	if body.name == "Player":
		current_room = ""

func _start_quiz(room_name: String) -> void:
	if quiz_instance:
		return
	quiz_instance = quiz_scene.instantiate()
	add_child(quiz_instance)
	quiz_instance.setup(room_name, GameState.current_difficulty)
	quiz_instance.quiz_completed.connect(_on_quiz_completed)

func _on_quiz_completed(correct: bool) -> void:
	if correct:
		GameState.add_xp(50)
		GameState.streak += 1
		GameState.correct_answers += 1
	else:
		GameState.lose_hp(20)
		GameState.streak = 0
	GameState.questions_answered += 1
	GameState.save_state()
	quiz_instance.queue_free()
	quiz_instance = null
