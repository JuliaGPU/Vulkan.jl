s1 = SnakeCaseLower("my_naming_convention")
s2 = SnakeCaseUpper("VK_STRUCTURE_TYPE_PIPELINE")
c1 = CamelCaseLower("vkCreateCommandBuffer")
c2 = CamelCaseUpper("VkInstanceCreateInfo")

s2_novk = SnakeCaseUpper("STRUCTURE_TYPE_PIPELINE")
c1_novk = CamelCaseLower("createCommandBuffer")
c2_novk = CamelCaseUpper("InstanceCreateInfo")

const_s1 = SnakeCaseLower("this_is_some_message")
const_s2 = SnakeCaseUpper("THIS_IS_SOME_MESSAGE")
const_c1  = CamelCaseLower("thisIsSomeMessage")
const_c2  = CamelCaseUpper("ThisIsSomeMessage")

longstr = SnakeCaseLower("my_snake_case_with_many_words")

camel_split_l_c1 = CamelCaseLower("myCamel2")
camel_split_l_c2 = CamelCaseLower("myCamel2KHRExt")
camel_split_l_c3 = CamelCaseLower("myCamel2Ext4")

camel_split_u_c1 = CamelCaseUpper("MyCamel2")
camel_split_u_c2 = CamelCaseUpper("MyCamel2KHRExt")
camel_split_u_c3 = CamelCaseUpper("MyCamel2Ext4")

@testset "Naming conventions" begin
    include("naming_conventions/lib.jl")
    include("naming_conventions/vulkan.jl")
end