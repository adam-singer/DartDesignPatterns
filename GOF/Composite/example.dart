
/// The 'Component' abstract class
abstract class Component
{
    String name;

    // Constructor
    Component(this.name);

    abstract void Add(Component c);
    abstract void Remove(Component c);
    abstract void Display(int depth);
}


/// The 'Composite' class
class Composite extends Component
{
    List<Component> _children;

    // Constructor
    Composite(String name)
        : super(name), _children = new List<Component>()
    {
    }

    void Add(Component component)
    {
        _children.add(component);
    }

    void Remove(Component component)
    {
      _children.removeRange(_children.indexOf(component), 1);
    }

    void Display(int depth)
    {
        StringBuffer sb = new StringBuffer();
        for (int i=0; i<depth; i++) sb.add('-');
        sb.add(name);
        print(sb.toString());

        
        // Recursively display child nodes
        _children.forEach((component)=>component.Display(depth+2));
    }
}


/// The 'Leaf' class
class Leaf extends Component
{
    // Constructor
    Leaf(String name)
        : super(name)
    {
    }

    void Add(Component c)
    {  
      print("Cannot add to a leaf");
    }

    void Remove(Component c)
    {  
      print("Cannot remove from a leaf");
    }

    void Display(int depth)
    {
      StringBuffer sb = new StringBuffer();
      for (int i=0; i<depth; i++) sb.add('-');
      sb.add(name);
      print(sb.toString());
    }
}
    
void main() {
  // Create a tree structure
  Composite root = new Composite("root");
  root.Add(new Leaf("Leaf A"));
  root.Add(new Leaf("Leaf B"));

  Composite comp = new Composite("Composite X");
  comp.Add(new Leaf("Leaf XA"));
  comp.Add(new Leaf("Leaf XB"));

  root.Add(comp);
  root.Add(new Leaf("Leaf C"));

  // Add and remove a leaf
  Leaf leaf = new Leaf("Leaf D");
  root.Add(leaf);
  root.Remove(leaf);

  // Recursively display tree
  root.Display(1);
}