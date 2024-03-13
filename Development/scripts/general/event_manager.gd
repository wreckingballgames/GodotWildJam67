extends Node


var event_to_trigger: GlobalData.EventID = GlobalData.EventID.NoEvent


func _ready():
    for trigger_zone: TriggerZone in get_tree().get_nodes_in_group("trigger_zone"):
        if (trigger_zone.is_connected("event_triggered", _on_event_triggered)):
            continue
        trigger_zone.event_triggered.connect(_on_event_triggered)


func _process(delta: float) -> void:
    match event_to_trigger:
        GlobalData.EventID.NoEvent:
            pass
        GlobalData.EventID.TransitionToField:
            transition_to_scene("field")
        GlobalData.EventID.TransitionToTown:
            transition_to_scene("town")
        GlobalData.EventID.TransitionToFortFloor1:
            transition_to_scene("fort_floor1")


func _on_event_triggered(event_id: GlobalData.EventID) -> void:
    event_to_trigger = event_id


func transition_to_scene(scene_path: String):
    get_tree().call_deferred("change_scene_to_file", GlobalData.ScenePaths[scene_path])
