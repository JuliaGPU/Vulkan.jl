@testset "Handles" begin
    @testset "Definitions" begin
        test(HandleDefinition, handle_by_name, :VkInstance, :(
            mutable struct Instance <: Handle
                vks::VkInstance
                refcount::RefCounter
                destructor
                Instance(vks::VkInstance, refcount::RefCounter) = new(vks, refcount, undef)
            end
        ))

        test(HandleDefinition, handle_by_name, :VkPhysicalDevice, :(
            mutable struct PhysicalDevice <: Handle
                vks::VkPhysicalDevice
                instance::Instance
                refcount::RefCounter
                destructor
                PhysicalDevice(vks::VkPhysicalDevice, instance::Instance, refcount::RefCounter) = new(vks, instance, refcount, undef)
            end
        ))

        test(HandleDefinition, handle_by_name, :VkDevice, :(
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
        test_ex(
            Constructor(
                HandleDefinition(handle_by_name(:VkInstance)),
                APIFunction(create_func(:vkCreateInstance), false),
            ),
            :(
                Instance(enabled_layer_names::AbstractArray, enabled_extension_names::AbstractArray; allocator = C_NULL, next=C_NULL, flags=0, application_info=C_NULL) = unwrap(_create_instance(enabled_layer_names, enabled_extension_names; allocator, next, flags, application_info))
            )
        )

        test_ex(
            Constructor(
                HandleDefinition(handle_by_name(:VkInstance)),
                APIFunction(func_by_name(:vkCreateInstance), false),
            ),
            :(
                Instance(create_info::_InstanceCreateInfo; allocator = C_NULL) = unwrap(_create_instance(create_info; allocator))
            )
        )

        test_ex(
            Constructor(
                HandleDefinition(handle_by_name(:VkInstance)),
                VulkanGen.promote_hl(APIFunction(func_by_name(:vkCreateInstance), false)),
            ),
            :(
                Instance(create_info::InstanceCreateInfo; allocator = C_NULL) = unwrap(create_instance(create_info; allocator))
            )
        )

        test_ex(
            Constructor(
                HandleDefinition(handle_by_name(:VkDebugReportCallbackEXT)),
                APIFunction(create_func(:vkCreateDebugReportCallbackEXT), true),
            ),
            :(
                DebugReportCallbackEXT(instance, pfn_callback::FunctionPtr, fptr_create::FunctionPtr, fptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0, user_data = C_NULL) = unwrap(_create_debug_report_callback_ext(instance, pfn_callback, fptr_create, fptr_destroy; allocator, next, flags, user_data))
            )
        )

        test_ex(
            Constructor(
                HandleDefinition(handle_by_name(:VkDeferredOperationKHR)),
                APIFunction(func_by_name(:vkCreateDeferredOperationKHR), false),
            ),
            :(
                DeferredOperationKHR(device; allocator = C_NULL) = unwrap(_create_deferred_operation_khr(device; allocator))
            )
        )

        test_ex(
            Constructor(
                HandleDefinition(handle_by_name(:VkRenderPass)),
                promote_hl(APIFunction(create_func(:vkCreateRenderPass), false)),
            ),
            :(
                RenderPass(device, attachments::AbstractArray, subpasses::AbstractArray, dependencies::AbstractArray; allocator = C_NULL, next = C_NULL, flags = 0) = unwrap(create_render_pass(device, attachments, subpasses, dependencies; allocator, next, flags))
            ),
        )

        test_ex(
            Constructor(
                HandleDefinition(handle_by_name(:VkRenderPass)),
                promote_hl(APIFunction(create_func(:vkCreateRenderPass2), false)),
            ),
            :(
                RenderPass(device, attachments::AbstractArray, subpasses::AbstractArray, dependencies::AbstractArray, correlated_view_masks::AbstractArray; allocator = C_NULL, next = C_NULL, flags = 0) = unwrap(create_render_pass_2(device, attachments, subpasses, dependencies, correlated_view_masks; allocator, next, flags))
            ),
        )
    end
end
