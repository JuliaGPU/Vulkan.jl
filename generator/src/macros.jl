# macro mlenum(ex)
#     enum = name(ex)
#     quote
#         @enum $(esc(ex))
#         MLStyle.is_enum(::$enum) = true
#         MLStyle.pattern_uncall(e::$enum, _, _, _, _) = MLStyle.AbstractPatterns.literal(e)
#     end
# end
