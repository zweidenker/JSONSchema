as yet unclassified
testValidationOfRelativeJSONPointersRJP
	"validation of Relative JSON Pointers (RJP)"

	| schema data |
	schema := JSONSchema fromString: '{"format":"relative-json-pointer"}'.
	"a valid upwards RJP"
	data := NeoJSONReader fromString: '"1"'.
	schema validate: data.
	"a valid downwards RJP"
	data := NeoJSONReader fromString: '"0/foo/bar"'.
	schema validate: data.
	"a valid up and then down RJP, with array index"
	data := NeoJSONReader fromString: '"2/0/baz/1/zip"'.
	schema validate: data.
	"a valid RJP taking the member or index name"
	data := NeoJSONReader fromString: '"0#"'.
	schema validate: data.
	"an invalid RJP that is a valid JSON Pointer"
	data := NeoJSONReader fromString: '"/foo/bar"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"negative prefix"
	data := NeoJSONReader fromString: '"-1/foo/bar"'.
	self should: [ schema validate: data ] raise: JSONSchemaError