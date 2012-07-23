
/// The 'FlyweightFactory' class
class FlyweightFactory
{
    Map flyweights;

    // Constructor
    FlyweightFactory() : flyweights = new Map()
    {
        flyweights["X"] = new ConcreteFlyweight();
        flyweights["Y"] = new ConcreteFlyweight();
        flyweights["Z"] = new ConcreteFlyweight();
    }

    Flyweight GetFlyweight(String key)
    {
        return flyweights[key];
    }
}


/// The 'Flyweight' abstract class
abstract class Flyweight
{
    abstract void Operation(int extrinsicstate);
}


/// The 'ConcreteFlyweight' class
class ConcreteFlyweight extends Flyweight
{
    void Operation(int extrinsicstate)
    {
        print("ConcreteFlyweight: $extrinsicstate");
    }
}


/// The 'UnsharedConcreteFlyweight' class
class UnsharedConcreteFlyweight extends Flyweight
{
    void Operation(int extrinsicstate)
    {
      print("UnsharedConcreteFlyweight: $extrinsicstate");
    }
}

void main() {
  // Arbitrary extrinsic state
  int extrinsicstate = 22;

  FlyweightFactory _factory = new FlyweightFactory();

  // Work with different flyweight instances
  Flyweight fx = _factory.GetFlyweight("X");
  fx.Operation(--extrinsicstate);

  Flyweight fy = _factory.GetFlyweight("Y");
  fy.Operation(--extrinsicstate);

  Flyweight fz = _factory.GetFlyweight("Z");
  fz.Operation(--extrinsicstate);

  UnsharedConcreteFlyweight fu = new UnsharedConcreteFlyweight();

  fu.Operation(--extrinsicstate);
}