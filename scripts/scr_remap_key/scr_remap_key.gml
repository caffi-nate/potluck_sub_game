    if (keyboard_check_pressed(vk_anykey)){      
          
        // iterate through list. if last key is another value in the list, swap values
        var tempKey;
        tempKey = ds_map_find_first(customKeys);        
        for (i=0; i < ds_map_size(customKeys); i++){
            
            // does this value already exist in the key list? if so, swap it
            if ds_map_find_value(customKeys,tempKey) == keyboard_lastkey{
                
                var value = ds_map_find_value(customKeys,current);
                
                // bug: can't use tempKey, this refers to the key and not its value
                ds_map_replace(customKeys,tempKey, value);
                
            }
            tempKey = ds_map_find_next(customKeys,tempKey);            
        }    
        // replace after checks are made
        ds_map_replace(customKeys,current,keyboard_lastkey);    

        
        
        
        
        state = 1; // reset back to dormant state    
    }
