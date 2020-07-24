as yet unclassified
testNotMoreComplexSchema
	"not more complex schema"

	| schema data |
	schema := JSONSchema
		fromString: '{"not":{"properties":{"foo":{"type":"string"}},"type":"object"}}'.
	"match"
	data := NeoJSONReader fromString: '1'.
	schema validate: data.
	"other match"
	data := NeoJSONReader fromString: '{"foo":1}'.
	schema validate: data.
	"mismatch"
	data := NeoJSONReader fromString: '{"foo":"bar"}'.
	self should: [ schema validate: data ] raise: JSONSchemaError