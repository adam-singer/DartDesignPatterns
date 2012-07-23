
/// The 'Subsystem ClassA' class
class SubSystemOne
{
    void MethodOne()
    {
        print(" SubSystemOne Method");
    }
}

/// The 'Subsystem ClassB' class
class SubSystemTwo
{
    MethodTwo()
    {
        print(" SubSystemTwo Method");
    }
}

/// The 'Subsystem ClassC' class
class SubSystemThree
{
    void MethodThree()
    {
        print(" SubSystemThree Method");
    }
}

/// The 'Subsystem ClassD' class
class SubSystemFour
{
    void MethodFour()
    {
        print(" SubSystemFour Method");
    }
}

/// The 'Facade' class
class Facade
{
    SubSystemOne _one;
    SubSystemTwo _two;
    SubSystemThree _three;
    SubSystemFour _four;

    Facade()
    {
        _one = new SubSystemOne();
        _two = new SubSystemTwo();
        _three = new SubSystemThree();
        _four = new SubSystemFour();
    }

    void MethodA()
    {
        print("\nMethodA() ---- ");
        _one.MethodOne();
        _two.MethodTwo();
        _four.MethodFour();
    }

    void MethodB()
    {
        print("\nMethodB() ---- ");
        _two.MethodTwo();
        _three.MethodThree();
    }
}


void main() { 
  Facade facade = new Facade();

  facade.MethodA();
  facade.MethodB();
}