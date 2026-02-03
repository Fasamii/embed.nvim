;; extends

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

; sqlx query macro (sql)
(macro_invocation
  macro: (scoped_identifier
	path: (identifier) @sqlx_path
    name: (identifier) @sqlx_macro)
  (token_tree
	(_
	  (string_content) @injection.content))

  (#eq? @sqlx_path "sqlx")
  (#eq? @sqlx_macro "query")
  (#set! injection.language "sql")
  (#set! injection.combined)
)
