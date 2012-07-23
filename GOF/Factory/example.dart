// NOTE: dart provide built in factory

/// The 'Product' abstract class
abstract class Product
{
}


/// A 'ConcreteProduct' class
class ConcreteProductA extends Product
{
}

/// A 'ConcreteProduct' class
class ConcreteProductB extends Product
{
}

/// The 'Creator' abstract class
abstract class Creator
{
    abstract Product FactoryMethod();
}

/// A 'ConcreteCreator' class
class ConcreteCreatorA extends Creator
{
    Product FactoryMethod()
    {
        return new ConcreteProductA();
    }
}

/// A 'ConcreteCreator' class
class ConcreteCreatorB extends Creator
{
    Product FactoryMethod()
    {
        return new ConcreteProductB();
    }
}

void main() {
  // An array of creators
  List<Creator> creators = new List<Creator>(2);

  creators[0] = new ConcreteCreatorA();
  creators[1] = new ConcreteCreatorB();

  // Iterate over creators and create products
  creators.forEach((creator) { 
    Product product = creator.FactoryMethod();
    print("Created ${product}");
  });
}