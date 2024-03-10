using Godot;
using System;

public partial class Command : RefCounted
{
    public CommandType Type {get;}

    public Command(CommandType type)
    {
        Type = type;
    }
}
