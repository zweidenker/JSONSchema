visiting
visitTypeObject: aTypeObject
	^ aTypeObject
		properties: (self visitAll: aTypeObject properties);
		yourself 