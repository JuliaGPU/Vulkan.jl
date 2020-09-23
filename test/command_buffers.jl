# macro record!(f, buffer::CommandBuffer)
#     quote
#         f($(esc(buffer)), )
#     end
# end