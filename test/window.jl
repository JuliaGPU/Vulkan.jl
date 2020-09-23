function process_event_vulkan(connection, window, ctx, event, t; vulkan_app)
    @info "Frame $(vulkan_app.render_state.frame)"
    draw!(vulkan_app)
    e_generic = unsafe_load(event)
    println("$t s")
    if e_generic.response_type == XCB.XCB_EXPOSE
        @info "Window exposed"
    # elseif any(e_generic.response_type .== [XCB.XCB_KEY_PRESS, XCB.XCB_KEY_RELEASE])
    elseif e_generic.response_type == XCB.XCB_KEY_PRESS
        key_event = unsafe_load(convert(Ptr{XCB.xcb_key_press_event_t}, event))
        key = KeyCombination(connection, key_event)
        window.window_title[] = "Random title $(rand())"
        if key ∈ [key"q", key"ctrl+q", key"f4"]
            throw(CloseWindow("Closing window ($key)"))
        elseif key == key"b"
            display(@benchmark(draw!($vulkan_app)))
            println()
        end
    elseif e_generic.response_type == XCB.XCB_EVENT_MASK_BUTTON_PRESS
        button_event = unsafe_load(convert(Ptr{XCB.xcb_button_press_event_t}, event))
        click = Button(button_event)
        state = ButtonState(button_event)
        state_dict = Dict(state)
        printed_state = keys(filter(x -> x.second, state_dict))
        printed_state = isempty(printed_state) ? "" : "with $(join(printed_state, ", ")) button$(length(printed_state) > 1 ? "s" : "") held"
        @info "$click at $(button_event.event_x), $(button_event.event_y) $(printed_state)"
    end
    next_frame!(vulkan_app)
end

function create_window(;width=512, height=512)
    connection = Connection()
    setup = XCB.Setup(connection)
    iter = xcb_setup_roots_iterator(setup.h)
    screen = unsafe_load(iter.data)
    @debug screen
    window = XCB.Window(connection, screen, |(XCB.XCB_CW_BACK_PIXEL, XCB.XCB_CW_EVENT_MASK), 
                    [screen.black_pixel, |(XCB.XCB_EVENT_MASK_EXPOSURE, XCB.XCB_EVENT_MASK_KEY_PRESS, XCB.XCB_EVENT_MASK_KEY_RELEASE, XCB.XCB_EVENT_MASK_BUTTON_PRESS, XCB.XCB_EVENT_MASK_BUTTON_RELEASE)];
                    x=0, y=1000, border_width=50, window_title="XCB window", icon_title="XCB", width, height)
    ctx = XCB.GraphicsContext(connection, window, |(XCB.XCB_GC_FOREGROUND, XCB.XCB_GC_GRAPHICS_EXPOSURES), [0, 0, screen.black_pixel])
    xcb_map_window(connection.h, window.id)
    flush(connection)
    
    window
end

# function draw_triangle()
#     frame_index = mod(frame - 1, max_simultaneously_drawn_frames) + 1
#     wait_for_fences(device, [fen_wait_images_drawn[frame_index]], true, typemax(UInt64))
#     index = acquire_next_image_khr(device, swapchain, timeout=typemax(UInt64); semaphore=sem_image_available[frame_index])
#     if !isnothing(fen_wait_acquire_images[index])
#         wait_for_fences(device, [fen_wait_acquire_images[index]], true, typemax(UInt64))
#     end
#     fen_wait_acquire_images[index] = fen_wait_images_drawn[frame_index]
#     submit_info = SubmitInfo([sem_image_available[frame_index]], [PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT, PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT], [command_buffers[index]], [sem_render_finished[frame_index]])
#     reset_fences(device, [fen_wait_images_drawn[frame_index]])
#     queue_submit(graphics_queue, [submit_info], fence=fen_wait_images_drawn[frame_index])
#     present_info = PresentInfoKHR([sem_render_finished[frame_index]], [swapchain], [index - 1])
#     queue_present_khr(present_queue, present_info)
# end