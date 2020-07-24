as yet unclassified
testPropertyNamedRefThatIsNotAReference
	"property named $ref that is not a reference"

	| schema data |
	schema := JSONSchema
		fromString: '{"properties":{"$ref":{"type":"string"}}}'.
	"property named $ref valid"
	data := NeoJSONReader fromString: '{"$ref":"a"}'.
	schema validate: data.
	"property named $ref invalid"
	data := NeoJSONReader fromString: '{"$ref":2}'.
	self should: [ schema validate: data ] raise: JSONSchemaError