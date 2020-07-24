as yet unclassified
testRefToBooleanSchemaFalse
	"$ref to boolean schema false"

	| schema data |
	schema := JSONSchema
		fromString: '{"$ref":"#/definitions/bool","definitions":{"bool":false}}'.
	"any value is invalid"
	data := NeoJSONReader fromString: '"foo"'.
	self should: [ schema validate: data ] raise: JSONSchemaError