as yet unclassified
testECMA262WMatchesEverythingButAsciiLetters
	"ECMA 262 \W matches everything but ascii letters"

	| schema data |
	schema := JSONSchema
		fromString: '{"pattern":"^\\W$","type":"string"}'.
	"ASCII 'a' does not match"
	data := NeoJSONReader fromString: '"a"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"latin-1 e-acute matches (unlike e.g. Python)"
	data := NeoJSONReader fromString: '"é"'.
	schema validate: data