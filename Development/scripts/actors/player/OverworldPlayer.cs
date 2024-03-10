using Godot;
using System;

public partial class OverworldPlayer : OverworldActor
{
    public override void _Ready()
    {
        base._Ready();
    }

    public override void _Process(double _delta)
    {
        base._Process(_delta);
    }

    protected override void OnCommandReceived(Command command)
    {
        base.OnCommandReceived(command);
    }
}
