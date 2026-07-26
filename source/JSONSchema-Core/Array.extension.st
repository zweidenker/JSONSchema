Extension { #name : 'Array' }

{ #category : '*JSONSchema-Core' }
Array >> asJSONSchema [
	^ self isEmpty 
		ifTrue: [ JSONSchemaAnyObject new] 
		ifFalse: [
			JSONSchemaObject new 
				properties: (self collect: [ :each | each key -> each value asJSONSchema ]) asDictionary ;
				yourself ]
]
