
/// The 'Handler' abstract class
abstract class Handler
{
    Handler successor;

    void SetSuccessor(Handler ssuccessor)
    {
        this.successor = ssuccessor;
    }

    abstract void HandleRequest(int request);
}


/// The 'ConcreteHandler1' class
class ConcreteHandler1 extends Handler
{
    void HandleRequest(int request)
    {
        if (request >= 0 && request < 10)
        {
          print("${this} handled request ${request}");
        }
        else if (successor != null)
        {
            successor.HandleRequest(request);
        }
    }
}


/// The 'ConcreteHandler2' class
class ConcreteHandler2 extends Handler
{
    void HandleRequest(int request)
    {
        if (request >= 10 && request < 20)
        {
            print("${this} handled request ${request}");
        }
        else if (successor != null)
        {
            successor.HandleRequest(request);
        }
    }
}


/// The 'ConcreteHandler3' class
class ConcreteHandler3 extends Handler
{
    void HandleRequest(int request)
    {
        if (request >= 20 && request < 30)
        {
          print("${this} handled request ${request}");
        }
        else if (successor != null)
        {
            successor.HandleRequest(request);
        }
    }
}

void main() {
  // Setup Chain of Responsibility
  Handler h1 = new ConcreteHandler1();
  Handler h2 = new ConcreteHandler2();
  Handler h3 = new ConcreteHandler3();
  h1.SetSuccessor(h2);
  h2.SetSuccessor(h3);

  // Generate and process request
  List<int> requests = [ 2, 5, 14, 22, 18, 3, 27, 20 ];

  requests.forEach((request)=>h1.HandleRequest(request));
}
