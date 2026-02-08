;; extends 

((comment
    content: (comment_content) @injection.language)
  .
  (variable_declaration
    (assignment_statement
      (expression_list
        value: (string
          content: (string_content) @injection.content))))
  
  (#gsub! @injection.language "^%s*(.-)%s*$" "%1")
  (#set! injection.include-children))
