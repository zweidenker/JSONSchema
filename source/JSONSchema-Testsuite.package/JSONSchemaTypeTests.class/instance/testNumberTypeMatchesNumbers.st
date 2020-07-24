as yet unclassified
testNumberTypeMatchesNumbers
	"number type matches numbers"

	| schema data |
	schema := JSONSchema fromString: '{"type":"number"}'.
	"an integer is a number"
	data := NeoJSONReader fromString: '1'.
	schema validate: data.
	"a float with zero fractional part is a number (and an integer)"
	data := NeoJSONReader fromString: '1.0'.
	schema validate: data.
	"a float is a number"
	data := NeoJSONReader fromString: '1.1'.
	schema validate: data.
	"a string is not a number"
	data := NeoJSONReader fromString: '"foo"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"a string is still not a number, even if it looks like one"
	data := NeoJSONReader fromString: '"1"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an object is not a number"
	data := NeoJSONReader fromString: '{}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an array is not a number"
	data := NeoJSONReader fromString: '[]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"a boolean is not a number"
	data := NeoJSONReader fromString: 'true'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"null is not a number"
	data := NeoJSONReader fromString: 'null'.
	self should: [ schema validate: data ] raise: JSONSchemaError