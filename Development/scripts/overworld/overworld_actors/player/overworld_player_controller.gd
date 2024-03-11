class_name OverworldPlayerController
extends OverworldActorController


func _physics_process(delta: float) -> void:
    handle_movement_input()
    handle_interact_input()
    
    super._physics_process(delta)


func handle_movement_input() -> void:
    # TODO: Make this better and more loosely coupled
    var new_command := MoveCommand.new()
    if Input.is_action_just_pressed("move_left"):
        new_command.direction = Vector2.LEFT
    elif Input.is_action_just_pressed("move_right"):
        new_command.direction = Vector2.RIGHT
    elif Input.is_action_just_pressed("move_up"):
        new_command.direction = Vector2.UP
    elif Input.is_action_just_pressed("move_down"):
        new_command.direction = Vector2.DOWN
    else:
        return
    
    commands_list.append(new_command)


func handle_interact_input() -> void:
    if Input.is_action_just_pressed("interact"):
        var new_command := InteractCommand.new()
        commands_list.append(new_command)
