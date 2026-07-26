Class {
	#name : 'JSONSchemaVisitor',
	#superclass : 'Object',
	#category : 'JSONSchema-Core',
	#package : 'JSONSchema-Core'
}

{ #category : 'meta-object-protocol' }
JSONSchemaVisitor >> read: aSchema [
	^ self visit: aSchema
]

{ #category : 'visiting' }
JSONSchemaVisitor >> visit: object [
	object ifNil: [ ^ object ].
	object isString ifTrue: [ ^ object ].
	object isCollection ifTrue: [ ^ self visitAll: object ].
	^ object acceptJSONSchema: self 
]

{ #category : 'visiting' }
JSONSchemaVisitor >> visitAll: aCollection [ 
	aCollection ifNil: [ ^ nil ].
	^ aCollection collect: [ :each |
		self visit: each ]
]

{ #category : 'visiting' }
JSONSchemaVisitor >> visitAllOfType: anOAAllOfType [ 
	^ self visitComposedType: anOAAllOfType 
]

{ #category : 'visiting' }
JSONSchemaVisitor >> visitAnyObject: anAnyObject [ 
	^ anAnyObject 
]

{ #category : 'visiting' }
JSONSchemaVisitor >> visitComposedType: aComposedType [ 
	^ aComposedType 
		schemas: (self visitAll: aComposedType schemas)
]

{ #category : 'visiting' }
JSONSchemaVisitor >> visitReference: aReference [ 
	^ aReference 
]

{ #category : 'visiting' }
JSONSchemaVisitor >> visitSchemaDefinition: aSchemaDefinition [
self halt.
	^ aSchemaDefinition
		"properties: (self visitAll: aSchema properties);"
		"items: (self visit: aSchema items);"
		basicType: (self visit: aSchemaDefinition type);
		yourself		
]

{ #category : 'visiting' }
JSONSchemaVisitor >> visitTypeArray: aTypeArray [ 
	^ aTypeArray
		items: (self visit: aTypeArray items);
		yourself 
]

{ #category : 'visiting' }
JSONSchemaVisitor >> visitTypeObject: aTypeObject [
	^ aTypeObject
		properties: (self visitAll: aTypeObject properties);
		yourself 
]
