as yet unclassified
testConstWithTrueDoesNotMatch1
	"const with true does not match 1"

	| schema data |
	schema := JSONSchema fromString: '{"const":true}'.
	"true is valid"
	data := NeoJSONReader fromString: 'true'.
	schema validate: data.
	"integer one is invalid"
	data := NeoJSONReader fromString: '1'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"float one is invalid"
	data := NeoJSONReader fromString: '1.0'.
	self should: [ schema validate: data ] raise: JSONSchemaError