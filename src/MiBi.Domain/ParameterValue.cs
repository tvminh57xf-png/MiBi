namespace MiBi.Domain;

public sealed class ParameterValue
{
    public string Name { get; }
    public object? Value { get; }

    public ParameterValue(string name, object? value)
    {
        Name = name;
        Value = value;
    }
}
