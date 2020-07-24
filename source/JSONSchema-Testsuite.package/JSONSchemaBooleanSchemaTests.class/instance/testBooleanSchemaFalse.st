as yet unclassified
testBooleanSchemaFalse
	"boolean schema 'false'"

	| schema data |
	schema := JSONSchema fromString: 'false'.
	"number is invalid"
	data := NeoJSONReader fromString: '1'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"string is invalid"
	data := NeoJSONReader fromString: '"foo"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"boolean true is invalid"
	data := NeoJSONReader fromString: 'true'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"boolean false is invalid"
	data := NeoJSONReader fromString: 'false'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"null is invalid"
	data := NeoJSONReader fromString: 'null'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"object is invalid"
	data := NeoJSONReader fromString: '{"foo":"bar"}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"empty object is invalid"
	data := NeoJSONReader fromString: '{}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"array is invalid"
	data := NeoJSONReader fromString: '["foo"]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"empty array is invalid"
	data := NeoJSONReader fromString: '[]'.
	self should: [ schema validate: data ] raise: JSONSchemaError