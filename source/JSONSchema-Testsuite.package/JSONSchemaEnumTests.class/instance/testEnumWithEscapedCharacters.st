as yet unclassified
testEnumWithEscapedCharacters
	"enum with escaped characters"

	| schema data |
	schema := JSONSchema fromString: '{"enum":["foo\nbar","foo\rbar"]}'.
	"member 1 is valid"
	data := NeoJSONReader fromString: '"foo\nbar"'.
	schema validate: data.
	"member 2 is valid"
	data := NeoJSONReader fromString: '"foo\rbar"'.
	schema validate: data.
	"another string is invalid"
	data := NeoJSONReader fromString: '"abc"'.
	self should: [ schema validate: data ] raise: JSONSchemaError