as yet unclassified
testIfAndElseWithoutThen
	"if and else without then"

	| schema data |
	schema := JSONSchema
		fromString: '{"else":{"multipleOf":2},"if":{"exclusiveMaximum":0}}'.
	"valid when if test passes"
	data := NeoJSONReader fromString: '-1'.
	schema validate: data.
	"valid through else"
	data := NeoJSONReader fromString: '4'.
	schema validate: data.
	"invalid through else"
	data := NeoJSONReader fromString: '3'.
	self should: [ schema validate: data ] raise: JSONSchemaError