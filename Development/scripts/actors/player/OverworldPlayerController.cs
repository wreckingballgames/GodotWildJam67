using Godot;
using System;

public partial class OverworldPlayerController : OverworldActorController
{
    public override void _UnhandledInput(InputEvent @event)
    {
        HandleInput();
    }

    public override void _Process(double _delta)
    {
        base._Process(_delta);
    }

    protected override void HandleInput()
    {
        // Handle horizontal movement
        if (Input.IsActionJustPressed("move_left"))
        {
            Commands.Add(new(CommandType.MoveLeft));
        }
        else if (Input.IsActionJustPressed("move_right"))
        {
            Commands.Add(new(CommandType.MoveRight));
        }
        
        // Handle vertical movement
        if (Input.IsActionJustPressed("move_up"))
        {
            Commands.Add(new(CommandType.MoveUp));
        }
        else if (Input.IsActionJustPressed("move_down"))
        {
            Commands.Add(new(CommandType.MoveDown));
        }

        // Handle interaction
        if (Input.IsActionJustPressed("interact"))
        {
            Commands.Add(new(CommandType.Interact));
        }
    }
}
