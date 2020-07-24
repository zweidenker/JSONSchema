as yet unclassified
testValidationOfURIReferences
	"validation of URI References"

	| schema data |
	schema := JSONSchema fromString: '{"format":"uri-reference"}'.
	"a valid URI"
	data := NeoJSONReader fromString: '"http://foo.bar/?baz=qux#quux"'.
	schema validate: data.
	"a valid protocol-relative URI Reference"
	data := NeoJSONReader fromString: '"//foo.bar/?baz=qux#quux"'.
	schema validate: data.
	"a valid relative URI Reference"
	data := NeoJSONReader fromString: '"/abc"'.
	schema validate: data.
	"an invalid URI Reference"
	data := NeoJSONReader fromString: '"\\\\WINDOWS\\fileshare"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"a valid URI Reference"
	data := NeoJSONReader fromString: '"abc"'.
	schema validate: data.
	"a valid URI fragment"
	data := NeoJSONReader fromString: '"#fragment"'.
	schema validate: data.
	"an invalid URI fragment"
	data := NeoJSONReader fromString: '"#frag\\ment"'.
	self should: [ schema validate: data ] raise: JSONSchemaError