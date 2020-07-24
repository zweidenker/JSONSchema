as yet unclassified
testAdditionalItemsAreAllowedByDefault
	"additionalItems are allowed by default"

	| schema data |
	schema := JSONSchema fromString: '{"items":[{"type":"integer"}]}'.
	"only the first item is validated"
	data := NeoJSONReader fromString: '[1,"foo",false]'.
	schema validate: data