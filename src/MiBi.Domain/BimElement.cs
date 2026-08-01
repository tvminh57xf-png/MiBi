namespace MiBi.Domain;

public sealed class BimElement
{
    public ElementId Id { get; }
    public BimType Type { get; }

    private readonly Dictionary<string, ParameterValue> _parameters = new();

    public IReadOnlyDictionary<string, ParameterValue> Parameters
        => _parameters;

    public BimElement(
        ElementId id,
        BimType type)
    {
        Id = id;
        Type = type;
    }

    public void SetParameter(ParameterValue parameter)
    {
        _parameters[parameter.Name] = parameter;
    }
}
