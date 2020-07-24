as yet unclassified
testECMA262DMatchesEverythingButAsciiDigits
	"ECMA 262 \D matches everything but ascii digits"

	| schema data |
	schema := JSONSchema
		fromString: '{"pattern":"^\\D$","type":"string"}'.
	"ASCII zero does not match"
	data := NeoJSONReader fromString: '"0"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"NKO DIGIT ZERO matches (unlike e.g. Python)"
	data := NeoJSONReader fromString: '"߀"'.
	schema validate: data.
	"NKO DIGIT ZERO (as \u escape) matches"
	data := NeoJSONReader fromString: '"߀"'.
	schema validate: data