as yet unclassified
testASchemaGivenForItems
	"a schema given for items"

	| schema data |
	schema := JSONSchema fromString: '{"items":{"type":"integer"}}'.
	"valid items"
	data := NeoJSONReader fromString: '[1,2,3]'.
	schema validate: data.
	"wrong type of items"
	data := NeoJSONReader fromString: '[1,"x"]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"ignores non-arrays"
	data := NeoJSONReader fromString: '{"foo":"bar"}'.
	schema validate: data.
	"JavaScript pseudo-array is valid"
	data := NeoJSONReader fromString: '{"0":"invalid","length":1}'.
	schema validate: data