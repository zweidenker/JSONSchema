as yet unclassified
testMinLengthValidation
	"minLength validation"

	| schema data |
	schema := JSONSchema fromString: '{"minLength":2}'.
	"longer is valid"
	data := NeoJSONReader fromString: '"foo"'.
	schema validate: data.
	"exact length is valid"
	data := NeoJSONReader fromString: '"fo"'.
	schema validate: data.
	"too short is invalid"
	data := NeoJSONReader fromString: '"f"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"ignores non-strings"
	data := NeoJSONReader fromString: '1'.
	schema validate: data.
	"one supplementary Unicode code point is not long enough"
	data := NeoJSONReader fromString: '"💩"'.
	self should: [ schema validate: data ] raise: JSONSchemaError