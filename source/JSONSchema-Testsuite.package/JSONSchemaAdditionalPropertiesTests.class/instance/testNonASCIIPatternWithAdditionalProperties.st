as yet unclassified
testNonASCIIPatternWithAdditionalProperties
	"non-ASCII pattern with additionalProperties"

	| schema data |
	schema := JSONSchema
		fromString: '{"patternProperties":{"^á":{}},"additionalProperties":false}'.
	"matching the pattern is valid"
	data := NeoJSONReader fromString: '{"ármányos":2}'.
	schema validate: data.
	"not matching the pattern is invalid"
	data := NeoJSONReader fromString: '{"élmény":2}'.
	self should: [ schema validate: data ] raise: JSONSchemaError