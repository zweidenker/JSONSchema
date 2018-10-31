as yet unclassified
readUsing: aReader
	^ Array streamContents: [:stream |
			aReader parseListDo: [ stream nextPut: (items readUsing: aReader) ] ]