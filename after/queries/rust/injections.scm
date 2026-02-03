;; extends

; comment marker in declarations and foos (any)
(
  (block_comment) @injection.language
  . (_ (string_content) @injection.content)
  (#set! injection.combined)
  (#gsub! @injection.language "^%s*/%*%s*(.-)%s*%*/%s*$" "%1")
)

; sqlx::query foo (sql)
(call_expression
  function: (scoped_identifier
    path: (identifier) @_path
    name: (identifier) @_name)
  arguments:
    (arguments
  	  (_
  	    (string_content) @injection.content))

  (#eq? @_path "sqlx")
  (#eq? @_name "query")
  (#set! injection.language "sql")
  (#set! injection.combined)
)
;
; sqlx::query_as foo (sql)
(call_expression
  function: (generic_function
    function:(scoped_identifier
	  path: (identifier) @_path
	  name: (identifier) @_name
	))
  . arguments: 
    (arguments 
	  (_ 
	    (string_content) @injection.content))

  (#eq? @_path "sqlx")
  (#eq? @_name "query_as")
  (#set! injection.language "sql")
  (#set! injection.combined)
)
;
; sqlx::query_scalar foo (sql)
(call_expression
  function: (generic_function
    function:(scoped_identifier
	  path: (identifier) @_path
	  name: (identifier) @_name
	))
  . arguments: 
    (arguments 
	  (_ 
	    (string_content) @injection.content))

  (#eq? @_path "sqlx")
  (#eq? @_name "query_scalar")
  (#set! injection.language "sql")
  (#set! injection.combined)
)
;
; FIXME: LSP semantic tokens overriding sql hi groups
; sqlx::query macro (sql)
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
;
; FIXME: LSP semantic tokens overriding sql hi groups
; sqlx::query_as macro (sql)
(macro_invocation
  macro: (scoped_identifier
	path: (identifier) @_path
    name: (identifier) @_macro)
  (token_tree
	(_
	  (string_content) @injection.content))
  (#eq? @_path "sqlx")
  (#eq? @_macro "query_as")
  (#set! injection.language "sql")
  (#set! injection.combined)
)
;
; FIXME: LSP semantic tokens overriding sql hi groups
; sqlx::query_scalar macro (sql)
(macro_invocation
  macro: (scoped_identifier
	path: (identifier) @_path
    name: (identifier) @_macro)
  (token_tree
	(_
	  (string_content) @injection.content))
  (#eq? @_path "sqlx")
  (#eq? @_macro "query_scalar")
  (#set! injection.language "sql")
  (#set! injection.combined)
)

