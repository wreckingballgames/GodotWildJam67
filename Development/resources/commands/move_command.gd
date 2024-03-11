class_name MoveCommand
extends Command


var direction: Vector2 = Vector2.RIGHT


func _ready() -> void:
    type = GlobalData.CommandType.Move
