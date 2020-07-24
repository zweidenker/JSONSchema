as yet unclassified
testECMA262RegexConvertsTToHorizontalTab
	"ECMA 262 regex converts \t to horizontal tab"

	| schema data |
	schema := JSONSchema
		fromString: '{"pattern":"^\\t$","type":"string"}'.
	"does not match"
	data := NeoJSONReader fromString: '"\\t"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"matches"
	data := NeoJSONReader fromString: '"\t"'.
	schema validate: data