class_name TriggerZone
extends Area2D


signal event_triggered(event_id: GlobalData.EventID)

@export var event_id: GlobalData.EventID


func _ready() -> void:
    area_entered.connect(_on_trigger_zone_area_entered)


func _on_trigger_zone_area_entered(area: Node2D) -> void:
    event_triggered.emit(event_id)
