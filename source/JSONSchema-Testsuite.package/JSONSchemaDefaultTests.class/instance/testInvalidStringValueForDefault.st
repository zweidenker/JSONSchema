as yet unclassified
testInvalidStringValueForDefault
	"invalid string value for default"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"properties":{"bar":{"minLength":4,"default":"bad","type":"string"}}}'.
	"valid when property is specified"
	data := NeoJSONReader fromString: '{"bar":"good"}'.
	schema validate: data.
	"still valid when the invalid default is used"
	data := NeoJSONReader fromString: '{}'.
	schema validate: data