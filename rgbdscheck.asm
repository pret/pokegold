IF !DEF(__RGBDS_MAJOR__) || !DEF(__RGBDS_MINOR__) || !DEF(__RGBDS_PATCH__)
	fail "pokegold requires rgbds v0.9.0 or newer."
ENDC
IF __RGBDS_MAJOR__ == 0 && __RGBDS_MINOR__ < 9
	fail "pokegold requires rgbds v0.9.0 or newer."
ENDC
