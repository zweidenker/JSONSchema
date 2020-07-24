as yet unclassified
testFloatComparisonWithHighPrecision
	"float comparison with high precision"

	| schema data |
	schema := JSONSchema
		fromString: '{"exclusiveMaximum":9.727837981879871e26}'.
	"comparison works for high numbers"
	data := NeoJSONReader fromString: '9.727837981879871e26'.
	self should: [ schema validate: data ] raise: JSONSchemaError