initialization
resolveReference: aReference continueOn: aVisitor
	| schema |
	schemasByPath 
		at: aReference path
		ifPresent: [ :value | ^ value ].

	schema := (self lookupReference: aReference) asJSONSchema.
	schemasByPath
		at: aReference path
		put: schema.
	aVisitor visit: schema.
	^ schema