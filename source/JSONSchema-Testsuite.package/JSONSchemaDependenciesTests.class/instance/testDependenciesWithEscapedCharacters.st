as yet unclassified
testDependenciesWithEscapedCharacters
	"dependencies with escaped characters"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"dependencies":{"foo''bar":{"required":["foo\"bar"]},"foo\"bar":["foo''bar"],"foo\nbar":["foo\rbar"],"foo\tbar":{"minProperties":4}}}'.
	"valid object 1"
	data := NeoJSONReader fromString: '{"foo\nbar":1,"foo\rbar":2}'.
	schema validate: data.
	"valid object 2"
	data := NeoJSONReader fromString: '{"c":4,"a":2,"foo\tbar":1,"b":3}'.
	schema validate: data.
	"valid object 3"
	data := NeoJSONReader fromString: '{"foo''bar":1,"foo\"bar":2}'.
	schema validate: data.
	"invalid object 1"
	data := NeoJSONReader fromString: '{"foo":2,"foo\nbar":1}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"invalid object 2"
	data := NeoJSONReader fromString: '{"a":2,"foo\tbar":1}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"invalid object 3"
	data := NeoJSONReader fromString: '{"foo''bar":1}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"invalid object 4"
	data := NeoJSONReader fromString: '{"foo\"bar":2}'.
	self should: [ schema validate: data ] raise: JSONSchemaError