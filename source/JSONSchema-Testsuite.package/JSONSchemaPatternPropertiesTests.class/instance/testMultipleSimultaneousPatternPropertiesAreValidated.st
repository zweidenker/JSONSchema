as yet unclassified
testMultipleSimultaneousPatternPropertiesAreValidated
	"multiple simultaneous patternProperties are validated"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"patternProperties":{"a*":{"type":"integer"},"aaa*":{"maximum":20}}}'.
	"a single valid match is valid"
	data := NeoJSONReader fromString: '{"a":21}'.
	schema validate: data.
	"a simultaneous match is valid"
	data := NeoJSONReader fromString: '{"aaaa":18}'.
	schema validate: data.
	"multiple matches is valid"
	data := NeoJSONReader fromString: '{"a":21,"aaaa":18}'.
	schema validate: data.
	"an invalid due to one is invalid"
	data := NeoJSONReader fromString: '{"a":"bar"}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an invalid due to the other is invalid"
	data := NeoJSONReader fromString: '{"aaaa":31}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an invalid due to both is invalid"
	data := NeoJSONReader fromString: '{"aaa":"foo","aaaa":31}'.
	self should: [ schema validate: data ] raise: JSONSchemaError