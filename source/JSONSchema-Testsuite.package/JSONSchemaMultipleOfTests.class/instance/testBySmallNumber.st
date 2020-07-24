as yet unclassified
testBySmallNumber
	"by small number"

	| schema data |
	schema := JSONSchema fromString: '{"multipleOf":0.0001}'.
	"0.0075 is multiple of 0.0001"
	data := NeoJSONReader fromString: '0.0075'.
	schema validate: data.
	"0.00751 is not multiple of 0.0001"
	data := NeoJSONReader fromString: '0.00751'.
	self should: [ schema validate: data ] raise: JSONSchemaError