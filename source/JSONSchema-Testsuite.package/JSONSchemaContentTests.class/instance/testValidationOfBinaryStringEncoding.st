as yet unclassified
testValidationOfBinaryStringEncoding
	"validation of binary string-encoding"

	| schema data |
	schema := JSONSchema fromString: '{"contentEncoding":"base64"}'.
	"a valid base64 string"
	data := NeoJSONReader fromString: '"eyJmb28iOiAiYmFyIn0K"'.
	schema validate: data.
	"an invalid base64 string (% is not a valid character)"
	data := NeoJSONReader fromString: '"eyJmb28iOi%iYmFyIn0K"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"ignores non-strings"
	data := NeoJSONReader fromString: '100'.
	schema validate: data