; ((text) @injection.content
;     (#not-has-ancestor? @injection.content "envoy")
;     (#not-has-parent? @injection.content  "comment") ; ✅  Please update to v.0.9.1 for this to work! 
;     (#set! injection.combined)
;     (#set! injection.language php))
;
; ; could be bash or zsh
; ; or whatever tree-sitter grammar you have.
; ((text) @injection.content
;     (#has-ancestor? @injection.content "envoy")
;     (#set! injection.combined)
;     (#set! injection.language bash))
;
; ; 🚧  Available for experimental split_parser see issue #5 
; ((php_only) @injection.content
;    (#set! injection.language php_only))
; ((parameter) @injection.content
;    (#set! injection.language php_only))

((text) @injection.content
    (#not-has-ancestor? @injection.content "envoy")
    (#set! injection.combined)
    (#set! injection.language php))

; could be bash or zsh
; or whatever tree-sitter grammar you have.
((text) @injection.content
    (#has-ancestor? @injection.content "envoy")
    (#set! injection.combined)
    (#set! injection.language zsh))

; 🚧  Available for experimental split_parser see issue #5 
((php_only) @injection.content
   (#set! injection.language php_only))
((parameter) @injection.content
   (#set! injection.language php_only))
