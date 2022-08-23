local status, nvimComment = pcall(require, "nvim_comment")
if (not status) then return end

nvimComment.setup {
}
