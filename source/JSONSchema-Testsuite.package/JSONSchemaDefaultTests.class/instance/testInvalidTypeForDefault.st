as yet unclassified
testInvalidTypeForDefault
	"invalid type for default"

	| schema data |
	schema := JSONSchema
		fromString: '{"properties":{"foo":{"default":[],"type":"integer"}}}'.
	"valid when property is specified"
	data := NeoJSONReader fromString: '{"foo":13}'.
	schema validate: data.
	"still valid when the invalid default is used"
	data := NeoJSONReader fromString: '{}'.
	schema validate: data