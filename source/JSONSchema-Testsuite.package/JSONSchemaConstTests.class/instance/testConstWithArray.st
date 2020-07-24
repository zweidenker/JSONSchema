as yet unclassified
testConstWithArray
	"const with array"

	| schema data |
	schema := JSONSchema fromString: '{"const":[{"foo":"bar"}]}'.
	"same array is valid"
	data := NeoJSONReader fromString: '[{"foo":"bar"}]'.
	schema validate: data.
	"another array item is invalid"
	data := NeoJSONReader fromString: '[2]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"array with additional items is invalid"
	data := NeoJSONReader fromString: '[1,2,3]'.
	self should: [ schema validate: data ] raise: JSONSchemaError