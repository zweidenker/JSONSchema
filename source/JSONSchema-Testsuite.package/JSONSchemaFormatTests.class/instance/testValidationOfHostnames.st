as yet unclassified
testValidationOfHostnames
	"validation of hostnames"

	| schema data |
	schema := JSONSchema fromString: '{"format":"hostname"}'.
	"ignores integers"
	data := NeoJSONReader fromString: '12'.
	schema validate: data.
	"ignores floats"
	data := NeoJSONReader fromString: '13.7'.
	schema validate: data.
	"ignores objects"
	data := NeoJSONReader fromString: '{}'.
	schema validate: data.
	"ignores arrays"
	data := NeoJSONReader fromString: '[]'.
	schema validate: data.
	"ignores booleans"
	data := NeoJSONReader fromString: 'false'.
	schema validate: data.
	"ignores null"
	data := NeoJSONReader fromString: 'null'.
	schema validate: data