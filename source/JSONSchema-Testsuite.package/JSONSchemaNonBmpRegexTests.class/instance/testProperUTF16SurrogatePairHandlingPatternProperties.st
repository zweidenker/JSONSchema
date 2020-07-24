as yet unclassified
testProperUTF16SurrogatePairHandlingPatternProperties
	"Proper UTF-16 surrogate pair handling: patternProperties"

	| schema data |
	schema := JSONSchema
		fromString: '{"patternProperties":{"^🐲*$":{"type":"integer"}}}'.
	"matches empty"
	data := NeoJSONReader fromString: '{"":1}'.
	schema validate: data.
	"matches single"
	data := NeoJSONReader fromString: '{"🐲":1}'.
	schema validate: data.
	"matches two"
	data := NeoJSONReader fromString: '{"🐲🐲":1}'.
	schema validate: data.
	"doesn't match one"
	data := NeoJSONReader fromString: '{"🐲":"hello"}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"doesn't match two"
	data := NeoJSONReader fromString: '{"🐲🐲":"hello"}'.
	self should: [ schema validate: data ] raise: JSONSchemaError