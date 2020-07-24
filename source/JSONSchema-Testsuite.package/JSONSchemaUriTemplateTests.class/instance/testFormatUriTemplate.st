as yet unclassified
testFormatUriTemplate
	"format: uri-template"

	| schema data |
	schema := JSONSchema fromString: '{"format":"uri-template"}'.
	"a valid uri-template"
	data := NeoJSONReader
		fromString: '"http://example.com/dictionary/{term:1}/{term}"'.
	schema validate: data.
	"an invalid uri-template"
	data := NeoJSONReader
		fromString: '"http://example.com/dictionary/{term:1}/{term"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"a valid uri-template without variables"
	data := NeoJSONReader fromString: '"http://example.com/dictionary"'.
	schema validate: data.
	"a valid relative uri-template"
	data := NeoJSONReader fromString: '"dictionary/{term:1}/{term}"'.
	schema validate: data