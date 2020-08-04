accessing
schemaString
	^ '{"definitions":{"item":{"additionalItems":false,"items":[{"$ref":"#/definitions/sub-item"},{"$ref":"#/definitions/sub-item"}],"type":"array"},"sub-item":{"required":["foo"],"type":"object"}},"additionalItems":false,"items":[{"$ref":"#/definitions/item"},{"$ref":"#/definitions/item"},{"$ref":"#/definitions/item"}],"type":"array"}'