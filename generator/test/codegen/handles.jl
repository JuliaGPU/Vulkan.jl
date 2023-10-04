@testset "Handles" begin
    @testset "Definitions" begin
        test_ex(HandleDefinition(api.handles[:VkInstance]), :(
            mutable struct Instance <: Handle
                vks::VkInstance
                refcount::RefCounter
                destructor
                Instance(vks::VkInstance, refcount::RefCounter) = new(vks, refcount, undef)
            end
        ))

        test_ex(HandleDefinition(api.handles[:VkPhysicalDevice]), :(
            mutable struct PhysicalDevice <: Handle
                vks::VkPhysicalDevice
                instance::Instance
                refcount::RefCounter
                destructor
                PhysicalDevice(vks::VkPhysicalDevice, instance::Instance, refcount::RefCounter) = new(vks, instance, refcount, undef)
            end
        ))

        test_ex(HandleDefinition(api.handles[:VkDevice]), :(
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
                HandleDefinition(api.handles[:VkInstance]),
                APIFunction(api.constructors[:vkCreateInstance], false),
            ),
            :(
                Instance(enabled_layer_names::AbstractArray, enabled_extension_names::AbstractArray; allocator = C_NULL, next=C_NULL, flags=0, application_info=C_NULL) = unwrap(_create_instance(enabled_layer_names, enabled_extension_names; allocator, next, flags, application_info))
            )
        )

        test_ex(
            Constructor(
                HandleDefinition(api.handles[:VkInstance]),
                APIFunction(api.functions[:vkCreateInstance], false),
            ),
            :(
                Instance(create_info::_InstanceCreateInfo; allocator = C_NULL) = unwrap(_create_instance(create_info; allocator))
            )
        )

        test_ex(
            Constructor(
                HandleDefinition(api.handles[:VkInstance]),
                VulkanGen.promote_hl(APIFunction(api.functions[:vkCreateInstance], false)),
            ),
            :(
                Instance(create_info::InstanceCreateInfo; allocator = C_NULL) = unwrap(create_instance(create_info; allocator))
            )
        )

        test_ex(
            Constructor(
                HandleDefinition(api.handles[:VkDebugReportCallbackEXT]),
                APIFunction(api.constructors[:vkCreateDebugReportCallbackEXT], true),
            ),
            :(
                DebugReportCallbackEXT(instance, pfn_callback::FunctionPtr, fptr_create::FunctionPtr, fptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0, user_data = C_NULL) = unwrap(_create_debug_report_callback_ext(instance, pfn_callback, fptr_create, fptr_destroy; allocator, next, flags, user_data))
            )
        )

        test_ex(
            Constructor(
                HandleDefinition(api.handles[:VkDeferredOperationKHR]),
                APIFunction(api.functions[:vkCreateDeferredOperationKHR], false),
            ),
            :(
                DeferredOperationKHR(device; allocator = C_NULL) = unwrap(_create_deferred_operation_khr(device; allocator))
            )
        )

        test_ex(
            Constructor(
                HandleDefinition(api.handles[:VkRenderPass]),
                promote_hl(APIFunction(api.constructors[:vkCreateRenderPass], false)),
            ),
            :(
                RenderPass(device, attachments::AbstractArray, subpasses::AbstractArray, dependencies::AbstractArray; allocator = C_NULL, next = C_NULL, flags = 0) = unwrap(create_render_pass(device, attachments, subpasses, dependencies; allocator, next, flags))
            ),
        )

        test_ex(
            Constructor(
                HandleDefinition(api.handles[:VkRenderPass]),
                promote_hl(APIFunction(api.constructors[:vkCreateRenderPass2], false)),
            ),
            :(
                RenderPass(device, attachments::AbstractArray, subpasses::AbstractArray, dependencies::AbstractArray, correlated_view_masks::AbstractArray; allocator = C_NULL, next = C_NULL, flags = 0) = unwrap(create_render_pass_2(device, attachments, subpasses, dependencies, correlated_view_masks; allocator, next, flags))
            ),
        )
    end
end;
