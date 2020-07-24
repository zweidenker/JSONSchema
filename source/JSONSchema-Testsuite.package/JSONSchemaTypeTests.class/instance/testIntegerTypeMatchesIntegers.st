as yet unclassified
testIntegerTypeMatchesIntegers
	"integer type matches integers"

	| schema data |
	schema := JSONSchema fromString: '{"type":"integer"}'.
	"an integer is an integer"
	data := NeoJSONReader fromString: '1'.
	schema validate: data.
	"a float with zero fractional part is an integer"
	data := NeoJSONReader fromString: '1.0'.
	schema validate: data.
	"a float is not an integer"
	data := NeoJSONReader fromString: '1.1'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"a string is not an integer"
	data := NeoJSONReader fromString: '"foo"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"a string is still not an integer, even if it looks like one"
	data := NeoJSONReader fromString: '"1"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an object is not an integer"
	data := NeoJSONReader fromString: '{}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an array is not an integer"
	data := NeoJSONReader fromString: '[]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"a boolean is not an integer"
	data := NeoJSONReader fromString: 'true'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"null is not an integer"
	data := NeoJSONReader fromString: 'null'.
	self should: [ schema validate: data ] raise: JSONSchemaError