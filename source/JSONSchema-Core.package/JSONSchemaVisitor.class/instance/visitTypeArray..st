visiting
visitTypeArray: aTypeArray 
	^ aTypeArray
		items: (self visit: aTypeArray items);
		yourself 