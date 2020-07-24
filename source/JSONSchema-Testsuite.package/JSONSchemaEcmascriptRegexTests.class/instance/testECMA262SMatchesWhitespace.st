as yet unclassified
testECMA262SMatchesWhitespace
	"ECMA 262 \s matches whitespace"

	| schema data |
	schema := JSONSchema
		fromString: '{"pattern":"^\\s$","type":"string"}'.
	"ASCII space matches"
	data := NeoJSONReader fromString: '" "'.
	schema validate: data.
	"Character tabulation matches"
	data := NeoJSONReader fromString: '"\t"'.
	schema validate: data.
	"Line tabulation matches"
	data := NeoJSONReader fromString: '"\u000B"'.
	schema validate: data.
	"Form feed matches"
	data := NeoJSONReader fromString: '"\f"'.
	schema validate: data.
	"latin-1 non-breaking-space matches"
	data := NeoJSONReader fromString: '" "'.
	schema validate: data.
	"zero-width whitespace matches"
	data := NeoJSONReader fromString: '""'.
	schema validate: data.
	"line feed matches (line terminator)"
	data := NeoJSONReader fromString: '"\n"'.
	schema validate: data.
	"paragraph separator matches (line terminator)"
	data := NeoJSONReader fromString: '" "'.
	schema validate: data.
	"EM SPACE matches (Space_Separator)"
	data := NeoJSONReader fromString: '" "'.
	schema validate: data.
	"Non-whitespace control does not match"
	data := NeoJSONReader fromString: '"\u0001"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"Non-whitespace does not match"
	data := NeoJSONReader fromString: '"–"'.
	self should: [ schema validate: data ] raise: JSONSchemaError