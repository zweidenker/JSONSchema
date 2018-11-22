# JSONSchema

[![Build Status](https://travis-ci.org/zweidenker/JSONSchema.svg?branch=master)](https://travis-ci.org/zweidenker/JSONSchema)

This is an implementation of [JSON Schema](https://json-schema.org/) for the [pharo](http://pharo.org) language. It is used to define the structure and values of a JSON string and to validate it. The schema itself can be externalized for being consumed by a third party.

It can be loaded by downloading it in pharo via

```
  Metacello new
    repository: 'github://zweidenker/JSONSchema';
    baseline: #JSONSchema;
    load
```
## Defining a schema

These are the expression to create a schema model inside pharo.

```
schema := {
  #name -> JSONSchema string.
  #dateAndTime -> (JSONSchema stringWithFormat: 'date-time').
  #numberOfPets -> JSONSchema number } asJSONSchema.

```

defines as schema that can parse the following JSON:

```
jsonString := '{
  "name" : "John Doe",
  "dateAndTime" : "1970-01-01T14:00:00",
  "numberOfPets" : 3
}'.
```

## Reading/Writing a value using a schema

To parse the value from JSON we only need to invoke:

```
value := schema read: jsonString
```

The object in ```value``` will have name as a string, dateAndTime as a DateAndTime object and numberOfPets as a SmallInteger object.

The schema can also be used to write out the value as JSON. This is especially useful if we want to ensure that only valid JSON is written. For this invoke

```
jsonString := schema write: value.
```

## Serialize/Materialize a schema

Addtionally to reading and writing objects a schema can be serialized to string.

```
schemaString := NeoJSONWriter toStringPretty: schema.
```

gives

```
{
	"type" : "object",
	"properties" : {
		"name" : {
			"type" : "string"
		},
		"numberOfPets" : {
			"type" : "number"
		},
		"dateAndTime" : {
			"type" : "string",
			"format" : "date-time"
		}
	}
}
```


If we would get a schema as string we can instantiate by invoking

```
schema := JSONSchema fromString: schemaString.
```
