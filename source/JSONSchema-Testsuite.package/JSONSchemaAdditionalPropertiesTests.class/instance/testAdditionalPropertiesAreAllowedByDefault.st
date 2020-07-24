as yet unclassified
testAdditionalPropertiesAreAllowedByDefault
	"additionalProperties are allowed by default"

	| schema data |
	schema := JSONSchema fromString: '{"properties":{"foo":{},"bar":{}}}'.
	"additional properties are allowed"
	data := NeoJSONReader fromString: '{"quux":true,"foo":1,"bar":2}'.
	schema validate: data