as yet unclassified
testPropertiesPatternPropertiesAdditionalPropertiesInteraction
	"properties, patternProperties, additionalProperties interaction"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"properties":{"foo":{"maxItems":3,"type":"array"},"bar":{"type":"array"}},"patternProperties":{"f.o":{"minItems":2}},"additionalProperties":{"type":"integer"}}'.
	"property validates property"
	data := NeoJSONReader fromString: '{"foo":[1,2]}'.
	schema validate: data.
	"property invalidates property"
	data := NeoJSONReader fromString: '{"foo":[1,2,3,4]}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"patternProperty invalidates property"
	data := NeoJSONReader fromString: '{"foo":[]}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"patternProperty validates nonproperty"
	data := NeoJSONReader fromString: '{"fxo":[1,2]}'.
	schema validate: data.
	"patternProperty invalidates nonproperty"
	data := NeoJSONReader fromString: '{"fxo":[]}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"additionalProperty ignores property"
	data := NeoJSONReader fromString: '{"bar":[]}'.
	schema validate: data.
	"additionalProperty validates others"
	data := NeoJSONReader fromString: '{"quux":3}'.
	schema validate: data.
	"additionalProperty invalidates others"
	data := NeoJSONReader fromString: '{"quux":"foo"}'.
	self should: [ schema validate: data ] raise: JSONSchemaError