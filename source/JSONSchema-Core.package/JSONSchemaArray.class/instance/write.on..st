as yet unclassified
write: aCollection on: writer
	^ writer
		writeListWith: [ aCollection
				do: [ :eachObject | self items write: eachObject on: writer ] ]