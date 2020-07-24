as yet unclassified
testECMA262RegexDoesNotMatchTrailingNewline
	"ECMA 262 regex $ does not match trailing newline"

	| schema data |
	schema := JSONSchema
		fromString: '{"pattern":"^abc$","type":"string"}'.
	"matches in Python, but should not in jsonschema"
	data := NeoJSONReader fromString: '"abc\n"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"should match"
	data := NeoJSONReader fromString: '"abc"'.
	schema validate: data