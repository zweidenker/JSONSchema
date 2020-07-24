as yet unclassified
testValidationOfRegularExpressions
	"validation of regular expressions"

	| schema data |
	schema := JSONSchema fromString: '{"format":"regex"}'.
	"a valid regular expression"
	data := NeoJSONReader fromString: '"([abc])+\\s+$"'.
	schema validate: data.
	"a regular expression with unclosed parens is invalid"
	data := NeoJSONReader fromString: '"^(abc]"'.
	self should: [ schema validate: data ] raise: JSONSchemaError