as yet unclassified
testConstWith20MatchesIntegerAndFloatTypes
	"const with -2.0 matches integer and float types"

	| schema data |
	schema := JSONSchema fromString: '{"const":-2.0}'.
	"integer -2 is valid"
	data := NeoJSONReader fromString: '-2'.
	schema validate: data.
	"integer 2 is invalid"
	data := NeoJSONReader fromString: '2'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"float -2.0 is valid"
	data := NeoJSONReader fromString: '-2.0'.
	schema validate: data.
	"float 2.0 is invalid"
	data := NeoJSONReader fromString: '2.0'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"float -2.00001 is invalid"
	data := NeoJSONReader fromString: '-2.00001'.
	self should: [ schema validate: data ] raise: JSONSchemaError