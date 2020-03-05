meta-object-protocol
read: anObject format: formatString
	^ self new
		formatString: formatString;
		read: anObject