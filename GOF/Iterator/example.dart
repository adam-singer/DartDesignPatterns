// Purely as a structural example, a real type of Iterator pattern could be optimized in dart. 

/// The 'Aggregate' abstract class
abstract class Aggregate
{
    abstract CustomIterator CreateIterator();
}


/// The 'ConcreteAggregate' class
class ConcreteAggregate extends Aggregate
{
    Map _items;

    ConcreteAggregate() : _items = new Map() {}
      
    
    CustomIterator CreateIterator() 
    {
        return new ConcreteIterator(this);
    }

    // Gets item count
    int get Count() => _items.length;

    // Indexer
    operator[](int index) => _items[index];
    
    operator []=(int index, value) => _items[index] = value;
}


/// The 'Iterator' abstract class
abstract class CustomIterator
{
    abstract First();
    abstract Next();
    abstract bool IsDone();
    abstract CurrentItem();
}


/// The 'ConcreteIterator' class
class ConcreteIterator extends CustomIterator
{
    ConcreteAggregate _aggregate;
    int _current = 0;

    // Constructor
    ConcreteIterator(ConcreteAggregate aggregate)
    {
        this._aggregate = aggregate;
    }

    // Gets first iteration item
    First()
    {
        return _aggregate[0];
    }

    // Gets next iteration item
    Next()
    {
        var ret = null;
        if (_current < _aggregate.Count - 1)
        {
            ret = _aggregate[++_current];
        }

        return ret;
    }

    // Gets current iteration item
    CurrentItem()
    {
        return _aggregate[_current];
    }

    // Gets whether iterations are complete
    bool IsDone()
    {
        return _current >= _aggregate.Count;
    }
}

void main() {
  ConcreteAggregate a = new ConcreteAggregate();
  a[0] = "Item A";
  a[1] = "Item B";
  a[2] = "Item C";
  a[3] = "Item D";

  // Create Iterator and provide aggregate
  ConcreteIterator i = new ConcreteIterator(a);

  print("Iterating over collection:");

  var item = i.First();
  while (item != null)
  {
      print(item);
      item = i.Next();
  }
}