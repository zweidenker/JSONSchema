as yet unclassified
testNotMultipleTypes
	"not multiple types"

	| schema data |
	schema := JSONSchema
		fromString: '{"not":{"type":["integer","boolean"]}}'.
	"valid"
	data := NeoJSONReader fromString: '"foo"'.
	schema validate: data.
	"mismatch"
	data := NeoJSONReader fromString: '1'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"other mismatch"
	data := NeoJSONReader fromString: 'true'.
	self should: [ schema validate: data ] raise: JSONSchemaError