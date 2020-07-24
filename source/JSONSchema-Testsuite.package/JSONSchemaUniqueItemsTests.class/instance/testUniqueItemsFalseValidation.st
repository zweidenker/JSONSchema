as yet unclassified
testUniqueItemsFalseValidation
	"uniqueItems=false validation"

	| schema data |
	schema := JSONSchema fromString: '{"uniqueItems":false}'.
	"unique array of integers is valid"
	data := NeoJSONReader fromString: '[1,2]'.
	schema validate: data.
	"non-unique array of integers is valid"
	data := NeoJSONReader fromString: '[1,1]'.
	schema validate: data.
	"numbers are unique if mathematically unequal"
	data := NeoJSONReader fromString: '[1.0,1.0,1]'.
	schema validate: data.
	"false is not equal to zero"
	data := NeoJSONReader fromString: '[0,false]'.
	schema validate: data.
	"true is not equal to one"
	data := NeoJSONReader fromString: '[1,true]'.
	schema validate: data.
	"unique array of objects is valid"
	data := NeoJSONReader fromString: '[{"foo":"bar"},{"foo":"baz"}]'.
	schema validate: data.
	"non-unique array of objects is valid"
	data := NeoJSONReader fromString: '[{"foo":"bar"},{"foo":"bar"}]'.
	schema validate: data.
	"unique array of nested objects is valid"
	data := NeoJSONReader
		fromString: '[{"foo":{"bar":{"baz":true}}},{"foo":{"bar":{"baz":false}}}]'.
	schema validate: data.
	"non-unique array of nested objects is valid"
	data := NeoJSONReader
		fromString: '[{"foo":{"bar":{"baz":true}}},{"foo":{"bar":{"baz":true}}}]'.
	schema validate: data.
	"unique array of arrays is valid"
	data := NeoJSONReader fromString: '[["foo"],["bar"]]'.
	schema validate: data.
	"non-unique array of arrays is valid"
	data := NeoJSONReader fromString: '[["foo"],["foo"]]'.
	schema validate: data.
	"1 and true are unique"
	data := NeoJSONReader fromString: '[1,true]'.
	schema validate: data.
	"0 and false are unique"
	data := NeoJSONReader fromString: '[0,false]'.
	schema validate: data.
	"unique heterogeneous types are valid"
	data := NeoJSONReader fromString: '[{},[1],true,null,1]'.
	schema validate: data.
	"non-unique heterogeneous types are valid"
	data := NeoJSONReader fromString: '[{},[1],true,null,{},1]'.
	schema validate: data