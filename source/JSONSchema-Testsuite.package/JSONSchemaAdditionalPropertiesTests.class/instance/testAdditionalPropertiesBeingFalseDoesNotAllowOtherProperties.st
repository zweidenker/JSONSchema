as yet unclassified
testAdditionalPropertiesBeingFalseDoesNotAllowOtherProperties
	"additionalProperties being false does not allow other properties"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"properties":{"foo":{},"bar":{}},"patternProperties":{"^v":{}},"additionalProperties":false}'.
	"no additional properties is valid"
	data := NeoJSONReader fromString: '{"foo":1}'.
	schema validate: data.
	"an additional property is invalid"
	data := NeoJSONReader fromString: '{"quux":"boom","foo":1,"bar":2}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"ignores arrays"
	data := NeoJSONReader fromString: '[1,2,3]'.
	schema validate: data.
	"ignores strings"
	data := NeoJSONReader fromString: '"foobarbaz"'.
	schema validate: data.
	"ignores other non-objects"
	data := NeoJSONReader fromString: '12'.
	schema validate: data.
	"patternProperties are not additional properties"
	data := NeoJSONReader fromString: '{"vroom":2,"foo":1}'.
	schema validate: data