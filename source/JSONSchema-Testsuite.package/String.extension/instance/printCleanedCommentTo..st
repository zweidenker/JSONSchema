*JSONSchema-Testsuite
printCleanedCommentTo: aStream
	aStream nextPut: $".
	self
		do: [ :each | 
			each = $"
				ifFalse: [ aStream nextPut: each ]
				ifTrue: [ aStream nextPut: $' ] ].
	aStream nextPut: $"