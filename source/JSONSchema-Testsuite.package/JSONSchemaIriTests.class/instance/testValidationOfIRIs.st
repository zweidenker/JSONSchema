as yet unclassified
testValidationOfIRIs
	"validation of IRIs"

	| schema data |
	schema := JSONSchema fromString: '{"format":"iri"}'.
	"a valid IRI with anchor tag"
	data := NeoJSONReader fromString: '"http://ƒøø.ßår/?∂éœ=πîx#πîüx"'.
	schema validate: data.
	"a valid IRI with anchor tag and parantheses"
	data := NeoJSONReader
		fromString: '"http://ƒøø.com/blah_(wîkïpédiå)_blah#ßité-1"'.
	schema validate: data.
	"a valid IRI with URL-encoded stuff"
	data := NeoJSONReader
		fromString: '"http://ƒøø.ßår/?q=Test%20URL-encoded%20stuff"'.
	schema validate: data.
	"a valid IRI with many special characters"
	data := NeoJSONReader
		fromString: '"http://-.~_!$&''()*+,;=:%40:80%2f::::::@example.com"'.
	schema validate: data.
	"a valid IRI based on IPv6"
	data := NeoJSONReader
		fromString: '"http://[2001:0db8:85a3:0000:0000:8a2e:0370:7334]"'.
	schema validate: data.
	"an invalid IRI based on IPv6"
	data := NeoJSONReader
		fromString: '"http://2001:0db8:85a3:0000:0000:8a2e:0370:7334"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an invalid relative IRI Reference"
	data := NeoJSONReader fromString: '"/abc"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an invalid IRI"
	data := NeoJSONReader fromString: '"\\\\WINDOWS\\filëßåré"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"an invalid IRI though valid IRI reference"
	data := NeoJSONReader fromString: '"âππ"'.
	self should: [ schema validate: data ] raise: JSONSchemaError