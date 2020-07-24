as yet unclassified
testAllOfCombinedWithAnyOfOneOf
	"allOf combined with anyOf, oneOf"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"allOf":[{"multipleOf":2}],"oneOf":[{"multipleOf":5}],"anyOf":[{"multipleOf":3}]}'.
	"allOf: false, anyOf: false, oneOf: false"
	data := NeoJSONReader fromString: '1'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"allOf: false, anyOf: false, oneOf: true"
	data := NeoJSONReader fromString: '5'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"allOf: false, anyOf: true, oneOf: false"
	data := NeoJSONReader fromString: '3'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"allOf: false, anyOf: true, oneOf: true"
	data := NeoJSONReader fromString: '15'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"allOf: true, anyOf: false, oneOf: false"
	data := NeoJSONReader fromString: '2'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"allOf: true, anyOf: false, oneOf: true"
	data := NeoJSONReader fromString: '10'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"allOf: true, anyOf: true, oneOf: false"
	data := NeoJSONReader fromString: '6'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"allOf: true, anyOf: true, oneOf: true"
	data := NeoJSONReader fromString: '30'.
	schema validate: data