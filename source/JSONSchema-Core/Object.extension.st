Extension { #name : 'Object' }

{ #category : '*JSONSchema-Core' }
Object >> jsonSchemaAt: aSymbol [
	^ self perform: aSymbol asSymbol
]

{ #category : '*jsonschema-core' }
Object >> jsonSchemaAt: property put: value [ 
	| selector |
	selector := property asSymbol asMutator.
	(self respondsTo: selector) ifTrue: [   
		self perform: selector asSymbol with: value ]
]

{ #category : '*JSONSchema-Core' }
Object >> jsonSchemaKeys [
	^ self class allInstVarNames
]
