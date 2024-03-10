using Godot;
using System;

public partial class OverworldActor : Node2D
{
    [Export]
    protected OverworldActorController Controller {get; set;}

    public override void _Ready()
    {
        Controller.CommandDispatched += (Command command) => OnCommandReceived(command);
    }

    protected virtual void OnCommandReceived(Command command)
    {
        HandleMovement(command);
    }

    protected void HandleMovement(Command command)
    {
        // TODO: Consider rewriting this class in GDScript as I believe this operation causes marshalling
        Vector2 newGlobalPosition = GlobalPosition;

        // Handle horizontal movement
        if (command.Type == CommandType.MoveLeft)
        {
            newGlobalPosition.X -= GameConstants.TILE_WIDTH;
        }
        else if (command.Type == CommandType.MoveRight)
        {
            newGlobalPosition.X += GameConstants.TILE_WIDTH;
        }

        // Handle vertical movement
        if (command.Type == CommandType.MoveUp)
        {
            newGlobalPosition.Y -= GameConstants.TILE_HEIGHT;
        }
        else if (command.Type == CommandType.MoveDown)
        {
            newGlobalPosition.Y += GameConstants.TILE_HEIGHT;
        }

        GlobalPosition = newGlobalPosition;
    }
}
