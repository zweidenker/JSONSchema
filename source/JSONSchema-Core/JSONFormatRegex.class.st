Class {
	#name : 'JSONFormatRegex',
	#superclass : 'JSONBasicStringFormat',
	#category : 'JSONSchema-Core-Formats',
	#package : 'JSONSchema-Core',
	#tag : 'Formats'
}

{ #category : 'reading' }
JSONFormatRegex class >> basicConvertString: aString [
	^ aString
]

{ #category : 'reading' }
JSONFormatRegex class >> encodeJSON: aString [
	^ aString
]

{ #category : 'accessing' }
JSONFormatRegex class >> formatName [
	^ 'regex'
]

{ #category : 'validation' }
JSONFormatRegex class >> validateString: aString [
	"format:regex - the string must be a compilable regular expression."
	[ aString asRegex ] on: Error do: [ :e |
		JSONConstraintError signal: aString printString, ' is not a valid regular expression' ]
]
