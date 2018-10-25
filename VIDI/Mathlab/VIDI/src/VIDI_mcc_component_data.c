/*
 * MATLAB Compiler: 4.9 (R2008b)
 * Date: Mon Nov 26 00:57:15 2012
 * Arguments: "-B" "macro_default" "-o" "VIDI" "-W" "WinMain:VIDI" "-d"
 * "C:\VIDI\Matlab\VIDI\src" "-T" "link:exe" "-v" "C:\VIDI\Matlab\main.m" 
 */

#include "mclmcrrt.h"

#ifdef __cplusplus
extern "C" {
#endif
const unsigned char __MCC_VIDI_session_key[] = {
    '1', '7', '3', 'A', 'D', '3', '8', 'D', '3', '0', '7', 'D', '8', '5', '6',
    'B', '4', '9', 'D', 'C', 'E', 'B', '6', 'D', 'F', '8', '8', 'D', '7', '8',
    '9', '9', '0', '4', '4', 'F', '4', 'A', '7', '4', 'B', '5', '1', '8', 'B',
    '2', '6', '7', '7', 'A', '2', '7', '7', 'F', '8', '7', 'E', '8', '2', 'A',
    '6', '6', '8', '1', 'E', 'B', '8', 'F', 'A', 'B', 'F', 'B', '0', '1', '9',
    '6', '0', '4', '5', 'F', '2', 'D', '9', '4', 'C', '0', 'D', 'F', '9', 'A',
    '6', '3', 'D', 'A', '5', '7', '6', '3', '4', '3', '6', 'E', '8', '5', '9',
    'D', 'D', '0', 'B', '0', '0', '6', '8', 'C', '9', '8', 'F', '9', '0', '9',
    '2', '7', 'C', '4', '4', '6', '4', '8', '1', '1', '3', '1', 'F', '9', '1',
    'C', '8', '0', 'A', 'C', '5', '3', 'D', 'E', 'A', '6', '2', 'E', 'C', 'D',
    '3', '0', 'D', '2', '7', 'E', '6', '4', '5', '2', '0', 'B', 'E', '9', '8',
    '0', '3', 'F', 'F', '2', 'E', 'B', '4', 'B', '5', '2', 'E', '7', '8', '5',
    '9', '7', 'C', 'E', '7', '0', '0', '2', 'F', '2', 'E', '4', '0', 'B', '6',
    'B', '4', '4', '8', 'C', '4', 'F', 'D', 'B', '5', '6', '5', '4', '1', '3',
    '0', '9', '8', '0', '1', '6', '5', 'D', 'F', '2', 'B', 'A', '2', 'A', 'E',
    '8', '8', 'D', '0', '2', 'A', 'D', 'D', '2', '2', 'A', 'B', '0', 'E', '6',
    '2', 'C', 'C', '1', 'B', 'A', 'B', 'C', 'E', '2', '9', '5', '2', 'C', '7',
    'B', '\0'};

const unsigned char __MCC_VIDI_public_key[] = {
    '3', '0', '8', '1', '9', 'D', '3', '0', '0', 'D', '0', '6', '0', '9', '2',
    'A', '8', '6', '4', '8', '8', '6', 'F', '7', '0', 'D', '0', '1', '0', '1',
    '0', '1', '0', '5', '0', '0', '0', '3', '8', '1', '8', 'B', '0', '0', '3',
    '0', '8', '1', '8', '7', '0', '2', '8', '1', '8', '1', '0', '0', 'C', '4',
    '9', 'C', 'A', 'C', '3', '4', 'E', 'D', '1', '3', 'A', '5', '2', '0', '6',
    '5', '8', 'F', '6', 'F', '8', 'E', '0', '1', '3', '8', 'C', '4', '3', '1',
    '5', 'B', '4', '3', '1', '5', '2', '7', '7', 'E', 'D', '3', 'F', '7', 'D',
    'A', 'E', '5', '3', '0', '9', '9', 'D', 'B', '0', '8', 'E', 'E', '5', '8',
    '9', 'F', '8', '0', '4', 'D', '4', 'B', '9', '8', '1', '3', '2', '6', 'A',
    '5', '2', 'C', 'C', 'E', '4', '3', '8', '2', 'E', '9', 'F', '2', 'B', '4',
    'D', '0', '8', '5', 'E', 'B', '9', '5', '0', 'C', '7', 'A', 'B', '1', '2',
    'E', 'D', 'E', '2', 'D', '4', '1', '2', '9', '7', '8', '2', '0', 'E', '6',
    '3', '7', '7', 'A', '5', 'F', 'E', 'B', '5', '6', '8', '9', 'D', '4', 'E',
    '6', '0', '3', '2', 'F', '6', '0', 'C', '4', '3', '0', '7', '4', 'A', '0',
    '4', 'C', '2', '6', 'A', 'B', '7', '2', 'F', '5', '4', 'B', '5', '1', 'B',
    'B', '4', '6', '0', '5', '7', '8', '7', '8', '5', 'B', '1', '9', '9', '0',
    '1', '4', '3', '1', '4', 'A', '6', '5', 'F', '0', '9', '0', 'B', '6', '1',
    'F', 'C', '2', '0', '1', '6', '9', '4', '5', '3', 'B', '5', '8', 'F', 'C',
    '8', 'B', 'A', '4', '3', 'E', '6', '7', '7', '6', 'E', 'B', '7', 'E', 'C',
    'D', '3', '1', '7', '8', 'B', '5', '6', 'A', 'B', '0', 'F', 'A', '0', '6',
    'D', 'D', '6', '4', '9', '6', '7', 'C', 'B', '1', '4', '9', 'E', '5', '0',
    '2', '0', '1', '1', '1', '\0'};

static const char * MCC_VIDI_matlabpath_data[] = 
  { "VIDI/", "$TOOLBOXDEPLOYDIR/", "$TOOLBOXMATLABDIR/general/",
    "$TOOLBOXMATLABDIR/ops/", "$TOOLBOXMATLABDIR/lang/",
    "$TOOLBOXMATLABDIR/elmat/", "$TOOLBOXMATLABDIR/randfun/",
    "$TOOLBOXMATLABDIR/elfun/", "$TOOLBOXMATLABDIR/specfun/",
    "$TOOLBOXMATLABDIR/matfun/", "$TOOLBOXMATLABDIR/datafun/",
    "$TOOLBOXMATLABDIR/polyfun/", "$TOOLBOXMATLABDIR/funfun/",
    "$TOOLBOXMATLABDIR/sparfun/", "$TOOLBOXMATLABDIR/scribe/",
    "$TOOLBOXMATLABDIR/graph2d/", "$TOOLBOXMATLABDIR/graph3d/",
    "$TOOLBOXMATLABDIR/specgraph/",
    "$TOOLBOXMATLABDIR/graphics/", "$TOOLBOXMATLABDIR/uitools/",
    "$TOOLBOXMATLABDIR/strfun/", "$TOOLBOXMATLABDIR/imagesci/",
    "$TOOLBOXMATLABDIR/iofun/", "$TOOLBOXMATLABDIR/audiovideo/",
    "$TOOLBOXMATLABDIR/timefun/", "$TOOLBOXMATLABDIR/datatypes/",
    "$TOOLBOXMATLABDIR/verctrl/", "$TOOLBOXMATLABDIR/codetools/",
    "$TOOLBOXMATLABDIR/helptools/", "$TOOLBOXMATLABDIR/winfun/",
    "$TOOLBOXMATLABDIR/demos/", "$TOOLBOXMATLABDIR/timeseries/",
    "$TOOLBOXMATLABDIR/hds/", "$TOOLBOXMATLABDIR/guide/",
    "$TOOLBOXMATLABDIR/plottools/", "toolbox/local/",
    "toolbox/shared/dastudio/", "$TOOLBOXMATLABDIR/datamanager/",
    "toolbox/compiler/", "toolbox/images/colorspaces/",
    "toolbox/images/images/", "toolbox/images/imuitools/",
    "toolbox/images/iptformats/", "toolbox/images/iptutils/",
    "toolbox/shared/imageslib/", "toolbox/signal/signal/" };

static const char * MCC_VIDI_classpath_data[] = 
  { "java/jar/toolbox/images.jar" };

static const char * MCC_VIDI_libpath_data[] = 
  { "" };

static const char * MCC_VIDI_app_opts_data[] = 
  { "" };

static const char * MCC_VIDI_run_opts_data[] = 
  { "" };

static const char * MCC_VIDI_warning_state_data[] = 
  { "off:MATLAB:dispatcher:nameConflict" };


mclComponentData __MCC_VIDI_component_data = { 

  /* Public key data */
  __MCC_VIDI_public_key,

  /* Component name */
  "VIDI",

  /* Component Root */
  "",

  /* Application key data */
  __MCC_VIDI_session_key,

  /* Component's MATLAB Path */
  MCC_VIDI_matlabpath_data,

  /* Number of directories in the MATLAB Path */
  46,

  /* Component's Java class path */
  MCC_VIDI_classpath_data,
  /* Number of directories in the Java class path */
  1,

  /* Component's load library path (for extra shared libraries) */
  MCC_VIDI_libpath_data,
  /* Number of directories in the load library path */
  0,

  /* MCR instance-specific runtime options */
  MCC_VIDI_app_opts_data,
  /* Number of MCR instance-specific runtime options */
  0,

  /* MCR global runtime options */
  MCC_VIDI_run_opts_data,
  /* Number of MCR global runtime options */
  0,
  
  /* Component preferences directory */
  "VIDI_CD77C0B978846EF8E6B6F0692D22DF00",

  /* MCR warning status data */
  MCC_VIDI_warning_state_data,
  /* Number of MCR warning status modifiers */
  1,

  /* Path to component - evaluated at runtime */
  NULL

};

#ifdef __cplusplus
}
#endif


