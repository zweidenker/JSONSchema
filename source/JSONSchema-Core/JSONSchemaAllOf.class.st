Class {
	#name : 'JSONSchemaAllOf',
	#superclass : 'JSONSchemaComposedObject',
	#category : 'JSONSchema-Core-Model',
	#package : 'JSONSchema-Core',
	#tag : 'Model'
}

{ #category : 'visiting' }
JSONSchemaAllOf >> acceptJSONSchema: aVisitor [ 
	^ aVisitor visitAllOfType: self
]

{ #category : 'initialization' }
JSONSchemaAllOf >> initializeFromDefinition: aDefinition [
	super initializeFromDefinition: aDefinition.
	schemas := aDefinition allOf
]

{ #category : 'meta-object-protocol' }
JSONSchemaAllOf >> read: jsonObject [
		| object |
	object := NeoJSONObject new.
	schemas do: [ :schema |
		self readProperties: schema properties
		from: jsonObject 
		writeTo: object  ].
	^ object
]
