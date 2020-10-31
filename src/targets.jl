function prepare_rendering_to_target!(app, t::Target)
    add_render_pass!(app, RenderPassPresent(t))
    add_framebuffers!(app, t)
    setup_viewport!(app)
end