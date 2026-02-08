; extends

; (((inline) @_inline (#match? @_inline "^\(import\|export\)")) @injection.content
; 	(#set! injection.language "tsx"))

; ;; Generic code block - auto-detect language
; ((fenced_code_block
;   (info_string) @injection.language
;   (code_fence_content) @injection.content)
;  (#set! injection.include-children))
;
; ;; JavaScript variations
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#any-of? @_lang "js" "jsx")
;  (#set! injection.language "javascript")
;  (#set! injection.include-children))
;
; ;; TypeScript variations
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#any-of? @_lang "ts" "tsx")
;  (#set! injection.language "typescript")
;  (#set! injection.include-children))
;
; ;; Python
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#any-of? @_lang "py" "python3")
;  (#set! injection.language "python")
;  (#set! injection.include-children))
;
; ;; Rust
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#any-of? @_lang "rs" "rust")
;  (#set! injection.language "rust")
;  (#set! injection.include-children))
;
; ;; Go
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#any-of? @_lang "go" "golang")
;  (#set! injection.language "go")
;  (#set! injection.include-children))
;
; ;; C/C++
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#any-of? @_lang "c++" "cxx")
;  (#set! injection.language "cpp")
;  (#set! injection.include-children))
;
; ;; Java
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#eq? @_lang "java")
;  (#set! injection.language "java")
;  (#set! injection.include-children))
;
; ;; Kotlin
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#any-of? @_lang "kt" "kotlin")
;  (#set! injection.language "kotlin")
;  (#set! injection.include-children))
;
; ;; Scala
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#eq? @_lang "scala")
;  (#set! injection.language "scala")
;  (#set! injection.include-children))
;
; ;; Swift
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#eq? @_lang "swift")
;  (#set! injection.language "swift")
;  (#set! injection.include-children))
;
; ;; Elixir
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#any-of? @_lang "ex" "exs" "elixir")
;  (#set! injection.language "elixir")
;  (#set! injection.include-children))
;
; ;; Ruby
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#any-of? @_lang "rb" "ruby")
;  (#set! injection.language "ruby")
;  (#set! injection.include-children))
;
; ;; PHP
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#eq? @_lang "php")
;  (#set! injection.language "php")
;  (#set! injection.include-children))
;
; ;; Shell/Bash
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#any-of? @_lang "sh" "shell" "zsh" "fish")
;  (#set! injection.language "bash")
;  (#set! injection.include-children))
;
; ;; Vim
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#any-of? @_lang "vim" "viml" "vimscript")
;  (#set! injection.language "vim")
;  (#set! injection.include-children))
;
; ;; TOML
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#eq? @_lang "toml")
;  (#set! injection.language "toml")
;  (#set! injection.include-children))
;
; ;; YAML
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#any-of? @_lang "yml" "yaml")
;  (#set! injection.language "yaml")
;  (#set! injection.include-children))
;
; ;; JSON
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#any-of? @_lang "json" "jsonc" "json5")
;  (#set! injection.language "json")
;  (#set! injection.include-children))
;
; ;; HTML
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#eq? @_lang "html")
;  (#set! injection.language "html")
;  (#set! injection.include-children))
;
; ;; CSS
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#any-of? @_lang "css" "scss" "sass" "less")
;  (#set! injection.language "css")
;  (#set! injection.include-children))
;
; ;; SQL
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#any-of? @_lang "sql" "mysql" "postgres" "postgresql")
;  (#set! injection.language "sql")
;  (#set! injection.include-children))
;
; ;; GraphQL
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#any-of? @_lang "graphql" "gql")
;  (#set! injection.language "graphql")
;  (#set! injection.include-children))
;
; ;; Zig
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#eq? @_lang "zig")
;  (#set! injection.language "zig")
;  (#set! injection.include-children))
;
; ;; Dart
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#eq? @_lang "dart")
;  (#set! injection.language "dart")
;  (#set! injection.include-children))
;
; ;; Haskell
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#any-of? @_lang "hs" "haskell")
;  (#set! injection.language "haskell")
;  (#set! injection.include-children))
;
; ;; C#
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#any-of? @_lang "cs" "csharp" "c#")
;  (#set! injection.language "c_sharp")
;  (#set! injection.include-children))
;
; ;; Dockerfile
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#any-of? @_lang "dockerfile" "docker")
;  (#set! injection.language "dockerfile")
;  (#set! injection.include-children))
;
; ;; Makefile
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#any-of? @_lang "make" "makefile")
;  (#set! injection.language "make")
;  (#set! injection.include-children))
;
; ;; Diff/Patch
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#any-of? @_lang "diff" "patch")
;  (#set! injection.language "diff")
;  (#set! injection.include-children))
;
; ;; Regex
; ((fenced_code_block
;   (info_string) @_lang
;   (code_fence_content) @injection.content)
;  (#any-of? @_lang "regex" "regexp")
;  (#set! injection.language "regex")
;  (#set! injection.include-children))
