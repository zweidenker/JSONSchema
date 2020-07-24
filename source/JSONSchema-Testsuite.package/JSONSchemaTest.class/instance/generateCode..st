as yet unclassified
generateCode: stream
	description
		ifNotNil: [ :value | self emitTestComment: value to: stream ].
	comment ifNotNil: [ :value | self emitTestComment: value to: stream ].
	self emmitAssertion: stream