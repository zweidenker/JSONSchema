as yet unclassified
testByInt
	"by int"

	| schema data |
	schema := JSONSchema fromString: '{"multipleOf":2}'.
	"int by int"
	data := NeoJSONReader fromString: '10'.
	schema validate: data.
	"int by int fail"
	data := NeoJSONReader fromString: '7'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"ignores non-numbers"
	data := NeoJSONReader fromString: '"foo"'.
	schema validate: data