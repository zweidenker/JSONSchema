private
emitTestComment: aStream
	comment isNil ifTrue: [ ^ self ].
	comment printCleanedCommentTo: aStream.
	aStream cr