as yet unclassified
testBooleanTypeMatchesBooleans
	"boolean type matches booleans"

	| schema data |
	schema := JSONSchema fromString: '{"type":"boolean"}'.
	"an integer is not a boolean"
	data := NeoJSONReader fromString: '1'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"zero is not a boolean"
	data := NeoJSONReader fromString: '0'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"a float is not a boolean"
	data := NeoJSONReader fromString: '1.1'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"a string is not a boolean"
	data := NeoJSONReader fromString: '"foo"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an empty string is not a boolean"
	data := NeoJSONReader fromString: '""'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an object is not a boolean"
	data := NeoJSONReader fromString: '{}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an array is not a boolean"
	data := NeoJSONReader fromString: '[]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"true is a boolean"
	data := NeoJSONReader fromString: 'true'.
	schema validate: data.
	"false is a boolean"
	data := NeoJSONReader fromString: 'false'.
	schema validate: data.
	"null is not a boolean"
	data := NeoJSONReader fromString: 'null'.
	self should: [ schema validate: data ] raise: JSONSchemaError