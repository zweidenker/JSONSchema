as yet unclassified
testAdditionalItemsShouldNotLookInApplicatorsValidCase
	"additionalItems should not look in applicators, valid case"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"allOf":[{"items":[{"type":"integer"}]}],"additionalItems":{"type":"boolean"}}'.
	"items defined in allOf are not examined"
	data := NeoJSONReader fromString: '[1,null]'.
	schema validate: data