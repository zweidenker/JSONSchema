as yet unclassified
write: aCollection
	| writer |
	^ String streamContents: [ :stream |
		writer := (JSONSchemaWriter on: stream).
		stream nextPut: $[.
		aCollection do: [ :eachObject |
			self items write: eachObject on: writer
			 	] separatedBy: [ stream nextPut: $,.  ].
		stream nextPut: $].
		 ]