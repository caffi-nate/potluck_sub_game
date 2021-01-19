function lookup_variable_table(argument0) {
	var VARIABLE_STRING = argument0;
	VARIABLE_STRING = string_replace(VARIABLE_STRING,"$","_");
	var VARIABLE_VALUE = ds_map_find_value(global.variableMap,VARIABLE_STRING);

	if is_undefined(VARIABLE_VALUE){
		VARIABLE_VALUE = -1;	
	}

	return VARIABLE_VALUE;


}
