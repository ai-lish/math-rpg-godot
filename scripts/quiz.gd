extends Control

signal quiz_completed(correct: bool)

var current_question: Dictionary = {}
var room_topic: String = ""

func setup(room_name: String, difficulty: int) -> void:
	room_topic = _get_topic_for_room(room_name)
	current_question = Questions.get_random_question(room_topic, difficulty)
	_display_question()

func _get_topic_for_room(room_name: String) -> String:
	var topic_map = {
		"代數房": "代數", "幾何房": "幾何", "統計房": "統計",
		"概率房": "概率", "函數房": "函數", "方程房": "方程",
		"面積房": "面積", "坐標房": "坐標", "比率房": "比率",
		"數列房": "數列", "百分法房": "百分率", "近似房": "近似值"
	}
	return topic_map.get(room_name, "代數")

func _display_question() -> void:
	if current_question.is_empty():
		return
	$VBoxContainer/QuestionLabel.text = current_question.question
	var options = current_question.options
	$VBoxContainer/OptionA.text = "A) " + options.A
	$VBoxContainer/OptionB.text = "B) " + options.B
	$VBoxContainer/OptionC.text = "C) " + options.C
	$VBoxContainer/OptionD.text = "D) " + options.D

func _on_option_pressed(key: String) -> void:
	var correct = (key == current_question.answer)
	if correct:
		$VBoxContainer/Feedback.text = "✓ 正確!"
		$VBoxContainer/Feedback.add_theme_color_override("font_color", Color.GREEN)
	else:
		$VBoxContainer/Feedback.text = "✗ 錯誤! 正確答案: " + current_question.answer
		$VBoxContainer/Feedback.add_theme_color_override("font_color", Color.RED)
	# Disable all buttons
	for btn in [$VBoxContainer/OptionA, $VBoxContainer/OptionB, $VBoxContainer/OptionC, $VBoxContainer/OptionD]:
		btn.disabled = true
	# Auto close after 1.5s
	await get_tree().create_timer(1.5).timeout
	emit_signal("quiz_completed", correct)
