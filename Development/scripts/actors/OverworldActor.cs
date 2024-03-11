using Godot;
using System;

public partial class OverworldActor : Node2D
{
    [Export]
    protected OverworldActorController Controller {get; set;}

    private Vector2 LastPosition {get; set;}
    protected Area2D ObstacleCollider {get; set;}
    protected Area2D TriggerCollider {get; set;}
    protected Area2D HazardCollider {get; set;}

    public override void _Ready()
    {
        // Get references to children
        ObstacleCollider = GetNode<Area2D>("%ObstacleCollider");
        TriggerCollider = GetNode<Area2D>("%TriggerCollider");
        HazardCollider = GetNode<Area2D>("%HazardCollider");

        // Connect signals
        ObstacleCollider.BodyEntered += (Node2D body) => HandleObstacleCollision(body);
        TriggerCollider.BodyEntered += (Node2D body) => HandleTriggerCollision(body);
        HazardCollider.BodyEntered += (Node2D body) => HandleHazardCollision(body);
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

        // Store LastPosition for use elsewhere, update GlobalPosition
        LastPosition = GlobalPosition;
        GlobalPosition = newGlobalPosition;
    }

    private void HandleObstacleCollision(Node2D body)
    {
        GlobalPosition = LastPosition;
    }

    protected virtual void HandleTriggerCollision(Node2D body)
    {
    }

    protected virtual void HandleHazardCollision(Node2D body)
    {
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
        else if (GlobalPosition.X >= viewportRect.Size.X)
        {
            GlobalPosition = GlobalPosition with { X = viewportRect.Size.X - GameConstants.CHARACTER_WIDTH };
        }

        if (GlobalPosition.Y < viewportRect.Position.Y)
        {
            GlobalPosition = GlobalPosition with { Y = viewportRect.Position.Y };
        }
        else if (GlobalPosition.Y >= viewportRect.Size.Y - GameConstants.CHARACTER_HEIGHT)
        {
            GlobalPosition = GlobalPosition with { Y = viewportRect.Size.Y - GameConstants.CHARACTER_HEIGHT };
        }
    }
}
