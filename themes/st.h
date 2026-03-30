/*
 * st.h -- lut theme for st
 *
 * USAGE
 * =====
 *
 * In your `config.h`, delete the `colornames` and the `defaultfg, defaultbg, defaultcs, and defaultrcs` variables, and replace all of that for this single line:
 * 	#include "theme.h"
 *
 * Save this file as theme.h and recompile st.
 */

static const char *colorname[] = {
	/* normal ansi colors */
	"#2f2f2f",
	"#ff8080",
	"#b0c090",
	"#e0c060",
	"#80a0c0",
	"#d0a0b0",
	"#80c0b0",
	"#f2e6c9",

	/* bright colors */
	"#666666", /* satan black */
	"#ffa860",
	"#c0d0a0",
	"#f0e090",
	"#a0b0d0",
	"#e0b0c0",
	"#a0d0c0",
	"#ffffff",
};

unsigned int defaultfg = 7;
unsigned int defaultbg = 0;
unsigned int defaultcs = 3;
unsigned int defaultrcs = 0;
