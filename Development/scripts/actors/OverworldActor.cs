using Godot;
using System;

public abstract partial class OverworldActor : Node2D
{
    [Export]
    protected OverworldActorController Controller {get; set;}
}
