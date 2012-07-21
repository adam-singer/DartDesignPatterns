// The 'Target' class
class Target
{
    void Request()
    {
      print("Called Target Request()");
    }
}

// The 'Adaptee' class
class Adaptee
{
    void SpecificRequest()
    {
        print("Called SpecificRequest()");
    }
}

// The 'Adapter' class
class Adapter extends Target
{
    Adaptee _adaptee;

    Adapter() : this._adaptee = new Adaptee() {}
    
    //@override 
    void Request()
    {
        // Possibly do some other work
        // and then call SpecificRequest
        _adaptee.SpecificRequest();
    }
}

void main() {
  // Create adapter and place a request
  Target target = new Adapter();
  target.Request();
}