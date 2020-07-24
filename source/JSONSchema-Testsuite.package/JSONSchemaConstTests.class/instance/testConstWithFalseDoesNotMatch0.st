as yet unclassified
testConstWithFalseDoesNotMatch0
	"const with false does not match 0"

	| schema data |
	schema := JSONSchema fromString: '{"const":false}'.
	"false is valid"
	data := NeoJSONReader fromString: 'false'.
	schema validate: data.
	"integer zero is invalid"
	data := NeoJSONReader fromString: '0'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"float zero is invalid"
	data := NeoJSONReader fromString: '0.0'.
	self should: [ schema validate: data ] raise: JSONSchemaError