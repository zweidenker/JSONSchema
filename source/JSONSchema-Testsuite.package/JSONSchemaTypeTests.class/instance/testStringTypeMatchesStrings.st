as yet unclassified
testStringTypeMatchesStrings
	"string type matches strings"

	| schema data |
	schema := JSONSchema fromString: '{"type":"string"}'.
	"1 is not a string"
	data := NeoJSONReader fromString: '1'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"a float is not a string"
	data := NeoJSONReader fromString: '1.1'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"a string is a string"
	data := NeoJSONReader fromString: '"foo"'.
	schema validate: data.
	"a string is still a string, even if it looks like a number"
	data := NeoJSONReader fromString: '"1"'.
	schema validate: data.
	"an empty string is still a string"
	data := NeoJSONReader fromString: '""'.
	schema validate: data.
	"an object is not a string"
	data := NeoJSONReader fromString: '{}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an array is not a string"
	data := NeoJSONReader fromString: '[]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"a boolean is not a string"
	data := NeoJSONReader fromString: 'true'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"null is not a string"
	data := NeoJSONReader fromString: 'null'.
	self should: [ schema validate: data ] raise: JSONSchemaError