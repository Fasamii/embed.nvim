;; extends

; comment marker in declarations and foos (any)
(
  (block_comment) @injection.language
  . (_ (string_content) @injection.content)
  (#set! injection.combined)
  (#gsub! @injection.language "^%s*/%*%s*(.-)%s*%*/%s*$" "%1")
)

; sql with common function names (sql)
(call_expression
  function: (field_expression
	field: (field_identifier) @_name)
  arguments: (arguments
	(_
	  (string_content) @injection.content))

  (#any-of? @_name "execute" "execute_batch" "query" "query_one" "query_opt" "query_optional" "query_as" "query_row" "fetch" "fetch_one" "fetch_all" "fetch_opt" "fetch_optional" "prepare" "prepare_cached")
  (#match? @injection.content "^\\s*([Ss][Ee][Ll][Ee][Cc][Tt]|[Ii][Nn][Ss][Ee][Rr][Tt]|[Uu][Pp][Dd][Aa][Tt][Ee]|[Dd][Ee][Ll][Ee][Tt][Ee]|[Ww][Ii][Tt][Hh]|[Cc][Re][Ee][Aa][Tt][Ee]|[Dd][Rr][Oo][Pp]|[Aa][Ll][Tt][Ee][Rr]|[Tt][Rr][Uu][Nn][Cc][Aa][Tt][Ee]|[Rr][Ee][Pp][Ll][Aa][Cc][Ee])")
  (#set! injection.language "sql")
  (#set! injection.combined)
)

; sqlx::query() foo (sql)
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
; sqlx::query_as() foo (sql)
(call_expression
  function: (generic_function
    function:(scoped_identifier
	  path: (identifier) @_path
	  name: (identifier) @_name
	))
  arguments: 
    (arguments 
	  (_ 
	    (string_content) @injection.content))

  (#eq? @_path "sqlx")
  (#eq? @_name "query_as")
  (#set! injection.language "sql")
  (#set! injection.combined)
)
;
; sqlx::query_scalar() foo (sql)
(call_expression
  function: (generic_function
    function:(scoped_identifier
	  path: (identifier) @_path
	  name: (identifier) @_name
	))
  arguments: 
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
; FIXME: doubled @string.rust overriding sql hi groups
; sqlx::query!() macro (sql)
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
; FIXME: doubled @string.rust overriding sql hi groups
; sqlx::query_as!() macro (sql)
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
; FIXME: doubled @string.rust overriding sql hi groups
; sqlx::query_scalar!() macro (sql)
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

; diesel::sql_query() foo (sql)
(call_expression
  function: (scoped_identifier
    path: (identifier) @_path
    name: (identifier) @_name)
  arguments:
    (arguments
  	  (_
  	    (string_content) @injection.content))

  (#eq? @_path "diesel")
  (#eq? @_name "sql_query")
  (#set! injection.language "sql")
  (#set! injection.combined)
)
;
; diesel::dsl::sql() foo (sql)
(call_expression
  function:
    (generic_function
	  function: (scoped_identifier
	    path: (scoped_identifier
		  path: (identifier) @_path_1
		  name: (identifier) @_path_2)
		name: (identifier) @_name))
  arguments: 
    (arguments
	  (_ 
	    (string_content) @injection.content))

  (#eq? @_path_1 "diesel")
  (#eq? @_path_2 "dsl")
  (#eq? @_name "sql")
  (#set! injection.language "sql")
  (#set! injection.combined)
)

; sea_orm::Query::from_raw_sql() foo (sql)
(call_expression
  function: (scoped_identifier
	path: (scoped_identifier
	  path: (identifier) @_path_1
	  name: (identifier) @_path_2)
	name: (identifier) @_name)
  arguments: 
    (arguments
	  (_
	    (string_content) @injection.content))

  (#eq? @_path_1 "sea_orm")
  (#eq? @_path_2 "Query")
  (#eq? @_name "from_raw_sql")
  (#set! injection.language "sql")
  (#set! injection.combined)
)
;
; sea_orm::Statement::from_string() foo (sql)
(call_expression
  function: (scoped_identifier
    path: (scoped_identifier
	  path: (identifier) @_path_1
	  name: (identifier) @_path_2)
	name: (identifier) @_name)
  arguments: (arguments
	(_
	  (string_content) @injection.content))

  (#eq? @_path_1 "sea_orm")
  (#eq? @_path_2 "Statement")
  (#eq? @_name "from_string")
  (#set! injection.language "sql")
  (#set! injection.combined)
)

; tokio_postgres::Client::query() foo (sql)
(call_expression
  function: (scoped_identifier
	path: (scoped_identifier
	  path: (identifier) @_path_1
	  name: (identifier) @_path_2)
	name: (identifier) @_name)
  arguments: (arguments
	(_
	  (string_content) @injection.content))

  (#eq? @_path_1 "tokio_postgres")
  (#eq? @_path_2 "Client")
  (#eq? @_name "query")
  (#set! injection.language "sql")
  (#set! injection.combined)
)

; mlua::Lua::new().load() foo (lua)
(call_expression
  function: (field_expression
	value: (call_expression
	  function: (scoped_identifier
		path: (scoped_identifier
		  path: (identifier) @_path_1
		  name: (identifier) @_path_2)
		name: (identifier) @_name_1))
	field: (field_identifier) @_name_2)
  arguments:
    (arguments
	  (_
		(string_content) @injection.content))

  (#eq? @_path_1 "mlua")
  (#eq? @_path_2 "Lua")
  (#eq? @_name_1 "new")
  (#eq? @_name_2 "load")
  (#set! injection.language "lua")
  (#set! injection.combined)
)

; rlua::Lua::new().context(|x| x.load()) foo (lua)
(call_expression
  function: (field_expression
	value: (call_expression
	  function: (scoped_identifier
		path: (scoped_identifier
		  path: (identifier) @_path_1
		  name: (identifier) @_path_2)
		name: (identifier) @_name_1))
    field: (field_identifier) @_name_2)
  arguments: (arguments
    (closure_expression
	  parameters: (closure_parameters (identifier) @_val_origin)
	  body: (block
		(expression_statement
		  (call_expression
			function: (field_expression
			  value: (call_expression
				function: (field_expression
				  value:(call_expression 
					function: (field_expression
					  value: (identifier) @_val_match
					  field: (field_identifier) @_name_3)
					arguments: (arguments
					  (_
						(string_content) @injection.content)))))))))))


  (#eq? @_path_1 "rlua")
  (#eq? @_path_2 "Lua")
  (#eq? @_name_1 "new")
  (#eq? @_name_2 "context")
  (#eq? @_val_origin @_val_match)
  (#set! injection.language "lua")
  (#set! injection.combined)
)

; hlua::Lua::new().execute() foo (lua)
(call_expression
  function: (generic_function
	function: (field_expression
	  value: (call_expression
		function: (scoped_identifier
		  path: (scoped_identifier
			path: (identifier) @_path_1
			name: (identifier) @_path_2)
		  name: (identifier) @_name_1))
	  field: (field_identifier) @_name_2))
  arguments: (arguments
	(_
	  (string_content) @injection.content))


  (#eq? @_path_1 "hlua")
  (#eq? @_path_2 "Lua")
  (#eq? @_name_1 "new")
  (#eq? @_name_2 "execute")
  (#set! injection.language "lua")
  (#set! injection.combined)
)
