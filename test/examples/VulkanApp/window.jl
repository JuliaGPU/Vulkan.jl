function create_window(;width=512, height=512)
    connection = Connection()
    setup = XCB.Setup(connection)
    iter = XCB.xcb_setup_roots_iterator(setup.h)
    screen = unsafe_load(iter.data)
    mask = |(XCB.XCB_CW_BACK_PIXEL, XCB.XCB_CW_EVENT_MASK)
    value_list = [screen.black_pixel, |(XCB.XCB_EVENT_MASK_EXPOSURE, XCB.XCB_EVENT_MASK_KEY_PRESS, XCB.XCB_EVENT_MASK_KEY_RELEASE, XCB.XCB_EVENT_MASK_BUTTON_PRESS, XCB.XCB_EVENT_MASK_BUTTON_RELEASE, XCB.XCB_EVENT_MASK_STRUCTURE_NOTIFY, XCB.XCB_EVENT_MASK_ENTER_WINDOW, XCB.XCB_EVENT_MASK_LEAVE_WINDOW, XCB.XCB_EVENT_MASK_POINTER_MOTION, XCB.XCB_EVENT_MASK_SUBSTRUCTURE_REDIRECT, XCB.XCB_EVENT_MASK_KEYMAP_STATE)]
    window = XCBWindow(connection, screen, mask, value_list ; x=0, y=1000, border_width=50, window_title="XCB window", icon_title="XCB", width, height)
end
