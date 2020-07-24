as yet unclassified
testIfAndThenWithoutElse
	"if and then without else"

	| schema data |
	schema := JSONSchema
		fromString: '{"then":{"minimum":-10},"if":{"exclusiveMaximum":0}}'.
	"valid through then"
	data := NeoJSONReader fromString: '-1'.
	schema validate: data.
	"invalid through then"
	data := NeoJSONReader fromString: '-100'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"valid when if test fails"
	data := NeoJSONReader fromString: '3'.
	schema validate: data