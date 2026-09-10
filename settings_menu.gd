extends TabContainer

@onready var master_value_label: Label = $Audio/AudioGrid/MasterValueLabel
@onready var music_value_label: Label = $Audio/AudioGrid/MusicValueLabel
@onready var sfx_value_label: Label = $Audio/AudioGrid/SFXValueLabel

func _format_percentage(value: float) -> String:
	return str(int(value)) + "%"

func _on_master_slider_value_changed(value: float) -> void:
	master_value_label.text = _format_percentage(value)

func _on_music_slider_value_changed(value: float) -> void:
	music_value_label.text = _format_percentage(value)

func _on_sfx_slider_value_changed(value: float) -> void:
	sfx_value_label.text = _format_percentage(value)
