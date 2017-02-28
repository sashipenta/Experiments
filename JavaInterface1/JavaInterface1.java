
interface ExampleInterface
{
    void print();
}

class A implements ExampleInterface
{
    public void print()
    {
        System.out.println("Hello A");
    }
}

class B implements ExampleInterface
{
    public void print()
    {
        System.out.println("Hello B");
    }
}

class MainClass
{
    public static void main(String args[])
    {
        A a_obj = new A();
        B b_obj = new B();
        a_obj.print();
        b_obj.print();
    }
} 
