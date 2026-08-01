#!/bin/bash

echo "Creating MiBi BIM Domain Model Part 1..."

mkdir -p src/MiBi.Domain/{Elements,Geometry,Parameters,Materials,Services,Types,Validation}
mkdir -p tests/MiBi.Domain.Tests/{Unit,Stress}
mkdir -p docs samples artifacts

cat > src/MiBi.Domain/ElementId.cs <<'EOF'
namespace MiBi.Domain;

public readonly record struct ElementId(Guid Value)
{
    public static ElementId New()
        => new(Guid.NewGuid());

    public override string ToString()
        => Value.ToString();
}
EOF

cat > src/MiBi.Domain/ParameterValue.cs <<'EOF'
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
EOF

cat > src/MiBi.Domain/BimType.cs <<'EOF'
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
EOF

cat > src/MiBi.Domain/BimElement.cs <<'EOF'
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
EOF

cat > src/MiBi.Domain/BimDocument.cs <<'EOF'
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
EOF

cat > src/MiBi.Domain/MiBi.Domain.csproj <<'EOF'
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <TargetFramework>net8.0</TargetFramework>
    <Nullable>enable</Nullable>
    <ImplicitUsings>enable</ImplicitUsings>
  </PropertyGroup>
</Project>
EOF

echo "MiBi BIM Domain Model Part 1 created."
