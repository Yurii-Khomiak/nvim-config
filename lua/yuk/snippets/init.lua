local personal_snippets_directory = os.getenv("NVIM_PERSONAL_SNIPPETS_DIRECTORY");

if personal_snippets_directory and string.len(personal_snippets_directory) ~= 0 then
    if vim.fn.isdirectory(personal_snippets_directory) ~= 0 then
        vim.opt.rtp:append(personal_snippets_directory)
        require('yuk.personal.snippets')
    end
end
