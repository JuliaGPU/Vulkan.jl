"""
Vulkan uses the concept of rendering pipelines to encapsulate
fixed states
This replaces OpenGL's huge (and cumbersome) state machine
A pipeline is then stored and hashed on the GPU making
pipeline changes much faster than having to set dozens of
states
In a real world application you'd have dozens of pipelines
for every shader set used in a scene
Note that there are a few states that are not stored with
the pipeline. These are called dynamic states and the
pipeline only stores that they are used with this pipeline,
but not their states
source: https://github.com/SaschaWillems/Vulkan
"""
module Pipeline


end
