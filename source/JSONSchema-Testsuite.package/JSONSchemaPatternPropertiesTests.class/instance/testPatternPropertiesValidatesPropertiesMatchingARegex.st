as yet unclassified
testPatternPropertiesValidatesPropertiesMatchingARegex
	"patternProperties validates properties matching a regex"

	| schema data |
	schema := JSONSchema
		fromString: '{"patternProperties":{"f.*o":{"type":"integer"}}}'.
	"a single valid match is valid"
	data := NeoJSONReader fromString: '{"foo":1}'.
	schema validate: data.
	"multiple valid matches is valid"
	data := NeoJSONReader fromString: '{"foo":1,"foooooo":2}'.
	schema validate: data.
	"a single invalid match is invalid"
	data := NeoJSONReader fromString: '{"fooooo":2,"foo":"bar"}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"multiple invalid matches is invalid"
	data := NeoJSONReader fromString: '{"foo":"bar","foooooo":"baz"}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"ignores arrays"
	data := NeoJSONReader fromString: '["foo"]'.
	schema validate: data.
	"ignores strings"
	data := NeoJSONReader fromString: '"foo"'.
	schema validate: data.
	"ignores other non-objects"
	data := NeoJSONReader fromString: '12'.
	schema validate: data