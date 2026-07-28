# JSONSchema

[![Build Status](https://travis-ci.org/zweidenker/JSONSchema.svg?branch=master)](https://travis-ci.org/zweidenker/JSONSchema)
[![Test Status](https://api.bob-bench.org/v1/badgeByUrl?branch=master&hosting=github&ci=travis-ci&repo=zweidenker%2FJSONSchema&subNumber=1)](https://bob-bench.org/r/gh/zweidenker/JSONSchema)

This is an implementation of [JSON Schema](https://json-schema.org/) for the [Pharo](http://pharo.org) language. It is used to define the structure and values of a JSON document, to validate a value against that structure, and to read/write values through it. A schema can also be externalized to JSON so it can be consumed by a third party.

The framework is a single package, `JSONSchema-Core`, with [NeoJSON](https://github.com/svenvc/NeoJSON) as its only dependency.

## Contents

- [Installation](#installation)
- [Quick start](#quick-start)
- [Defining a schema in Pharo](#defining-a-schema-in-pharo)
- [Loading a schema from JSON](#loading-a-schema-from-json)
- [Validating a value](#validating-a-value)
- [Reading and writing values](#reading-and-writing-values)
- [Serializing a schema](#serializing-a-schema)
- [Constraints](#constraints)
- [Supported keywords](#supported-keywords)
- [Supported formats](#supported-formats)
- [Adding a custom format](#adding-a-custom-format)
- [What is not (yet) supported](#what-is-not-yet-supported)

## Installation

Load it into Pharo via Metacello:

```smalltalk
Metacello new
  repository: 'github://zweidenker/JSONSchema';
  baseline: #JSONSchema;
  load.
```

This loads the `default` group (`JSONSchema-Core` + its tests). The baseline also declares a separate `Testsuite` group that adds the generated tests of the official, cross-language [JSON-Schema-Test-Suite](https://github.com/json-schema-org/JSON-Schema-Test-Suite); load it with `load: #('Testsuite')` if you want to run them.

## Quick start

There are two ways to get a schema: build it with the Pharo DSL, or load it from a JSON Schema document. Either way you get a `JSONSchema` object you can validate values with.

```smalltalk
"Load a schema from a JSON Schema document..."
schema := JSONSchema fromString: '{
  "type": "object",
  "properties": {
    "name": { "type": "string" },
    "age":  { "type": "integer", "minimum": 0 }
  },
  "required": [ "name" ]
}'.

"...and validate a parsed value against it."
value := NeoJSONReader fromString: '{ "name": "John Doe", "age": 42 }'.
schema validate: value.   "returns the schema; raises a JSONSchemaError if invalid"
```

## Defining a schema in Pharo

The class side of `JSONSchema` offers a small, readable DSL for the primitive types:

```smalltalk
JSONSchema string.
JSONSchema number.
JSONSchema integer.
JSONSchema boolean.
JSONSchema any.                              "accepts anything"
JSONSchema stringWithFormat: 'date-time'.    "a typed string with a format"
JSONSchema string enum: #('red' 'green' 'blue').
```

An **object** schema is written with the literal array syntax and `asJSONSchema`:

```smalltalk
schema := {
  #name        -> JSONSchema string.
  #dateAndTime -> (JSONSchema stringWithFormat: 'date-time').
  #numberOfPets -> JSONSchema number } asJSONSchema.
```

which describes the following JSON:

```json
{
  "name": "John Doe",
  "dateAndTime": "1970-01-01T14:00:00+00:00",
  "numberOfPets": 3
}
```

Schemas can be **nested** to any depth — a property value is just another schema:

```smalltalk
schema := {
  #name    -> JSONSchema string.
  #address -> {
    #street -> JSONSchema string.
    #number -> JSONSchema number } } asJSONSchema.
```

**Arrays** are defined with `JSONSchemaArray`:

```smalltalk
JSONSchemaArray new items: JSONSchema integer.   "an array of integers"
```

## Loading a schema from JSON

Given a JSON Schema document as a string, instantiate a schema with:

```smalltalk
schema := JSONSchema fromString: schemaString.
```

This is the counterpart of [serializing a schema](#serializing-a-schema) and understands the [supported keywords](#supported-keywords) below.

## Validating a value

`validate:` is the core operation. It takes an **already parsed** value (a `Dictionary`, `Array`, `String`, number, `Boolean` or `nil` — for example the result of `NeoJSONReader fromString:`) and checks it against the schema:

```smalltalk
schema := JSONSchema fromString: '{ "type": "integer", "minimum": 10 }'.

schema validate: 42.   "OK — returns the schema"
schema validate: 3.    "raises JSONConstraintError: 3 must be greater than or equal to 10"
```

On success `validate:` returns the schema. On failure it **signals an exception**, so wrap it if you want a boolean result:

```smalltalk
isValid := [ schema validate: value. true ]
             on: JSONSchemaError
             do: [ :error | false ].
```

All validation errors are subclasses of `JSONSchemaError`, so you can catch them at the granularity you need:

| Exception | Raised when |
| --- | --- |
| `JSONTypeError` | the value has the wrong JSON type |
| `JSONConstraintError` | a constraint fails (range, length, pattern, format, `enum`, `const`, composition, …) |
| `JSONSchemaMissingRequiredProperty` | a `required` property is absent |
| `JSONInvalidPropertyError` | a property is not allowed |
| `JSONFormatError` | a value does not match its declared `format` |

## Reading and writing values

Beyond plain validation a schema can **materialize** a value from JSON and **write** it back out. Reading validates and converts formatted values (e.g. a `date-time` string becomes a `DateAndTime`):

```smalltalk
value := schema readString: jsonString.
```

For the object schema above, `value` has `name` as a `String`, `dateAndTime` as a `DateAndTime` and `numberOfPets` as a `SmallInteger`.

Writing produces JSON and guarantees that only valid JSON leaves your system:

```smalltalk
jsonString := schema write: value.
```

## Serializing a schema

A schema is itself serializable to a JSON Schema document:

```smalltalk
schema jsonString.        "compact"
schema jsonStringPretty.  "indented"
```

For the `{ name, numberOfPets, dateAndTime }` schema this yields:

```json
{
  "type": "object",
  "properties": {
    "name": { "type": "string" },
    "numberOfPets": { "type": "number" },
    "dateAndTime": { "type": "string", "format": "date-time" }
  }
}
```

## Constraints

Constraints refine a type. When building schemas in Pharo they are reachable through accessors on the schema object, e.g. the numeric interval:

```smalltalk
numberSchema := JSONSchema number.
numberSchema interval
  minimum: 1;
  exclusiveMaximum: 100.   "1 <= value < 100"
```

The same constraints are available as keywords when [loading a schema from JSON](#loading-a-schema-from-json) — see the table below.

## Supported keywords

The core covers the Draft-04 keyword set plus several keywords from later drafts. All of the following are honored by `fromString:` and enforced by `validate:`:

| Group | Keywords |
| --- | --- |
| Type / value | `type` (a single name **or** an array of names), `enum`, `const` |
| Numbers | `minimum`, `maximum`, `exclusiveMinimum`, `exclusiveMaximum`, `multipleOf` |
| Strings | `minLength`, `maxLength`, `pattern`, `format` |
| Arrays | `items` (single schema **or** tuple), `additionalItems`, `minItems`, `maxItems`, `uniqueItems`, `contains` |
| Objects | `properties`, `required`, `patternProperties`, `propertyNames`, `dependencies`, `minProperties`, `maxProperties` |
| Composition | `allOf`, `anyOf`, `oneOf`, `not` |
| Conditional | `if` / `then` / `else` |
| References | `$ref` to a local pointer (`#/definitions/…`, `#/$defs/…`) |
| Boolean schemas | a bare `true` (accept anything) or `false` (reject everything) as a whole schema |

## Supported formats

`format` is validated for these string formats:

`date`, `date-time`, `time`, `email`, `idn-email`, `hostname`, `idn-hostname`, `ipv4`, `ipv6`, `uri`, `uri-reference`, `iri`, `iri-reference`, `uri-template`, `json-pointer`, `relative-json-pointer`, `regex`.

Unknown or unsupported format names are **tolerated** (ignored), matching the JSON Schema default that `format` is an annotation unless a validator exists for it.

## Adding a custom format

Create a subclass of `JSONFormat` (or of `JSONBasicStringFormat` for string formats) and implement three **class-side** methods: `formatName`, `basicConvertString:` and a `validateString:` that signals a `JSONSchemaError` for a malformed value. Formats are looked up by name, so the new one is picked up automatically wherever it is referenced:

```smalltalk
JSONFormatSlug class >> formatName [
  ^ 'slug' ]

JSONFormatSlug class >> basicConvertString: aString [
  ^ aString ]

JSONFormatSlug class >> validateString: aString [
  (aString allSatisfy: [ :c | c isLowercase or: [ c isDigit or: [ c = $- ] ] ])
    ifFalse: [ JSONConstraintError signal: aString printString, ' is not a valid slug' ] ]
```

`{ "type": "string", "format": "slug" }` will now reject values that are not slugs.

## What is not (yet) supported

This is intentionally not a full implementation of the specification. Known gaps:

- **Remote / external `$ref`** — only local pointers within the same document are resolved.
- **The 2020-12 vocabulary machinery** — `$dynamicRef` / `$dynamicAnchor`, `unevaluatedProperties` / `unevaluatedItems`, `$vocabulary`.
- **`contentEncoding` / `contentMediaType`.**
- Some **ECMA-262 regex edge semantics** differ from Pharo's regex engine.

If you need something that is missing you are welcome to open a pull request, or a ticket in this repository.
