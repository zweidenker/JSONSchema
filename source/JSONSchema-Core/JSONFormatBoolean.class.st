Class {
	#name : 'JSONFormatBoolean',
	#superclass : 'JSONFormat',
	#category : 'JSONSchema-Core-Formats',
	#package : 'JSONSchema-Core',
	#tag : 'Formats'
}

{ #category : 'services' }
JSONFormatBoolean class >> basicConvertString: aString [
	^ aString = 'true'
]

{ #category : 'as yet unclassified' }
JSONFormatBoolean class >> encodeJSON: aBoolean [ 
	^ aBoolean
]

{ #category : 'formatting' }
JSONFormatBoolean class >> formatName [
	^ #boolean
]

{ #category : 'services' }
JSONFormatBoolean class >> validate: anObject [
	(anObject = true | anObject = false)
		ifFalse: [ JSONTypeError signal: anObject asString , ' should be a boolean' ]
]

{ #category : 'services' }
JSONFormatBoolean class >> validateString: aString [
	^ (aString = 'true' | aString = 'false')
		ifFalse: [ JSONTypeError signal: aString asString , ' should be a boolean' ]
]

{ #category : 'writing' }
JSONFormatBoolean class >> write: aBoolean [
	^ aBoolean asString
]
