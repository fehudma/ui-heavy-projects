extends Control

#======================================CONST
const QUESTION_DATA: Dictionary = {
	"question": "Which planet is known as the Red Planet?",
	"answers": ["Venus", "Mars", "Jupiter", "Mercury"],
	"correct": 1
}

#======================================VAR
var score: int = 0

#======================================ONREADY
@onready var question_label: Label = $MarginContainer/VBoxContainer/QuestionLabel

@onready var answer_buttons: Array[Button] = [
	$MarginContainer/VBoxContainer/AnswersContainer/AnswerButton1,
	$MarginContainer/VBoxContainer/AnswersContainer/AnswerButton2,
	$MarginContainer/VBoxContainer/AnswersContainer/AnswerButton3,
	$MarginContainer/VBoxContainer/AnswersContainer/AnswerButton4
]

@onready var score_label: Label = $MarginContainer/VBoxContainer/FooterContainer/ScoreLabel

#======================================HELPER
#
func display_question() -> void:
	var question_text: String = QUESTION_DATA["question"]
	var answers: Array = QUESTION_DATA["answers"]

	question_label.text = question_text

	for index: int in answer_buttons.size():
		answer_buttons[index].text = answers[index]

#
func update_score_display() -> void:
	score_label.text = "Score: %d" % score

#
func set_answer_buttons_disabled(is_disabled: bool) -> void:
	for button: Button in answer_buttons:
		button.disabled = is_disabled
#======================================READY
func _ready() -> void:
	display_question()

	for index: int in answer_buttons.size():
		answer_buttons[index].pressed.connect(
			_on_answer_pressed.bind(index)
		)



#======================================SIGNAL
func _on_answer_pressed(selected_index: int) -> void:
	set_answer_buttons_disabled(true)

	var correct_index: int = QUESTION_DATA["correct"]

	if selected_index == correct_index:
		score += 1
		update_score_display()
		print("Correct!")
	else:
		print("Incorrect!")
