as yet unclassified
testFloatComparisonWithHighPrecisionOnNegativeNumbers
	"float comparison with high precision on negative numbers"

	| schema data |
	schema := JSONSchema
		fromString: '{"exclusiveMinimum":-9.727837981879871e26}'.
	"comparison works for very negative numbers"
	data := NeoJSONReader fromString: '-9.727837981879871e26'.
	self should: [ schema validate: data ] raise: JSONSchemaError