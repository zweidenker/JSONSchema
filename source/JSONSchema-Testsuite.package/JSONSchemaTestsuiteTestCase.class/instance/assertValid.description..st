asserting
assertValid: json description: description
	| object |
	object := NeoJSONReader fromString: json.
	self
		shouldnt: [ schema validate: object ]
		raise: JSONSchemaError
		description: description