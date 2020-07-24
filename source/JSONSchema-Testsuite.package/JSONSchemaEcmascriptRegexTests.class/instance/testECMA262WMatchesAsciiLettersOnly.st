as yet unclassified
testECMA262WMatchesAsciiLettersOnly
	"ECMA 262 \w matches ascii letters only"

	| schema data |
	schema := JSONSchema
		fromString: '{"pattern":"^\\w$","type":"string"}'.
	"ASCII 'a' matches"
	data := NeoJSONReader fromString: '"a"'.
	schema validate: data.
	"latin-1 e-acute does not match (unlike e.g. Python)"
	data := NeoJSONReader fromString: '"é"'.
	self should: [ schema validate: data ] raise: JSONSchemaError