as yet unclassified
testUniqueItemsValidation
	"uniqueItems validation"

	| schema data |
	schema := JSONSchema fromString: '{"uniqueItems":true}'.
	"unique array of integers is valid"
	data := NeoJSONReader fromString: '[1,2]'.
	schema validate: data.
	"non-unique array of integers is invalid"
	data := NeoJSONReader fromString: '[1,1]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"numbers are unique if mathematically unequal"
	data := NeoJSONReader fromString: '[1.0,1.0,1]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"false is not equal to zero"
	data := NeoJSONReader fromString: '[0,false]'.
	schema validate: data.
	"true is not equal to one"
	data := NeoJSONReader fromString: '[1,true]'.
	schema validate: data.
	"unique array of objects is valid"
	data := NeoJSONReader fromString: '[{"foo":"bar"},{"foo":"baz"}]'.
	schema validate: data.
	"non-unique array of objects is invalid"
	data := NeoJSONReader fromString: '[{"foo":"bar"},{"foo":"bar"}]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"unique array of nested objects is valid"
	data := NeoJSONReader
		fromString: '[{"foo":{"bar":{"baz":true}}},{"foo":{"bar":{"baz":false}}}]'.
	schema validate: data.
	"non-unique array of nested objects is invalid"
	data := NeoJSONReader
		fromString: '[{"foo":{"bar":{"baz":true}}},{"foo":{"bar":{"baz":true}}}]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"unique array of arrays is valid"
	data := NeoJSONReader fromString: '[["foo"],["bar"]]'.
	schema validate: data.
	"non-unique array of arrays is invalid"
	data := NeoJSONReader fromString: '[["foo"],["foo"]]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"1 and true are unique"
	data := NeoJSONReader fromString: '[1,true]'.
	schema validate: data.
	"0 and false are unique"
	data := NeoJSONReader fromString: '[0,false]'.
	schema validate: data.
	"[1] and [true] are unique"
	data := NeoJSONReader fromString: '[[1],[true]]'.
	schema validate: data.
	"[0] and [false] are unique"
	data := NeoJSONReader fromString: '[[0],[false]]'.
	schema validate: data.
	"nested [1] and [true] are unique"
	data := NeoJSONReader fromString: '[[[1],"foo"],[[true],"foo"]]'.
	schema validate: data.
	"nested [0] and [false] are unique"
	data := NeoJSONReader fromString: '[[[0],"foo"],[[false],"foo"]]'.
	schema validate: data.
	"unique heterogeneous types are valid"
	data := NeoJSONReader fromString: '[{},[1],true,null,1,"{}"]'.
	schema validate: data.
	"non-unique heterogeneous types are invalid"
	data := NeoJSONReader fromString: '[{},[1],true,null,{},1]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"different objects are unique"
	data := NeoJSONReader fromString: '[{"a":1,"b":2},{"a":2,"b":1}]'.
	schema validate: data.
	"objects are non-unique despite key order"
	data := NeoJSONReader fromString: '[{"a":1,"b":2},{"b":2,"a":1}]'.
	self should: [ schema validate: data ] raise: JSONSchemaError