as yet unclassified
testArrayTypeMatchesArrays
	"array type matches arrays"

	| schema data |
	schema := JSONSchema fromString: '{"type":"array"}'.
	"an integer is not an array"
	data := NeoJSONReader fromString: '1'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"a float is not an array"
	data := NeoJSONReader fromString: '1.1'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"a string is not an array"
	data := NeoJSONReader fromString: '"foo"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an object is not an array"
	data := NeoJSONReader fromString: '{}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an array is an array"
	data := NeoJSONReader fromString: '[]'.
	schema validate: data.
	"a boolean is not an array"
	data := NeoJSONReader fromString: 'true'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"null is not an array"
	data := NeoJSONReader fromString: 'null'.
	self should: [ schema validate: data ] raise: JSONSchemaError