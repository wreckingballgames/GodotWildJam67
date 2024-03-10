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

    public override void _Process(double delta)
    {
        EnforceScreenBounds();
    }

    protected virtual void OnCommandReceived(Command command)
    {
        HandleMovement(command);
    }

    /// <summary>
    /// Use command received from controller to apply movement to actor.
    /// </summary>
    /// <param name="command"></param>
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

    /// <summary>
    /// Constrain actor within screen boundaries.
    /// </summary>
    protected void EnforceScreenBounds()
    {
        Rect2 viewportRect = GetViewportRect();

        if (GlobalPosition.X < viewportRect.Position.X)
        {
            GlobalPosition = GlobalPosition with { X = viewportRect.Position.X };
        }
        else if (GlobalPosition.X > viewportRect.Size.X)
        {
            GlobalPosition = GlobalPosition with { X = viewportRect.Size.X };
        }

        if (GlobalPosition.Y < viewportRect.Position.Y)
        {
            GlobalPosition = GlobalPosition with { Y = viewportRect.Position.Y };
        }
        else if (GlobalPosition.Y > viewportRect.Size.Y)
        {
            GlobalPosition = GlobalPosition with { Y = viewportRect.Size.Y };
        }
    }
}
