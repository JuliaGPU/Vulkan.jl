mutable struct RenderState
    frame
    frame_index
    arr_sem_image_available
    arr_sem_render_finished
    arr_fen_image_drawn
    arr_fen_acquire_image
    arr_command_buffers
    max_simultaneously_drawn_frames
    function RenderState(args...)
        rs = new(args...)
        finalizer(rs) do x
            finalize.(x.arr_sem_image_available)
            finalize.(x.arr_sem_render_finished)
            finalize.(x.arr_fen_acquire_image)
            finalize.(x.arr_fen_image_drawn)
        end
    end
end

function next_frame!(rs::RenderState)
    rs.frame += 1
    rs.frame_index = mod(rs.frame - 1, rs.max_simultaneously_drawn_frames) + 1
end
