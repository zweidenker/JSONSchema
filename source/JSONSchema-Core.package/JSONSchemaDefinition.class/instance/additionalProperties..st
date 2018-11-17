accessing
additionalProperties: anObject
	additionalProperties := (anObject isNil | (anObject isKindOf: Boolean)) 
		ifTrue: [ JSONSchemaAnyObject new ]
		ifFalse: [ anObject asJSONSchema ]