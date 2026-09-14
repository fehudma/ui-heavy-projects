extends TabContainer

@onready var master_value_label: Label = $Audio/AudioGrid/MasterValueLabel
@onready var music_value_label: Label = $Audio/AudioGrid/MusicValueLabel
@onready var sfx_value_label: Label = $Audio/AudioGrid/SFXValueLabel
@onready var binding_group: ButtonGroup = \
	$Controls/BindingsGrid/InteractBindingButton.button_group

func _input(event: InputEvent) -> void:
	if not event is InputEventKey:
		return

	var key_event := event as InputEventKey

	if not key_event.pressed or key_event.echo:
		return

	var active_button := binding_group.get_pressed_button() as Button

	if active_button == null:
		return

	active_button.text = key_event.as_text_keycode()
	active_button.button_pressed = false
	get_viewport().set_input_as_handled()

func _format_percentage(value: float) -> String:
	return str(int(value)) + "%"

func _on_master_slider_value_changed(value: float) -> void:
	master_value_label.text = _format_percentage(value)

func _on_music_slider_value_changed(value: float) -> void:
	music_value_label.text = _format_percentage(value)

func _on_sfx_slider_value_changed(value: float) -> void:
	sfx_value_label.text = _format_percentage(value)
