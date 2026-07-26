Class {
	#name : 'JSONBasicStringFormat',
	#superclass : 'JSONFormat',
	#category : 'JSONSchema-Core-Formats',
	#package : 'JSONSchema-Core',
	#tag : 'Formats'
}

{ #category : 'services' }
JSONBasicStringFormat class >> basicConvertString: aString [ 
	self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
JSONBasicStringFormat class >> encodeJSON: aString [ 
	self subclassResponsibility 
]

{ #category : 'testing' }
JSONBasicStringFormat class >> isAbstract [
	^ self = JSONBasicStringFormat
]
