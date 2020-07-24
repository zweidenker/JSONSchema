as yet unclassified
testNestedAnyOfToCheckValidationSemantics
	"nested anyOf, to check validation semantics"

	| schema data |
	schema := JSONSchema
		fromString: '{"anyOf":[{"anyOf":[{"type":"null"}]}]}'.
	"null is valid"
	data := NeoJSONReader fromString: 'null'.
	schema validate: data.
	"anything non-null is invalid"
	data := NeoJSONReader fromString: '123'.
	self should: [ schema validate: data ] raise: JSONSchemaError