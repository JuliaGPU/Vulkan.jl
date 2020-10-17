function process_event_vulkan(win, ctx, event, t; vulkan_app)
    e_generic = unsafe_load(event)
    prefix = "Frame " * string(vulkan_app.render_state.frame) * " "
    replprint("", log_term; prefix)
    try
        !isnothing(vulkan_app) && draw!(vulkan_app)
    catch e
        if e isa VulkanError && e.return_code == VK_ERROR_OUT_OF_DATE_KHR
            handle_resize!(vulkan_app)
            @warn "Out of date swapchain was recreated"
        end
    end
    if e_generic.response_type == XCB.XCB_EXPOSE
        replprint("window exposed", log_term; prefix)
        # @info "Window exposed"
    # elseif any(e_generic.response_type .== [XCB.XCB_KEY_PRESS, XCB.XCB_KEY_RELEASE])
    elseif e_generic.response_type == XCB.XCB_KEY_PRESS
        key_event = unsafe_load(convert(Ptr{XCB.xcb_key_press_event_t}, event))
        key = KeyCombination(win.conn, key_event)
        win.window_title[] = "Random title $(rand())"
        if key ∈ [key"q", key"ctrl+q", key"f4"]
            println()
            throw(CloseWindow("Closing window ($key)"))
        elseif key == key"b"
            display(@benchmark(draw!($vulkan_app)))
            println()
        elseif key == key"s"
            win.width[] += 1
        end
    elseif e_generic.response_type == XCB.XCB_EVENT_MASK_BUTTON_PRESS
        button_event = unsafe_load(convert(Ptr{XCB.xcb_button_press_event_t}, event))
        click = Button(button_event)
        state = ButtonState(button_event)
        state_dict = Dict(state)
        printed_state = keys(filter(x -> x.second, state_dict))
        printed_state = isempty(printed_state) ? "" : "with $(join(printed_state, ", ")) button$(length(printed_state) > 1 ? "s" : "") held"
        replprint("$click at $(button_event.event_x), $(button_event.event_y) $(printed_state)", log_term; prefix, newline=1)
    end
    !isnothing(vulkan_app) && next_frame!(vulkan_app)
end

function create_window(;width=512, height=512)
    connection = Connection()
    setup = XCB.Setup(connection)
    iter = xcb_setup_roots_iterator(setup.h)
    screen = unsafe_load(iter.data)
    mask = |(XCB.XCB_CW_BACK_PIXEL, XCB.XCB_CW_EVENT_MASK)
    value_list = [screen.black_pixel, |(XCB.XCB_EVENT_MASK_EXPOSURE, XCB.XCB_EVENT_MASK_KEY_PRESS, XCB.XCB_EVENT_MASK_KEY_RELEASE, XCB.XCB_EVENT_MASK_BUTTON_PRESS, XCB.XCB_EVENT_MASK_BUTTON_RELEASE, XCB.XCB_EVENT_MASK_STRUCTURE_NOTIFY)]
    window = XCB.Window(connection, screen, mask, value_list ; x=0, y=1000, border_width=50, window_title="XCB window", icon_title="XCB", width, height)
    ctx = XCB.GraphicsContext(connection, window, |(XCB.XCB_GC_FOREGROUND, XCB.XCB_GC_GRAPHICS_EXPOSURES), [0, 0, screen.black_pixel])
    xcb_map_window(connection.h, window.id)
    flush(connection)
    
    window
end