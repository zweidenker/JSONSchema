as yet unclassified
testAllOfSimpleTypes
	"allOf simple types"

	| schema data |
	schema := JSONSchema
		fromString: '{"allOf":[{"maximum":30},{"minimum":20}]}'.
	"valid"
	data := NeoJSONReader fromString: '25'.
	schema validate: data.
	"mismatch one"
	data := NeoJSONReader fromString: '35'.
	self should: [ schema validate: data ] raise: JSONSchemaError