namespace MiBi.Domain;

public sealed class BimType
{
    public ElementId Id { get; }
    public string Name { get; }
    public string Category { get; }

    public BimType(
        ElementId id,
        string name,
        string category)
    {
        Id = id;
        Name = name;
        Category = category;
    }
}
