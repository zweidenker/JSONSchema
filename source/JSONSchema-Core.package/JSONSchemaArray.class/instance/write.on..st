as yet unclassified
write: aCollection on: writer
	^ writer
		writeList: aCollection with: [ :eachObject | self items write: eachObject on: writer ] 