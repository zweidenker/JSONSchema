as yet unclassified
testAdditionalPropertiesShouldNotLookInApplicators
	"additionalProperties should not look in applicators"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"allOf":[{"properties":{"foo":{}}}],"additionalProperties":{"type":"boolean"}}'.
	"properties defined in allOf are not examined"
	data := NeoJSONReader fromString: '{"foo":1,"bar":true}'.
	self should: [ schema validate: data ] raise: JSONSchemaError