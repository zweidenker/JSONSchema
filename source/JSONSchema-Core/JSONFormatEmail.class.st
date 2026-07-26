Class {
	#name : 'JSONFormatEmail',
	#superclass : 'JSONBasicStringFormat',
	#category : 'JSONSchema-Core-Formats',
	#package : 'JSONSchema-Core',
	#tag : 'Formats'
}

{ #category : 'as yet unclassified' }
JSONFormatEmail class >> encodeJSON: aString [ 
	^ aString 
]

{ #category : 'accessing' }
JSONFormatEmail class >> formatName [
	^ 'email'
]
