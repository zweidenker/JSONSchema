accessing
type: anObject
	(schema isNil | (schema class = anObject class)) ifFalse: [
		Error signal: 'type is incompatible' ].
	schema := anObject