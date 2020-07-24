as yet unclassified
testMaxLengthValidation
	"maxLength validation"

	| schema data |
	schema := JSONSchema fromString: '{"maxLength":2}'.
	"shorter is valid"
	data := NeoJSONReader fromString: '"f"'.
	schema validate: data.
	"exact length is valid"
	data := NeoJSONReader fromString: '"fo"'.
	schema validate: data.
	"too long is invalid"
	data := NeoJSONReader fromString: '"foo"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"ignores non-strings"
	data := NeoJSONReader fromString: '100'.
	schema validate: data.
	"two supplementary Unicode code points is long enough"
	data := NeoJSONReader fromString: '"💩💩"'.
	schema validate: data