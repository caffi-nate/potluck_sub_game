
		inst[0] = instance_find(o_static, 0);
		inst[1] = instance_find(o_dynamic, 0);

		rope_init();

		var NUM_SEGMENTS = 15//12//20;

		rope = rope_create(inst[0].x, inst[0].y, 0, 4, 4, NUM_SEGMENTS, s_rope, 50, 0);
		//bridge = rope_create(inst[0].x, inst[0].y, 0, 16, 16, 22, s_rope, 8, 1);
		rope_join_start(rope, inst[0]);
		rope_join_end(rope, inst[1]);

		tex = sprite_get_texture(s_rope, 0); // chain actually? lol
		ropeSetup = true;
		
		
		//exit