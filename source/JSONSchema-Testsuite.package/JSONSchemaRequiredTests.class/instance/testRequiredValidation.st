as yet unclassified
testRequiredValidation
	"required validation"

	| schema data |
	schema := JSONSchema
		fromString: '{"properties":{"foo":{},"bar":{}},"required":["foo"]}'.
	"present required property is valid"
	data := NeoJSONReader fromString: '{"foo":1}'.
	schema validate: data.
	"non-present required property is invalid"
	data := NeoJSONReader fromString: '{"bar":1}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"ignores arrays"
	data := NeoJSONReader fromString: '[]'.
	schema validate: data.
	"ignores strings"
	data := NeoJSONReader fromString: '""'.
	schema validate: data.
	"ignores other non-objects"
	data := NeoJSONReader fromString: '12'.
	schema validate: data