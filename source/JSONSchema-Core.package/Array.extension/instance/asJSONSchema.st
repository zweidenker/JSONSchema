*JSONSchema-Core
asJSONSchema
	^ JSONSchemaObject new 
		properties: (self collect: [ :each | each key -> each value asJSONSchema ]) asDictionary ;
		yourself