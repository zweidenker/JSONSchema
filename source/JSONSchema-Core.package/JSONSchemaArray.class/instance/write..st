as yet unclassified
write: aCollection
	^ String
		streamContents: [ :stream | 
			stream nextPut: $[.
			aCollection
				do:
					[ :eachObject | stream nextPutAll: (self items write: eachObject) ]
				separatedBy: [ stream nextPut: $, ].
			stream nextPut: $] ]