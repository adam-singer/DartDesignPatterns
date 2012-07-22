/// The 'Abstraction' class
class Abstraction
{
    Implementor _implementor;

    // Property
    set implementor(Implementor value) => _implementor=value;
    get implementor() => _implementor;
    
    void Operation()
    {
      _implementor.Operation();
    }
}


/// The 'Implementor' abstract class
abstract class Implementor
{
    abstract void Operation();
}


/// The 'RefinedAbstraction' class
class RefinedAbstraction extends Abstraction
{
    void Operation()
    {
      implementor.Operation();
    }
}


/// The 'ConcreteImplementorA' class
class ConcreteImplementorA extends Implementor
{
    void Operation()
    {
        print("ConcreteImplementorA Operation");
    }
}


/// The 'ConcreteImplementorB' class
class ConcreteImplementorB extends Implementor
{
    void Operation()
    {
        print("ConcreteImplementorB Operation");
    }
}


void main() {
  Abstraction ab = new RefinedAbstraction();

  // Set implementation and call
  ab.implementor = new ConcreteImplementorA();
  ab.Operation();

  // Change implemention and call
  ab.implementor = new ConcreteImplementorB();
  ab.Operation();
}