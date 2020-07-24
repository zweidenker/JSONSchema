as yet unclassified
testPropertyNamedRefContainingAnActualRef
	"property named $ref, containing an actual $ref"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"definitions":{"is-string":{"type":"string"}},"properties":{"$ref":{"$ref":"#/definitions/is-string"}}}'.
	"property named $ref valid"
	data := NeoJSONReader fromString: '{"$ref":"a"}'.
	schema validate: data.
	"property named $ref invalid"
	data := NeoJSONReader fromString: '{"$ref":2}'.
	self should: [ schema validate: data ] raise: JSONSchemaError