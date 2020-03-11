private
writeList: aCollection with: block
	writeStream nextPut: $[.
	aCollection
		do:
			[ :eachObject | block valueWithArguments: (Array with: eachObject) ]
		separatedBy: [ self listElementSeparator ].
	writeStream nextPut: $]