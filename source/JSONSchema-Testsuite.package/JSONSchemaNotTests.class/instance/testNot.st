as yet unclassified
testNot
	"not"

	| schema data |
	schema := JSONSchema fromString: '{"not":{"type":"integer"}}'.
	"allowed"
	data := NeoJSONReader fromString: '"foo"'.
	schema validate: data.
	"disallowed"
	data := NeoJSONReader fromString: '1'.
	self should: [ schema validate: data ] raise: JSONSchemaError