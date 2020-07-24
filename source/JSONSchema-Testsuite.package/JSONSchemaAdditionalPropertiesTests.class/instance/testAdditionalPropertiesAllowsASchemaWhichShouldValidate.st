as yet unclassified
testAdditionalPropertiesAllowsASchemaWhichShouldValidate
	"additionalProperties allows a schema which should validate"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"properties":{"foo":{},"bar":{}},"additionalProperties":{"type":"boolean"}}'.
	"no additional properties is valid"
	data := NeoJSONReader fromString: '{"foo":1}'.
	schema validate: data.
	"an additional valid property is valid"
	data := NeoJSONReader fromString: '{"quux":true,"foo":1,"bar":2}'.
	schema validate: data.
	"an additional invalid property is invalid"
	data := NeoJSONReader fromString: '{"quux":12,"foo":1,"bar":2}'.
	self should: [ schema validate: data ] raise: JSONSchemaError