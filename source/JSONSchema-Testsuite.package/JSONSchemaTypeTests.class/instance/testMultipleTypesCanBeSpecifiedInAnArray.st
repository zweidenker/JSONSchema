as yet unclassified
testMultipleTypesCanBeSpecifiedInAnArray
	"multiple types can be specified in an array"

	| schema data |
	schema := JSONSchema fromString: '{"type":["integer","string"]}'.
	"an integer is valid"
	data := NeoJSONReader fromString: '1'.
	schema validate: data.
	"a string is valid"
	data := NeoJSONReader fromString: '"foo"'.
	schema validate: data.
	"a float is invalid"
	data := NeoJSONReader fromString: '1.1'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an object is invalid"
	data := NeoJSONReader fromString: '{}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an array is invalid"
	data := NeoJSONReader fromString: '[]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"a boolean is invalid"
	data := NeoJSONReader fromString: 'true'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"null is invalid"
	data := NeoJSONReader fromString: 'null'.
	self should: [ schema validate: data ] raise: JSONSchemaError