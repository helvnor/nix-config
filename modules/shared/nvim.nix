{ pkgs, inputs, ... }:
{
  home.file.".config/nvim" = {
    source = inputs.dotfiles + "/nvim";
    recursive = true;
  };

  programs.neovim = {
    enable = true;
    withPython3 = false;
    withRuby = false;
  };

  home.packages = with pkgs; [

    # LSP Servers
    typescript-language-server # tsserver
    vscode-langservers-extracted # html, cssls
    lua-language-server # lua_ls
    nil # nil_ls
    gopls # gopls
    rust-analyzer # rust_analyzer
    clang-tools # clangd
    pyright # pyright
    marksman # marksman
    templ # templ
    angular-language-server # angularls
    emmet-ls # emmet_ls
    tailwindcss-language-server # tailwind
    dockerfile-language-server # dockerls
    sqls # For SQL language server
    graphql-language-service-cli # graphql
    golangci-lint-langserver # Go

    # Linters
    eslint
    python3Packages.flake8 # flake8
    luajitPackages.luacheck # luacheck
    checkmake # checkmake
    hadolint # hadolint
    proselint # prose
    vale # vale
    golangci-lint # Go

    # Formatters
    prettier # prettier
    prettierd
    stylua # stylua
    python3Packages.black # black
    python3Packages.isort # isort
    rustfmt # rustfmt
    nixfmt # nixfmt
    pgformatter # pg_format
    libxml2 # xmllint
  ];
}
