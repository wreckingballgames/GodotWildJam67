using Godot;
using System;
using System.Collections.Generic;

public abstract partial class OverworldActorController : Node
{
    [Signal]
    public delegate void CommandDispatchedEventHandler(Command command);

    protected List<Command> Commands {get; set;}

    /// <summary>
    /// Handle input to determine which commands to dispatch.
    /// </summary>
    protected virtual void HandleInput()
    {
        // Pseudocode
        // Read input source for next input
        // Process input (is it valid? does it cause a return or does it compound?)
        // Add command to list of commands accordingly
        // Return
    }

    /// <summary>
    /// Emit a signal with the command to dispatch, ideally received by the
    /// actor this controller is controlling. To be used in DispatchCommandSequence().
    /// </summary>
    protected virtual void DispatchCommand()
    {
    }

    /// <summary>
    /// Dispatch any number of commands in sequence.
    /// </summary>
    protected virtual void DispatchCommandSequence()
    {
    }
}
