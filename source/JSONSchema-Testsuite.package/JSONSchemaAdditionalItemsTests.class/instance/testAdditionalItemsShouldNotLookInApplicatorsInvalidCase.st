as yet unclassified
testAdditionalItemsShouldNotLookInApplicatorsInvalidCase
	"additionalItems should not look in applicators, invalid case"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"allOf":[{"items":[{"type":"integer"},{"type":"string"}]}],"items":[{"type":"integer"}],"additionalItems":{"type":"boolean"}}'.
	"items defined in allOf are not examined"
	data := NeoJSONReader fromString: '[1,"hello"]'.
	self should: [ schema validate: data ] raise: JSONSchemaError