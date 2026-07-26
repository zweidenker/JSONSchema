Class {
	#name : 'JSONIntegerFormat',
	#superclass : 'JSONNumberFormat',
	#category : 'JSONSchema-Core-Formats',
	#package : 'JSONSchema-Core',
	#tag : 'Formats'
}

{ #category : 'testing' }
JSONIntegerFormat class >> isAbstract [
	^ self = JSONIntegerFormat
]
