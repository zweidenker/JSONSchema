as yet unclassified
testRequiredDefaultValidation
	"required default validation"

	| schema data |
	schema := JSONSchema fromString: '{"properties":{"foo":{}}}'.
	"not required by default"
	data := NeoJSONReader fromString: '{}'.
	schema validate: data