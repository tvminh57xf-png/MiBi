namespace MiBi.Domain;

public sealed class BimDocument
{
    private readonly List<BimElement> _elements = new();

    public IReadOnlyList<BimElement> Elements
        => _elements;

    public void Add(BimElement element)
    {
        _elements.Add(element);
    }
}
