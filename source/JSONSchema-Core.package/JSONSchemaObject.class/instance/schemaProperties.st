accessing
schemaProperties
	^ super schemaProperties , {   
		#properties -> nil.
		#additionalProperties -> true.
		#required -> nil}