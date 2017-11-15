import os
import sipconfig

build_file = "qtnProperty.sbf"

config = sipconfig.Configuration()

include_directories = "D:\env\PyQSPEnv\sip\PyQt5"
code_directories = "D:\Projects\QtnProperty\PropertyWidget"

os.system(" ".join(
    [config.sip_bin, "-c", ".", "-b", build_file, "-I", include_directories, "-t", "WS_WIN",
     "QtnPropertymod.sip"]))

makefile = sipconfig.SIPModuleMakefile(config, build_file)

makefile.extra_libs = ["qtnProperty"]
makefile.extra_lib_dirs = ["."]

# Generate the Makefile itself.
makefile.generate()
# Now we create the configuration module.  This is done by merging a Python
# dictionary (whose values are normally determined dynamically) with a
# (static) template.

# content = {
#     # Publish where the SIP specifications for this module will be
#     # installed.
#     "hello_sip_dir":    config.default_sip_dir,
#
#     # Publish the set of SIP flags needed by this module.  As these are the
#     # same flags needed by the qt module we could leave it out, but this
#     # allows us to change the flags at a later date without breaking
#     # scripts that import the configuration module.
#     "hello_sip_flags":  pyqt_sip_flags
# }
#
# # This creates the helloconfig.py module from the helloconfig.py.in
# # template and the dictionary.
# sipconfig.create_config_module("helloconfig.py", "helloconfig.py.in", content)
