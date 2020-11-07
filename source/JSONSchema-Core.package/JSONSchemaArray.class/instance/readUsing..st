private
readUsing: aReader
	| index |
	index := 0.
	^ Array streamContents: [:stream |
			aReader parseListDo: [ 
				stream nextPut: (items isCollection 
					ifTrue: [ 
						index := index + 1.
						(items at: index) readUsing: aReader ]
					ifFalse: [ items readUsing: aReader ])]]