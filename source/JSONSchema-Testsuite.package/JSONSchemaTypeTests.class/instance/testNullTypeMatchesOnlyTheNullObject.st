as yet unclassified
testNullTypeMatchesOnlyTheNullObject
	"null type matches only the null object"

	| schema data |
	schema := JSONSchema fromString: '{"type":"null"}'.
	"an integer is not null"
	data := NeoJSONReader fromString: '1'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"a float is not null"
	data := NeoJSONReader fromString: '1.1'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"zero is not null"
	data := NeoJSONReader fromString: '0'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"a string is not null"
	data := NeoJSONReader fromString: '"foo"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an empty string is not null"
	data := NeoJSONReader fromString: '""'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an object is not null"
	data := NeoJSONReader fromString: '{}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an array is not null"
	data := NeoJSONReader fromString: '[]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"true is not null"
	data := NeoJSONReader fromString: 'true'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"false is not null"
	data := NeoJSONReader fromString: 'false'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"null is null"
	data := NeoJSONReader fromString: 'null'.
	schema validate: data