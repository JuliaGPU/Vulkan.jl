# To be executed for local deployment.
# Make sure you have LiveServer in your environment,
# as well as all the dependencies of the generator project.
using LiveServer

servedocs(literate = "", skip_dir = joinpath("docs", "src"))
