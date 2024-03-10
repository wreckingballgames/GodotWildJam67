using Godot;
using System;
using System.Collections.Generic;
using System.Linq;

public partial class OverworldActorController : Node
{
    [Signal]
    public delegate void CommandDispatchedEventHandler(Command command);

    protected List<Command> Commands {get; set;} = new();

    public override void _Process(double _delta)
    {
        DispatchCommandSequence();
    }

    /// <summary>
    /// Handle input to determine which commands to dispatch.
    /// </summary>
    protected virtual void HandleInput()
    {
    }

    /// <summary>
    /// Emit a signal with the command to dispatch, ideally received by the
    /// actor this controller is controlling. To be used in DispatchCommandSequence().
    /// </summary>
    protected virtual void DispatchCommand(Command command)
    {
        EmitSignal(SignalName.CommandDispatched, command);
    }

    /// <summary>
    /// Dispatch any number of commands in sequence.
    /// </summary>
    protected virtual void DispatchCommandSequence()
    {
        if (!Commands.Any())
        {
            return;
        }

        foreach (Command command in Commands)
        {
            DispatchCommand(command);
        }

        Commands.Clear();
    }
}
