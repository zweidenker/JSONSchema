as yet unclassified
testMaximumValidationWithUnsignedInteger
	"maximum validation with unsigned integer"

	| schema data |
	schema := JSONSchema fromString: '{"maximum":300}'.
	"below the maximum is invalid"
	data := NeoJSONReader fromString: '299.97'.
	schema validate: data.
	"boundary point integer is valid"
	data := NeoJSONReader fromString: '300'.
	schema validate: data.
	"boundary point float is valid"
	data := NeoJSONReader fromString: '300.0'.
	schema validate: data.
	"above the maximum is invalid"
	data := NeoJSONReader fromString: '300.5'.
	self should: [ schema validate: data ] raise: JSONSchemaError