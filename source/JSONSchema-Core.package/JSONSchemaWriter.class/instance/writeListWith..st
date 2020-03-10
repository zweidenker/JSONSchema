private
writeListWith: block
	writeStream nextPut: $[.
	block value.
	writeStream nextPut: $]