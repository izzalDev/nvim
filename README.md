# Konfigurasi Neovim

Repository ini berisi konfigurasi lengkap Neovim yang mencakup pengaturan dasar, plugin, keymap, dan fitur tambahan untuk meningkatkan produktivitas saat coding.

Pada bagian ini, kita akan membahas **keymap** terlebih dahulu — khususnya keymap untuk [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim).

---

## 📌 Keymap Telescope

Telescope adalah plugin pencarian yang sangat fleksibel di Neovim.
Berikut daftar keymap yang digunakan untuk memanggil berbagai fitur **builtin** Telescope.

| Keymap        | Aksi                          | Deskripsi                                  |
|---------------|-------------------------------|--------------------------------------------|
| `<leader>ff`  | `builtin.find_files`          | Mencari file di dalam workspace            |
| `<leader>fg`  | `builtin.live_grep`           | Mencari teks secara langsung (live grep)   |
| `<leader>fb`  | `builtin.buffers`             | Menampilkan dan berpindah antar buffer     |
| `<leader>fh`  | `builtin.help_tags`           | Mencari dokumentasi bantuan Neovim         |
