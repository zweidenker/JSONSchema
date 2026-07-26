Class {
	#name : 'JSONNumberFormat',
	#superclass : 'JSONFormat',
	#category : 'JSONSchema-Core-Formats',
	#package : 'JSONSchema-Core',
	#tag : 'Formats'
}

{ #category : 'as yet unclassified' }
JSONNumberFormat class >> basicConvertString: aString [ 
	^ aString asNumber
]

{ #category : 'as yet unclassified' }
JSONNumberFormat class >> encodeJSON: anInteger [ 
	^ anInteger 
]

{ #category : 'testing' }
JSONNumberFormat class >> isAbstract [
	^ self == JSONNumberFormat 
]

{ #category : 'services' }
JSONNumberFormat class >> validate: anObject [
	anObject isNumber ifFalse: [ 
		JSONTypeError signal: anObject asString, ' should be a number' ]
]

{ #category : 'testing' }
JSONNumberFormat class >> validateString: aString [ 
	^ (NumberParser isNumber: aString) ifFalse: [ 
		JSONTypeError signal: aString asString, ' should be a number' ]
]

{ #category : 'writing' }
JSONNumberFormat class >> write: aNumber [ 
	^ aNumber asString
]
