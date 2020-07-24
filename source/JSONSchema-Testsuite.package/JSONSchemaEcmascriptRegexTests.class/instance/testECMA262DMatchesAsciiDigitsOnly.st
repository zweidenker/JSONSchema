as yet unclassified
testECMA262DMatchesAsciiDigitsOnly
	"ECMA 262 \d matches ascii digits only"

	| schema data |
	schema := JSONSchema
		fromString: '{"pattern":"^\\d$","type":"string"}'.
	"ASCII zero matches"
	data := NeoJSONReader fromString: '"0"'.
	schema validate: data.
	"NKO DIGIT ZERO does not match (unlike e.g. Python)"
	data := NeoJSONReader fromString: '"߀"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"NKO DIGIT ZERO (as \u escape) does not match"
	data := NeoJSONReader fromString: '"߀"'.
	self should: [ schema validate: data ] raise: JSONSchemaError