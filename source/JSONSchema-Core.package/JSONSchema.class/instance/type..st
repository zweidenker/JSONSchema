accessing
type: anObject
	(type isNil | (type class = anObject class)) ifFalse: [
		Error signal: 'type is incompatible' ].
	type := anObject