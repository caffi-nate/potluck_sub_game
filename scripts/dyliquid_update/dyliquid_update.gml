///dyliquid_update();
function dyliquid_update() {

	/*
	Updates the water.
	*/


	// test: instead of current time, use a global timer to prevent weirdness on pause/unpause
	var TIME = current_time;
	TIME = global.realTimer;
	// this doesn't really do anything turns out!


	var i, j, column_x, delta_left, delta_right;

	// update springs (Hooke’s Law)
	for(i = 0; i < dy_colomns_count; i++) {
	  column_x = dy_column[i*3] - dy_column[i*3+1];
	  dy_column[i*3+2] += dy_tension * column_x - (dy_column[i*3+2] * dy_dampening);
	  var xx = dy_x[0] + i * dy_column_width;
	  var yy = -(TIME*0.05)*dy_speed;
	  dy_column[i*3+1] += dy_column[i*3+2] - (lengthdir_x(dy_wave, yy + xx));
	}

	/*
	Spread out the waves (Transfer force to adjacent springs)
	delta_left: Stores the difference in height between each spring and its left neighbour
	delta_right: Stores the difference in height between each spring and its right neighbour

	Does so dy_smoothing times in order to allow waves to spread smoothly.
	*/

	repeat(dy_smoothing) {
	  for(j=0; j < dy_colomns_count; j++) {
	    if (j > 0) {
	      delta_left[j] = dy_spread * (dy_column[j*3+1] - dy_column[(j-1)*3+1]);
	      dy_column[(j-1)*3+2] += delta_left[j];
	    }    
	    if (j < dy_colomns_count - 1) {
	      delta_right[j] = dy_spread * (dy_column[j*3+1] - dy_column[(j+1)*3+1]);
	      dy_column[(j+1)*3+2] += delta_right[j];
	    }
	  }
	  for(j=0; j < dy_colomns_count; j++) {
	    if (j > 0) {    
	      dy_column[(j-1)*3+1] += delta_left[j];        
	    }    
	    if (j < dy_colomns_count - 1) {
	      dy_column[(j+1)*3+1] += delta_right[j];        
	    }
	  }
	}






}
