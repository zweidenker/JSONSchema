as yet unclassified
testValidationOfJSONPointersJSONStringRepresentation
	"validation of JSON-pointers (JSON String Representation)"

	| schema data |
	schema := JSONSchema fromString: '{"format":"json-pointer"}'.
	"a valid JSON-pointer"
	data := NeoJSONReader fromString: '"/foo/bar~0/baz~1/%a"'.
	schema validate: data.
	"not a valid JSON-pointer (~ not escaped)"
	data := NeoJSONReader fromString: '"/foo/bar~"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"valid JSON-pointer with empty segment"
	data := NeoJSONReader fromString: '"/foo//bar"'.
	schema validate: data.
	"valid JSON-pointer with the last empty segment"
	data := NeoJSONReader fromString: '"/foo/bar/"'.
	schema validate: data.
	"valid JSON-pointer as stated in RFC 6901 #1"
	data := NeoJSONReader fromString: '""'.
	schema validate: data.
	"valid JSON-pointer as stated in RFC 6901 #2"
	data := NeoJSONReader fromString: '"/foo"'.
	schema validate: data.
	"valid JSON-pointer as stated in RFC 6901 #3"
	data := NeoJSONReader fromString: '"/foo/0"'.
	schema validate: data.
	"valid JSON-pointer as stated in RFC 6901 #4"
	data := NeoJSONReader fromString: '"/"'.
	schema validate: data.
	"valid JSON-pointer as stated in RFC 6901 #5"
	data := NeoJSONReader fromString: '"/a~1b"'.
	schema validate: data.
	"valid JSON-pointer as stated in RFC 6901 #6"
	data := NeoJSONReader fromString: '"/c%d"'.
	schema validate: data.
	"valid JSON-pointer as stated in RFC 6901 #7"
	data := NeoJSONReader fromString: '"/e^f"'.
	schema validate: data.
	"valid JSON-pointer as stated in RFC 6901 #8"
	data := NeoJSONReader fromString: '"/g|h"'.
	schema validate: data.
	"valid JSON-pointer as stated in RFC 6901 #9"
	data := NeoJSONReader fromString: '"/i\\j"'.
	schema validate: data.
	"valid JSON-pointer as stated in RFC 6901 #10"
	data := NeoJSONReader fromString: '"/k\"l"'.
	schema validate: data.
	"valid JSON-pointer as stated in RFC 6901 #11"
	data := NeoJSONReader fromString: '"/ "'.
	schema validate: data.
	"valid JSON-pointer as stated in RFC 6901 #12"
	data := NeoJSONReader fromString: '"/m~0n"'.
	schema validate: data.
	"valid JSON-pointer used adding to the last array position"
	data := NeoJSONReader fromString: '"/foo/-"'.
	schema validate: data.
	"valid JSON-pointer (- used as object member name)"
	data := NeoJSONReader fromString: '"/foo/-/bar"'.
	schema validate: data.
	"valid JSON-pointer (multiple escaped characters)"
	data := NeoJSONReader fromString: '"/~1~0~0~1~1"'.
	schema validate: data.
	"valid JSON-pointer (escaped with fraction part) #1"
	data := NeoJSONReader fromString: '"/~1.1"'.
	schema validate: data.
	"valid JSON-pointer (escaped with fraction part) #2"
	data := NeoJSONReader fromString: '"/~0.1"'.
	schema validate: data.
	"not a valid JSON-pointer (URI Fragment Identifier) #1"
	data := NeoJSONReader fromString: '"#"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"not a valid JSON-pointer (URI Fragment Identifier) #2"
	data := NeoJSONReader fromString: '"#/"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"not a valid JSON-pointer (URI Fragment Identifier) #3"
	data := NeoJSONReader fromString: '"#a"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"not a valid JSON-pointer (some escaped, but not all) #1"
	data := NeoJSONReader fromString: '"/~0~"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"not a valid JSON-pointer (some escaped, but not all) #2"
	data := NeoJSONReader fromString: '"/~0/~"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"not a valid JSON-pointer (wrong escape character) #1"
	data := NeoJSONReader fromString: '"/~2"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"not a valid JSON-pointer (wrong escape character) #2"
	data := NeoJSONReader fromString: '"/~-1"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"not a valid JSON-pointer (multiple characters not escaped)"
	data := NeoJSONReader fromString: '"/~~"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"not a valid JSON-pointer (isn't empty nor starts with /) #1"
	data := NeoJSONReader fromString: '"a"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"not a valid JSON-pointer (isn't empty nor starts with /) #2"
	data := NeoJSONReader fromString: '"0"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"not a valid JSON-pointer (isn't empty nor starts with /) #3"
	data := NeoJSONReader fromString: '"a/a"'.
	self should: [ schema validate: data ] raise: JSONSchemaError