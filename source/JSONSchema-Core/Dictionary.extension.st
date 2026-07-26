Extension { #name : 'Dictionary' }

{ #category : '*JSONSchema-Core' }
Dictionary >> asJSONSchema [
	^ self associations asJSONSchema 
]

{ #category : '*JSONSchema-Core' }
Dictionary >> jsonSchemaAt: aSymbol [
	^ self at: aSymbol asSymbol
]

{ #category : '*JSONSchema-Core' }
Dictionary >> jsonSchemaAt: key put: value [
	^ self at: key put: value
]

{ #category : '*JSONSchema-Core' }
Dictionary >> jsonSchemaKeys [ 
	^ self keys
]
