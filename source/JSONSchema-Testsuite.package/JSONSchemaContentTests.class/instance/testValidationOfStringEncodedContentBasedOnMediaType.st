as yet unclassified
testValidationOfStringEncodedContentBasedOnMediaType
	"validation of string-encoded content based on media type"

	| schema data |
	schema := JSONSchema
		fromString: '{"contentMediaType":"application/json"}'.
	"a valid JSON document"
	data := NeoJSONReader fromString: '"{\"foo\": \"bar\"}"'.
	schema validate: data.
	"an invalid JSON document"
	data := NeoJSONReader fromString: '"{:}"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"ignores non-strings"
	data := NeoJSONReader fromString: '100'.
	schema validate: data