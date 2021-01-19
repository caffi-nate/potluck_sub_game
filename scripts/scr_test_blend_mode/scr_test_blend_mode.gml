///scr_test_blend_mode(blendmode1,blendmode2)
function scr_test_blend_mode(argument0, argument1) {

	// takes two integers for extended blend mode
	// originally used by pause menu

	var BM1 = argument0;
	var BM2 = argument1;

	/*
	if (keyboard_check_pressed(ord('B'))){
	    if bm1 < 10 {
	        bm1 += 1;
	    } else {
	        bm1 = 0;
	    }
	}
	if (keyboard_check_pressed(ord('N'))){
	    if bm2 < 10 {
	        bm2 +=1;
	    } else {
	        bm2 = 0;
	    }
	}*/


	switch(BM1){
	    case 0:
	        blendMode1 = bm_zero;    
	        break;
	    case 1:
	        blendMode1 = bm_one;
	        break;
	    case 2:
	        blendMode1 = bm_src_color;
	        break;
	    case 3:
	        blendMode1 = bm_inv_src_color;
	        break;
	    case 4:
	        blendMode1 = bm_src_alpha;
	        break;
	    case 5:
	        blendMode1 = bm_inv_src_alpha;
	        break;
	    case 6:
	        blendMode1 = bm_dest_alpha;
	        break;
	    case 7:
	        blendMode1 = bm_inv_dest_alpha;
	        break;
	    case 8:
	        blendMode1 = bm_dest_color;
	        break;
	    case 9:
	        blendMode1 = bm_inv_dest_color;
	        break;
	    case 10:
	        blendMode1 = bm_src_alpha_sat;
	        break;

	}

	switch(BM2){
	    case 0:
	        blendMode2 = bm_zero;    
	        break;
	    case 1:
	        blendMode2 = bm_one;
	        break;
	    case 2:
	        blendMode2 = bm_src_color;
	        break;
	    case 3:
	        blendMode2 = bm_inv_src_color;
	        break;
	    case 4:
	        blendMode2 = bm_src_alpha;
	        break;
	    case 5:
	        blendMode2 = bm_inv_src_alpha;
	        break;
	    case 6:
	        blendMode2 = bm_dest_alpha;
	        break;
	    case 7:
	        blendMode2 = bm_inv_dest_alpha;
	        break;
	    case 8:
	        blendMode2 = bm_dest_color;
	        break;
	    case 9:
	        blendMode2 = bm_inv_dest_color;
	        break;
	    case 10:
	        blendMode2 = bm_src_alpha_sat;
	        break;

	}

	//draw_set_blend_mode_ext(blendMode1,blendMode2);
	gpu_set_blendmode_ext(blendMode1,blendMode2);


}
