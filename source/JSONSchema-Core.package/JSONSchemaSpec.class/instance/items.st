accessing
items
	self flag: #todo.
	self halt.
	"items should not be accessed from the schema"
	^ schema items