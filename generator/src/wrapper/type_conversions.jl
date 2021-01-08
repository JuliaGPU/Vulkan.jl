function nice_julian_type(member::SpecStructMember)
    @match m = member begin
        if is_fn_ptr(m) end => :Function
        if m.type == :UInt32 && is_version(m) end => :VersionNumber
        if is_ntuple(m.type) && ntuple_type(m.type) == :UInt8 end => :String
        if m.type == :Cstring end => :String
        if m.type == :VkBool32 end => :Bool
        if is_ptr(m.type) end => @match pt = ptr_type(m.type) begin
            if !isnothing(m.len) end => :(Vector{$pt})
            :Cstring => :(Vector{String})
            if is_vulkan_type(pt) end => remove_vk_prefix(pt)
            _ => m.type
            if is_ptr(pt) end => @match ppt = ptr_type(pt) begin
                :Cvoid => :(Vector{Any})
                _ => :(Vector{$ppt})
            end
        end
        if m.type ∈ spec_constants.name end => follow_constant(m.type)
        if m.type ∈ spec_structs.name end => remove_vk_prefix(m.type)
        m => m.type
    end
end

is_fn_ptr(member::SpecStructMember) = startswith(string(member.type), "PFN")
is_version(member::SpecStructMember) = contains(lowercase(string(member.name)), "version") && follow_constant(member.type) == :UInt32
