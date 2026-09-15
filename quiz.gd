extends Control

#======================================CONST
const QUESTION_DATA: Dictionary = {
	"question": "Which planet is known as the Red Planet?",
	"answers": ["Venus", "Mars", "Jupiter", "Mercury"],
	"correct": 1
}

#======================================ONREADY
@onready var question_label: Label = $MarginContainer/VBoxContainer/QuestionLabel

@onready var answer_buttons: Array[Button] = [
	$MarginContainer/VBoxContainer/AnswersContainer/AnswerButton1,
	$MarginContainer/VBoxContainer/AnswersContainer/AnswerButton2,
	$MarginContainer/VBoxContainer/AnswersContainer/AnswerButton3,
	$MarginContainer/VBoxContainer/AnswersContainer/AnswerButton4
]
#======================================HELPER
func display_question() -> void:
	var question_text: String = QUESTION_DATA["question"]
	var answers: Array = QUESTION_DATA["answers"]

	question_label.text = question_text

	for index: int in answer_buttons.size():
		answer_buttons[index].text = answers[index]

#======================================READY
func _ready() -> void:
	display_question()



#======================================SIGNAL
