if (surface_exists(dialogueBoxSurface))
	surface_free(dialogueBoxSurface);	

if (surface_exists(portraitSurface))
	surface_free(portraitSurface);	

if ds_exists(choice_grid,ds_type_grid)
	ds_grid_destroy(choice_grid);	