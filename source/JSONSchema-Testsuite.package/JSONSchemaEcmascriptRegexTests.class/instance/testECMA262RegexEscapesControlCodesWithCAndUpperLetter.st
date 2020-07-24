as yet unclassified
testECMA262RegexEscapesControlCodesWithCAndUpperLetter
	"ECMA 262 regex escapes control codes with \c and upper letter"

	| schema data |
	schema := JSONSchema
		fromString: '{"pattern":"^\\cC$","type":"string"}'.
	"does not match"
	data := NeoJSONReader fromString: '"\\cC"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"matches"
	data := NeoJSONReader fromString: '"\u0003"'.
	schema validate: data