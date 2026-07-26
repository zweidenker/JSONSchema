Extension { #name : 'OrderedDictionary' }

{ #category : '*JSONSchema-Core' }
OrderedDictionary >> jsonSchemaAt: aSymbol [
	^ self at: aSymbol asSymbol
]

{ #category : '*JSONSchema-Core' }
OrderedDictionary >> jsonSchemaAt: key put: value [
	^ self at: key put: value
]

{ #category : '*JSONSchema-Core' }
OrderedDictionary >> jsonSchemaKeys [ 
	^ self keys
]
