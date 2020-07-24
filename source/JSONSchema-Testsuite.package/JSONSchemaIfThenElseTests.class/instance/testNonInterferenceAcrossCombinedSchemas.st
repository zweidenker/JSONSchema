as yet unclassified
testNonInterferenceAcrossCombinedSchemas
	"non-interference across combined schemas"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"allOf":[{"if":{"exclusiveMaximum":0}},{"then":{"minimum":-10}},{"else":{"multipleOf":2}}]}'.
	"valid, but would have been invalid through then"
	data := NeoJSONReader fromString: '-100'.
	schema validate: data.
	"valid, but would have been invalid through else"
	data := NeoJSONReader fromString: '3'.
	schema validate: data