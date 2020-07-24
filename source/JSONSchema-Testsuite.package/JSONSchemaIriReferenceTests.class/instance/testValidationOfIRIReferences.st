as yet unclassified
testValidationOfIRIReferences
	"validation of IRI References"

	| schema data |
	schema := JSONSchema fromString: '{"format":"iri-reference"}'.
	"a valid IRI"
	data := NeoJSONReader fromString: '"http://ƒøø.ßår/?∂éœ=πîx#πîüx"'.
	schema validate: data.
	"a valid protocol-relative IRI Reference"
	data := NeoJSONReader fromString: '"//ƒøø.ßår/?∂éœ=πîx#πîüx"'.
	schema validate: data.
	"a valid relative IRI Reference"
	data := NeoJSONReader fromString: '"/âππ"'.
	schema validate: data.
	"an invalid IRI Reference"
	data := NeoJSONReader fromString: '"\\\\WINDOWS\\filëßåré"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"a valid IRI Reference"
	data := NeoJSONReader fromString: '"âππ"'.
	schema validate: data.
	"a valid IRI fragment"
	data := NeoJSONReader fromString: '"#ƒrägmênt"'.
	schema validate: data.
	"an invalid IRI fragment"
	data := NeoJSONReader fromString: '"#ƒräg\\mênt"'.
	self should: [ schema validate: data ] raise: JSONSchemaError