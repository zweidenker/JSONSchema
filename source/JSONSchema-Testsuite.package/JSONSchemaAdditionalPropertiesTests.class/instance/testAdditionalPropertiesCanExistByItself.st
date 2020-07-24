as yet unclassified
testAdditionalPropertiesCanExistByItself
	"additionalProperties can exist by itself"

	| schema data |
	schema := JSONSchema
		fromString: '{"additionalProperties":{"type":"boolean"}}'.
	"an additional valid property is valid"
	data := NeoJSONReader fromString: '{"foo":true}'.
	schema validate: data.
	"an additional invalid property is invalid"
	data := NeoJSONReader fromString: '{"foo":1}'.
	self should: [ schema validate: data ] raise: JSONSchemaError