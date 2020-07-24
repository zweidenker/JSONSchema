as yet unclassified
testMaxItemsValidation
	"maxItems validation"

	| schema data |
	schema := JSONSchema fromString: '{"maxItems":2}'.
	"shorter is valid"
	data := NeoJSONReader fromString: '[1]'.
	schema validate: data.
	"exact length is valid"
	data := NeoJSONReader fromString: '[1,2]'.
	schema validate: data.
	"too long is invalid"
	data := NeoJSONReader fromString: '[1,2,3]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"ignores non-arrays"
	data := NeoJSONReader fromString: '"foobar"'.
	schema validate: data