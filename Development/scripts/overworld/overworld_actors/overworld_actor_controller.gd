class_name OverworldActorController
extends Node


signal command_dispatched(command: Command)

var commands_list: Array[Command]


func _physics_process(delta: float) -> void:
    dispatch_command_list()


func handle_input() -> void:
    pass


func dispatch_command(command: Command) -> void:
    command_dispatched.emit(command)


func dispatch_command_list():
    if commands_list.size() == 0:
        return
    
    for command: Command in commands_list:
        dispatch_command(command)
    
    commands_list.clear()
