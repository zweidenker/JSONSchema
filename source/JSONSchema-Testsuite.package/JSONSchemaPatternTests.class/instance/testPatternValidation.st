as yet unclassified
testPatternValidation
	"pattern validation"

	| schema data |
	schema := JSONSchema fromString: '{"pattern":"^a*$"}'.
	"a matching pattern is valid"
	data := NeoJSONReader fromString: '"aaa"'.
	schema validate: data.
	"a non-matching pattern is invalid"
	data := NeoJSONReader fromString: '"abc"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"ignores booleans"
	data := NeoJSONReader fromString: 'true'.
	schema validate: data.
	"ignores integers"
	data := NeoJSONReader fromString: '123'.
	schema validate: data.
	"ignores floats"
	data := NeoJSONReader fromString: '1.0'.
	schema validate: data.
	"ignores objects"
	data := NeoJSONReader fromString: '{}'.
	schema validate: data.
	"ignores arrays"
	data := NeoJSONReader fromString: '[]'.
	schema validate: data.
	"ignores null"
	data := NeoJSONReader fromString: 'null'.
	schema validate: data