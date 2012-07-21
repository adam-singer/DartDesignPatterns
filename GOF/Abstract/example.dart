// The 'AbstractFactory' abstract class
abstract class AbstractFactory
{
    abstract AbstractProductA CreateProductA();
    abstract AbstractProductB CreateProductB();
}


// The 'ConcreteFactory1' class
class ConcreteFactory1 extends AbstractFactory
{
    // @override 
    AbstractProductA CreateProductA()
    {
        return new ProductA1();
    }
    
    //@override 
    AbstractProductB CreateProductB()
    {
        return new ProductB1();
    }
}

// The 'ConcreteFactory2' class
class ConcreteFactory2 extends AbstractFactory
{
    //@override 
    AbstractProductA CreateProductA()
    {
        return new ProductA2();
    }
    //@override 
    AbstractProductB CreateProductB()
    {
        return new ProductB2();
    }
}

// The 'AbstractProductA' abstract class
abstract class AbstractProductA
{
}

// The 'AbstractProductB' abstract class
abstract class AbstractProductB
{
    abstract void Interact(AbstractProductA a);
}

// The 'ProductA1' class
class ProductA1 extends AbstractProductA
{
}


// The 'ProductB1' class
class ProductB1 extends AbstractProductB
{
    //@override 
    void Interact(AbstractProductA a)
    {
      print("${this} interacts with ${a}");
    }
}

// The 'ProductA2' class
class ProductA2 extends AbstractProductA
{
}

class ProductB2 extends AbstractProductB
{
    //@override 
    void Interact(AbstractProductA a)
    {
      print("${this} interacts with ${a}");
    }
}

class Client
{
    AbstractProductA _abstractProductA;
    AbstractProductB _abstractProductB;

    // Constructor
    Client(AbstractFactory afactory) {
        _abstractProductB = afactory.CreateProductB();
        _abstractProductA = afactory.CreateProductA();
    }

     
    void Run() {
        _abstractProductB.Interact(_abstractProductA);
    }
}


void main() {
  // Abstract factory #1
  AbstractFactory factory1 = new ConcreteFactory1();
  Client client1 = new Client(factory1);
  client1.Run();

  // Abstract factory #2
  AbstractFactory factory2 = new ConcreteFactory2();
  Client client2 = new Client(factory2);
  client2.Run();
}