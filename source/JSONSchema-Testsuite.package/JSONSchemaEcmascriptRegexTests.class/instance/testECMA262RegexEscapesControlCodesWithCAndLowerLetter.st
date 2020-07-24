as yet unclassified
testECMA262RegexEscapesControlCodesWithCAndLowerLetter
	"ECMA 262 regex escapes control codes with \c and lower letter"

	| schema data |
	schema := JSONSchema
		fromString: '{"pattern":"^\\cc$","type":"string"}'.
	"does not match"
	data := NeoJSONReader fromString: '"\\cc"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"matches"
	data := NeoJSONReader fromString: '"\u0003"'.
	schema validate: data