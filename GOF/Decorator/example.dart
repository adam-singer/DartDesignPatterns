
/// The 'Component' abstract class
abstract class Component
{
    abstract void Operation();
}

/// The 'ConcreteComponent' class
class ConcreteComponent extends Component
{
    void Operation()
    {
        print("ConcreteComponent.Operation()");
    }
}

/// The 'Decorator' abstract class
abstract class Decorator extends Component
{
    Component component;

    void SetComponent(Component _component)
    {
        this.component = _component;
    }

    void Operation()
    {
        if (component != null)
        {
            component.Operation();
        }
    }
}

/// The 'ConcreteDecoratorA' class
class ConcreteDecoratorA extends Decorator
{
    void Operation()
    {
        super.Operation();
        print("ConcreteDecoratorA.Operation()");
    }
}

/// The 'ConcreteDecoratorB' class
class ConcreteDecoratorB extends Decorator
{
    void Operation()
    {
        super.Operation();
        AddedBehavior();
        print("ConcreteDecoratorB.Operation()");
    }

    void AddedBehavior()
    {
    }
}

void main() {
  // Create ConcreteComponent and two Decorators
  ConcreteComponent c = new ConcreteComponent();
  ConcreteDecoratorA d1 = new ConcreteDecoratorA();
  ConcreteDecoratorB d2 = new ConcreteDecoratorB();

  // Link decorators
  d1.SetComponent(c);
  d2.SetComponent(d1);

  d2.Operation();
}