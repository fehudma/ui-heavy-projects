extends TabContainer

#=======================================CONST
const DEFAULT_VOLUME: float = 80.0
const DEFAULT_RESOLUTION_INDEX: int = 2
const DEFAULT_LANGUAGE_INDEX: int = 0

const DEFAULT_INTERACT_KEY: String = "E"
const DEFAULT_INVENTORY_KEY: String = "I"
const DEFAULT_PAUSE_KEY: String = "Escape"
#=======================================VAR

#=======================================ONREADY
@onready var master_value_label: Label = $Audio/AudioGrid/MasterValueLabel
@onready var music_value_label: Label = $Audio/AudioGrid/MusicValueLabel
@onready var sfx_value_label: Label = $Audio/AudioGrid/SFXValueLabel
@onready var binding_group: ButtonGroup = \
	$Controls/BindingsGrid/InteractBindingButton.button_group

@onready var master_slider: HSlider = $Audio/AudioGrid/MasterSlider
@onready var music_slider: HSlider = $Audio/AudioGrid/MusicSlider
@onready var sfx_slider: HSlider = $Audio/AudioGrid/SFXSlider

@onready var fullscreen_toggle: CheckButton = \
	$Video/VideoGrid/FullscreenToggle
@onready var resolution_dropdown: OptionButton = \
	$Video/VideoGrid/ResolutionDropdown
@onready var language_dropdown: OptionButton = \
	$General/GeneralGrid/LanguageDropdown

@onready var interact_binding_button: Button = \
	$Controls/BindingsGrid/InteractBindingButton
@onready var inventory_binding_button: Button = \
	$Controls/BindingsGrid/InventoryBindingButton
@onready var pause_binding_button: Button = \
	$Controls/BindingsGrid/PauseBindingButton
#=======================================???
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

func _on_reset_button_pressed() -> void:
	master_slider.value = DEFAULT_VOLUME
	music_slider.value = DEFAULT_VOLUME
	sfx_slider.value = DEFAULT_VOLUME

	fullscreen_toggle.button_pressed = false
	resolution_dropdown.select(DEFAULT_RESOLUTION_INDEX)
	language_dropdown.select(DEFAULT_LANGUAGE_INDEX)

	interact_binding_button.text = DEFAULT_INTERACT_KEY
	inventory_binding_button.text = DEFAULT_INVENTORY_KEY
	pause_binding_button.text = DEFAULT_PAUSE_KEY

	var active_button := binding_group.get_pressed_button()

	if active_button != null:
		active_button.button_pressed = false
