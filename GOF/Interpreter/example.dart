
/// The 'Context' class
class Context
{
}

/// The 'AbstractExpression' abstract class
abstract class AbstractExpression
{
    abstract void Interpret(Context context);
}

/// The 'TerminalExpression' class
class TerminalExpression extends AbstractExpression
{
    void Interpret(Context context)
    {
        print("Called Terminal.Interpret()");
    }
}

/// The 'NonterminalExpression' class
class NonterminalExpression extends AbstractExpression
{
    void Interpret(Context context)
    {
        print("Called Nonterminal.Interpret()");
    }
}

void main() {
  Context context = new Context();

  // Usually a tree 
  List list = new List();

  // Populate 'abstract syntax tree' 
  list.add(new TerminalExpression());
  list.add(new NonterminalExpression());
  list.add(new TerminalExpression());
  list.add(new TerminalExpression());

  // Interpret
  list.forEach((exp)=>exp.Interpret(context));
}