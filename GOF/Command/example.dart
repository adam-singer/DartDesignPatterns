
/// The 'Command' abstract class
abstract class Command
{
    Receiver receiver;

    // Constructor
    Command(Receiver _receiver)
    {
        this.receiver = _receiver;
    }

    abstract void Execute();
}


/// The 'ConcreteCommand' class
class ConcreteCommand extends Command
{
    // Constructor
    ConcreteCommand(Receiver receiver) :
        super(receiver)
    {
    }

    void Execute()
    {
        receiver.Action();
    }
}

/// The 'Receiver' class
class Receiver
{
    void Action()
    {
        print("Called Receiver.Action()");
    }
}


/// The 'Invoker' class
class Invoker
{
    Command _command;

    void SetCommand(Command command)
    {
        this._command = command;
    }

    void ExecuteCommand()
    {
        _command.Execute();
    }
}

void main() {
  // Create receiver, command, and invoker
  Receiver receiver = new Receiver();
  Command command = new ConcreteCommand(receiver);
  Invoker invoker = new Invoker();

  // Set and execute command
  invoker.SetCommand(command);
  invoker.ExecuteCommand();
}