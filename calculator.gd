extends Control

#===============================ONREADY
@onready var display: Label = $PanelContainer/MarginContainer/VBoxContainer/DisplayPanel/Display
@onready var button_grid: GridContainer = $PanelContainer/MarginContainer/VBoxContainer/ButtonGrid


#===============================VAR
var first_operand: float = 0.0
var current_operation: String = ""
var start_new_number: bool = false
#===============================HELPER
func append_digit(digit: String) -> void:
	if start_new_number or display.text == "0" or display.text == "Error":
		display.text = digit
		start_new_number = false
	else:
		display.text += digit

func select_operation(operation: String) -> void:
	first_operand = display.text.to_float()
	current_operation = operation
	display.text = "0"

func format_number(value: float) -> String:
	if is_equal_approx(value, round(value)):
		return str(int(value))

	return str(value)
#===============================OTHER
func _unhandled_key_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.echo:
		var typed_character: String = char(event.unicode)

		if typed_character.length() == 1 and typed_character.is_valid_int():
			append_digit(typed_character)
			return

		if typed_character == ".":
			_on_decimal_button_pressed()
			return
		elif typed_character.to_lower() == "c":
			_on_clear_button_pressed()
			return

		if event.keycode == KEY_ENTER or event.keycode == KEY_KP_ENTER or typed_character == "=":
			_on_equals_button_pressed()
			return

		match typed_character:
			"+":
				select_operation("+")
			"-":
				select_operation("-")
			"*":
				select_operation("*")
			"/":
				select_operation("/")
#===============================SIGNAL
func _on_clear_button_pressed() -> void:
	display.text = "0"
	first_operand = 0.0
	current_operation = ""
	start_new_number = false


func _on_sign_button_pressed() -> void:
	if display.text.begins_with("-"):
		display.text = display.text.trim_prefix("-")
	elif display.text != "0":
		display.text = "-" + display.text


func _on_percent_button_pressed() -> void:
	var percentage: float = display.text.to_float() / 100.0
	display.text = format_number(percentage)


func _on_divide_button_pressed() -> void:
	select_operation("/")


func _on_button_7_pressed() -> void:
	append_digit("7")


func _on_button_8_pressed() -> void:
	append_digit("8")


func _on_button_9_pressed() -> void:
	append_digit("9")


func _on_multiply_button_pressed() -> void:
	select_operation("*")


func _on_button_4_pressed() -> void:
	append_digit("4")


func _on_button_5_pressed() -> void:
	append_digit("5")


func _on_button_6_pressed() -> void:
	append_digit("6")


func _on_subtract_button_pressed() -> void:
	select_operation("-")


func _on_button_1_pressed() -> void:
	append_digit("1")


func _on_button_2_pressed() -> void:
	append_digit("2")


func _on_button_3_pressed() -> void:
	append_digit("3")


func _on_add_button_pressed() -> void:
	select_operation("+")


func _on_button_0_pressed() -> void:
	append_digit("0")


func _on_decimal_button_pressed() -> void:
	if start_new_number or display.text == "Error":
		display.text = "0."
		start_new_number = false
	elif display.text == "0":
		display.text = "0."
	elif "." not in display.text:
		append_digit(".")


func _on_equals_button_pressed() -> void:
	if current_operation.is_empty():
		return

	var second_operand: float = display.text.to_float()
	var result: float = 0.0

	match current_operation:
		"+":
			result = first_operand + second_operand
		"-":
			result = first_operand - second_operand
		"*":
			result = first_operand * second_operand
		"/":
			if is_zero_approx(second_operand):
				display.text = "Error"
				current_operation = ""
				return

			result = first_operand / second_operand
		_:
			return

	display.text = format_number(result)
	start_new_number = true
	current_operation = ""
