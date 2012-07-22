/// The 'Director' class
class Director
{
    // Builder uses a complex series of steps
    void Construct(Builder builder)
    {
        builder.BuildPartA();
        builder.BuildPartB();
    }
}

/// The 'Builder' abstract class
abstract class Builder
{
    abstract void BuildPartA();
    abstract void BuildPartB();
    abstract Product GetResult();
}


/// The 'ConcreteBuilder1' class
class ConcreteBuilder1 extends Builder
{
    Product _product;

    ConcreteBuilder1() : _product = new Product() {}
    
    void BuildPartA()
    {
        _product.Add("PartA");
    }

    void BuildPartB()
    {
        _product.Add("PartB");
    }

    Product GetResult()
    {
        return _product;
    }
}


/// The 'ConcreteBuilder2' class
class ConcreteBuilder2 extends Builder
{
    Product _product;

    ConcreteBuilder2() : _product = new Product() {}
    
    void BuildPartA()
    {
        _product.Add("PartX");
    }

    void BuildPartB()
    {
        _product.Add("PartY");
    }

    Product GetResult()
    {
        return _product;
    }
}


/// The 'Product' class
class Product
{
    List<String> _parts;

    Product() : _parts = new List<String>() {}
    
    void Add(String part)
    {
        _parts.add(part);
    }

    void Show()
    {
        print("\nProduct Parts -------");
        _parts.forEach((part)=>print(part));
    }
}


void main() {
  // Create director and builders
  Director director = new Director();

  Builder b1 = new ConcreteBuilder1();
  Builder b2 = new ConcreteBuilder2();

  // Construct two products
  director.Construct(b1);
  Product p1 = b1.GetResult();
  p1.Show();

  director.Construct(b2);
  Product p2 = b2.GetResult();
  p2.Show();
}