library(renv)

.libPaths() # tells you where your current library is stored

lapply(.libPaths(), list.files) # tells you which packages are available in library

getOption("repos") # see which repositories are currently set up in your session

install.packages("{pkgname}") #R will look for pkgname in each repository in turn.

renv::init() # converts a project to use renv. Creates 3 new files:
# The project library, renv/library, is a library that contains all packages currently used by your project. This is the key magic that makes renv work: instead of having one library containing the packages used in every project, renv gives you a separate library for each project. This gives you the benefits of isolation: different projects can use different versions of packages, and installing, updating, or removing packages in one project doesn’t affect any other project.

# The lockfile, renv.lock, records enough metadata about every package that it can be re-installed on a new machine. We’ll come back to the lockfile shortly when we talk about renv::snapshot() and renv::restore().

# A project R profile, .Rprofile. This file is run automatically every time you start R (in that project), and renv uses it to configure your R session to use the project library. This ensures that once you turn on renv for a project, it stays on, until you deliberately turn it off.

# The next important pair of tools is renv::snapshot() and renv::restore(). snapshot() updates the lockfile with metadata about the currently-used packages in the project library. This is useful because you can then share the lockfile and other people or other computers can easily reproduce your current environment by running restore(), which uses the metadata from the lockfile to install exactly the same version of every package. This pair of functions gives you the benefits of reproducibility and portability: you are now tracking exactly which package versions you have installed so you can recreate them on other machines.

# Now that you’ve got the a high-level lay of the land, we’ll show a couple of specific workflows before discussing some of the reproducibility challenges that renv doesn’t currently help with.

# Call a package:
library(ggplot2)

# Save current package in lockfile
renv::snapshot()

renv::update() # use to get the latest versions of all dependencies

