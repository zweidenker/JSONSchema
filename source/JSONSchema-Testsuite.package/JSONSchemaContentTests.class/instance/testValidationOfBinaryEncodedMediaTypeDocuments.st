as yet unclassified
testValidationOfBinaryEncodedMediaTypeDocuments
	"validation of binary-encoded media type documents"

	| schema data |
	schema := JSONSchema
		fromString: '{"contentEncoding":"base64","contentMediaType":"application/json"}'.
	"a valid base64-encoded JSON document"
	data := NeoJSONReader fromString: '"eyJmb28iOiAiYmFyIn0K"'.
	schema validate: data.
	"a validly-encoded invalid JSON document"
	data := NeoJSONReader fromString: '"ezp9Cg=="'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an invalid base64 string that is valid JSON"
	data := NeoJSONReader fromString: '"{}"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"ignores non-strings"
	data := NeoJSONReader fromString: '100'.
	schema validate: data