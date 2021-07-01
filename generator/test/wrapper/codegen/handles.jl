test_wrap_handle(name, ex) = test_wrap(handle_by_name, name, ex)
test_handle_add_constructor(name, ex; kwargs...) = test_ex(first(add_constructors(handle_by_name(name); kwargs...)), ex)
test_handle_add_constructors(args...; kwargs...) = test_add_constructors(handle_by_name, args...; kwargs...)

@testset "Handles" begin
    @testset "Definitions" begin
        test_wrap_handle(:VkInstance, :(
            mutable struct Instance <: Handle
                vks::VkInstance
                refcount::RefCounter
                destructor
                Instance(vks::VkInstance, refcount::RefCounter) = new(vks, refcount, undef)
            end
        ))

        test_wrap_handle(:VkPhysicalDevice, :(
            mutable struct PhysicalDevice <: Handle
                vks::VkPhysicalDevice
                instance::Instance
                refcount::RefCounter
                destructor
                PhysicalDevice(vks::VkPhysicalDevice, instance::Instance, refcount::RefCounter) = new(vks, instance, refcount, undef)
            end
        ))

        test_wrap_handle(:VkDevice, :(
            mutable struct Device <: Handle
                vks::VkDevice
                physical_device::PhysicalDevice
                refcount::RefCounter
                destructor
                Device(vks::VkDevice, physical_device::PhysicalDevice, refcount::RefCounter) = new(vks, physical_device, refcount, undef)
            end
        ))
    end

    @testset "Constructors" begin
        test_handle_add_constructor(:VkInstance, :(
            Instance(enabled_layer_names::AbstractArray, enabled_extension_names::AbstractArray; allocator = C_NULL, next=C_NULL, flags=0, application_info=C_NULL) = unwrap(create_instance(enabled_layer_names, enabled_extension_names; allocator, next, flags, application_info))
        ))

        test_handle_add_constructor(:VkDebugReportCallbackEXT, :(
                DebugReportCallbackEXT(instance::Instance, pfn_callback::FunctionPtr, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0, user_data = C_NULL) = unwrap(create_debug_report_callback_ext(instance, pfn_callback, fun_ptr_create, fun_ptr_destroy; allocator, next, flags, user_data))
            ),
            with_func_ptr=true,
        )

        test_handle_add_constructor(:VkDeferredOperationKHR, :(
            DeferredOperationKHR(device::Device; allocator = C_NULL) = create_deferred_operation_khr(device; allocator)
        ))

        test_handle_add_constructors(:VkRenderPass, [
            :(
                RenderPass(device::Device, attachments::AbstractArray, subpasses::AbstractArray, dependencies::AbstractArray; allocator = C_NULL, next = C_NULL, flags = 0) = unwrap(create_render_pass(device, attachments, subpasses, dependencies; allocator, next, flags))
            ),
            :(
                RenderPass(device::Device, attachments::AbstractArray, subpasses::AbstractArray, dependencies::AbstractArray, correlated_view_masks::AbstractArray; allocator = C_NULL, next = C_NULL, flags = 0) = unwrap(create_render_pass_2(device, attachments, subpasses, dependencies, correlated_view_masks; allocator, next, flags))
            ),
        ])
    end
end
