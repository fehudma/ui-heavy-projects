extends Control

#===============================ONREADY
@onready var display: Label = $PanelContainer/MarginContainer/VBoxContainer/Display
@onready var button_grid: GridContainer = $PanelContainer/MarginContainer/VBoxContainer/ButtonGrid

#===============================HELPER
func append_digit(digit: String) -> void:
	if display.text == "0":
		display.text = digit
	else:
		display.text += digit

#===============================SIGNAL
func _on_clear_button_pressed() -> void:
	display.text = "0"


func _on_sign_button_pressed() -> void:
	pass # Replace with function body.


func _on_percent_button_pressed() -> void:
	pass


func _on_divide_button_pressed() -> void:
	pass


func _on_button_7_pressed() -> void:
	append_digit("7")


func _on_button_8_pressed() -> void:
	append_digit("8")


func _on_button_9_pressed() -> void:
	append_digit("9")


func _on_multiply_button_pressed() -> void:
	pass


func _on_button_4_pressed() -> void:
	append_digit("4")


func _on_button_5_pressed() -> void:
	append_digit("5")


func _on_button_6_pressed() -> void:
	append_digit("6")


func _on_subtract_button_pressed() -> void:
	pass


func _on_button_1_pressed() -> void:
	append_digit("1")


func _on_button_2_pressed() -> void:
	append_digit("2")


func _on_button_3_pressed() -> void:
	append_digit("3")


func _on_add_button_pressed() -> void:
	pass


func _on_button_0_pressed() -> void:
	append_digit("0")


func _on_decimal_button_pressed() -> void:
	if display.text == "0":
		display.text = "0."
	elif "." not in display.text:
		append_digit(".")


func _on_equals_button_pressed() -> void:
	pass
