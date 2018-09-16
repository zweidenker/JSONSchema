instance creation api
newFromSchemaSpec: aJSONSchemaSpec
	^ self new
		initializeFromSchemaSpec: aJSONSchemaSpec 