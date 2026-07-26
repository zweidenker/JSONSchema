Class {
	#name : 'JSONFormatNull',
	#superclass : 'JSONFormat',
	#category : 'JSONSchema-Core-Formats',
	#package : 'JSONSchema-Core',
	#tag : 'Formats'
}

{ #category : 'services' }
JSONFormatNull class >> basicConvertString: aString [
	^ nil
]

{ #category : 'formatting' }
JSONFormatNull class >> formatName [
	^ #nil
]

{ #category : 'services' }
JSONFormatNull class >> validate: anObject [
	anObject isNil
		ifFalse: [ JSONTypeError signal: anObject asString , ' should be nil' ]
]

{ #category : 'services' }
JSONFormatNull class >> validateString: aString [
	^ aString = 'null'
		ifFalse: [ JSONTypeError signal: aString asString , ' should be null' ]
]
