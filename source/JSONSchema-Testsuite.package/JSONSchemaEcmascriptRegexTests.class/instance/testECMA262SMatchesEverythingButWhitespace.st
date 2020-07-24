as yet unclassified
testECMA262SMatchesEverythingButWhitespace
	"ECMA 262 \S matches everything but whitespace"

	| schema data |
	schema := JSONSchema
		fromString: '{"pattern":"^\\S$","type":"string"}'.
	"ASCII space does not match"
	data := NeoJSONReader fromString: '" "'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"Character tabulation does not match"
	data := NeoJSONReader fromString: '"\t"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"Line tabulation does not match"
	data := NeoJSONReader fromString: '"\u000B"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"Form feed does not match"
	data := NeoJSONReader fromString: '"\f"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"latin-1 non-breaking-space does not match"
	data := NeoJSONReader fromString: '" "'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"zero-width whitespace does not match"
	data := NeoJSONReader fromString: '""'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"line feed does not match (line terminator)"
	data := NeoJSONReader fromString: '"\n"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"paragraph separator does not match (line terminator)"
	data := NeoJSONReader fromString: '" "'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"EM SPACE does not match (Space_Separator)"
	data := NeoJSONReader fromString: '" "'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"Non-whitespace control matches"
	data := NeoJSONReader fromString: '"\u0001"'.
	schema validate: data.
	"Non-whitespace matches"
	data := NeoJSONReader fromString: '"–"'.
	schema validate: data