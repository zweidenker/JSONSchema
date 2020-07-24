as yet unclassified
testRequiredWithEmptyArray
	"required with empty array"

	| schema data |
	schema := JSONSchema
		fromString: '{"properties":{"foo":{}},"required":[]}'.
	"property not required"
	data := NeoJSONReader fromString: '{}'.
	schema validate: data