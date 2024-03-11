extends Node


func _ready():
    for trigger_zone: TriggerZone in get_tree().get_nodes_in_group("trigger_zone"):
        if (trigger_zone.is_connected("event_triggered", _on_event_triggered)):
            continue
        trigger_zone.event_triggered.connect(_on_event_triggered)


func _on_event_triggered(trigger_zone: TriggerZone) -> void:
    print("trigger me timbers")
