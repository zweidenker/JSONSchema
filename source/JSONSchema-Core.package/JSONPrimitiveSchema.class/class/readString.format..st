meta-object-protocol
readString: aString format: formatString
	^ self new
		formatString: formatString;
		readString: aString