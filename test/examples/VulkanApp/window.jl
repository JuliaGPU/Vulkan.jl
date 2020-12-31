function create_window(;width=512, height=512)
    connection = Connection()
    setup = XCB.Setup(connection)
    iter = XCB.xcb_setup_roots_iterator(setup.h)
    screen = unsafe_load(iter.data)
    XCBWindow(connection, screen; x=0, y=1000, width, height, border_width=50, window_title="XCB window", icon_title="XCB", attributes=[XCB.XCB_CW_BACK_PIXEL], values=[screen.black_pixel])
end
