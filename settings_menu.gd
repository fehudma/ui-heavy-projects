extends TabContainer

@onready var master_value_label: Label = $Audio/AudioGrid/MasterValueLabel

func _on_master_slider_value_changed(value: float) -> void:
	master_value_label.text = str(int(value)) + "%"
