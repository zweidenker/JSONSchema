as yet unclassified
testObjectTypeMatchesObjects
	"object type matches objects"

	| schema data |
	schema := JSONSchema fromString: '{"type":"object"}'.
	"an integer is not an object"
	data := NeoJSONReader fromString: '1'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"a float is not an object"
	data := NeoJSONReader fromString: '1.1'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"a string is not an object"
	data := NeoJSONReader fromString: '"foo"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an object is an object"
	data := NeoJSONReader fromString: '{}'.
	schema validate: data.
	"an array is not an object"
	data := NeoJSONReader fromString: '[]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"a boolean is not an object"
	data := NeoJSONReader fromString: 'true'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"null is not an object"
	data := NeoJSONReader fromString: 'null'.
	self should: [ schema validate: data ] raise: JSONSchemaError