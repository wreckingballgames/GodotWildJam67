extends Node


var event_to_trigger: GlobalData.EventID = GlobalData.EventID.NO_EVENT


func _ready():
    for trigger_zone: TriggerZone in get_tree().get_nodes_in_group("trigger_zone"):
        if (trigger_zone.is_connected("event_triggered", _on_event_triggered)):
            continue
        trigger_zone.event_triggered.connect(_on_event_triggered)


func _process(delta: float) -> void:
    match event_to_trigger:
        GlobalData.EventID.NO_EVENT:
            pass
        GlobalData.EventID.TRANSITION_TO_FIELD:
            transition_to_scene("field")
        GlobalData.EventID.TRANSITION_TO_TOWN:
            transition_to_scene("town")
        GlobalData.EventID.TRANSITION_TO_FORT_FLOOR_1:
            transition_to_scene("fort_floor1")
        GlobalData.EventID.TRANSITION_TO_FORT_FLOOR_2:
            transition_to_scene("fort_floor2")
        GlobalData.EventID.BEGIN_ZAPLING_BATTLE:
            transition_to_scene("zapling_battle")
        GlobalData.EventID.BEGIN_BOSS_BATTLE:
            transition_to_scene("boss_battle")


func _on_event_triggered(event_id: GlobalData.EventID) -> void:
    event_to_trigger = event_id


func transition_to_scene(scene_name: String):
    get_tree().call_deferred("change_scene_to_file", GlobalData.ScenePaths[scene_name])
