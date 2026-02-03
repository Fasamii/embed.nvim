;; extends

; comment maker in foos (sql)
(
 (block_comment) @_comment
 . (_ (string_content) @injection.content)
 (#lua-match? @_comment "sql")
 (#set! injection.language "sql")
)
; comment maker in declarations (sql)
(
  (block_comment) @_comment
  . value: (_ (string_content) @injection.content)
  (#lua-match? @_comment "sql")
  (#set! injection.language "sql")
)

; comment marker in foos (lua)
(
 (block_comment) @_comment
 . (_ (string_content) @injection.content)
 (#lua-match? @_comment "lua")
 (#set! injection.language "lua")
)
; comment marker in declarations
(
  (block_comment) @_comment
  . value: (_ (string_content) @injection.content)
  (#lua-match? @_comment "lua")
  (#set! injection.language "lua")
)

; sqlx query (sql)
(call_expression
  function: (scoped_identifier
    path: (identifier) @sqlx_path
    name: (identifier) @sqlx_fn)
  arguments:
    (arguments
  	  (string_literal
  	    (string_content) @injection.content))

  (#eq? @sqlx_path "sqlx")
  (#eq? @sqlx_fn "query")
  (#set! injection.language "sql")
  (#set! injection.combined)
)

; FIXME: LSP semantic tokens overriding sql hi groups
; sqlx query macro (sql)
(macro_invocation
  macro: (scoped_identifier
	path: (identifier) @_path
    name: (identifier) @_macro)
  (token_tree
	(_
	  (string_content) @injection.content))
  (#eq? @_path "sqlx")
  (#eq? @_macro "query")
  (#set! injection.language "sql")
  (#set! injection.combined)
)

