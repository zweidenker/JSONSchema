as yet unclassified
testBooleanSchemaTrue
	"boolean schema 'true'"

	| schema data |
	schema := JSONSchema fromString: 'true'.
	"number is valid"
	data := NeoJSONReader fromString: '1'.
	schema validate: data.
	"string is valid"
	data := NeoJSONReader fromString: '"foo"'.
	schema validate: data.
	"boolean true is valid"
	data := NeoJSONReader fromString: 'true'.
	schema validate: data.
	"boolean false is valid"
	data := NeoJSONReader fromString: 'false'.
	schema validate: data.
	"null is valid"
	data := NeoJSONReader fromString: 'null'.
	schema validate: data.
	"object is valid"
	data := NeoJSONReader fromString: '{"foo":"bar"}'.
	schema validate: data.
	"empty object is valid"
	data := NeoJSONReader fromString: '{}'.
	schema validate: data.
	"array is valid"
	data := NeoJSONReader fromString: '["foo"]'.
	schema validate: data.
	"empty array is valid"
	data := NeoJSONReader fromString: '[]'.
	schema validate: data