as yet unclassified
testNulCharactersInStrings
	"nul characters in strings"

	| schema data |
	schema := JSONSchema fromString: '{"enum":["hello\u0000there"]}'.
	"match string with nul"
	data := NeoJSONReader fromString: '"hello\u0000there"'.
	schema validate: data.
	"do not match string lacking nul"
	data := NeoJSONReader fromString: '"hellothere"'.
	self should: [ schema validate: data ] raise: JSONSchemaError