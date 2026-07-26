Class {
	#name : 'JSONStringFormat',
	#superclass : 'JSONBasicStringFormat',
	#category : 'JSONSchema-Core-Formats',
	#package : 'JSONSchema-Core',
	#tag : 'Formats'
}

{ #category : 'services' }
JSONStringFormat class >> basicConvertString: aString [ 
	^ aString asString
]

{ #category : 'as yet unclassified' }
JSONStringFormat class >> encodeJSON: aString [ 
	^ aString
]

{ #category : 'formatting' }
JSONStringFormat class >> formatName [
	^ #string
]

{ #category : 'services' }
JSONStringFormat class >> validate: aString [ 
	aString isString ifFalse: [ 
		JSONTypeError
			signal: aString printString , ' is not a string' ]
	
]

{ #category : 'services' }
JSONStringFormat class >> validateString: aString [ 
	aString isString ifFalse: [ 
		JSONTypeError
			signal: aString printString , ' is not a string' ]
	
]

{ #category : 'writing' }
JSONStringFormat class >> write: aString [ 
	^ aString
]
