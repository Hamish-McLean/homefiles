(doom! :input
       :completion company
       :ui doom doom-dashboard modeline ligatures ophints
       :editor (evil +everywhere)
       :emacs (dired +icons)
       :term vterm
       :tools magit direnv
       :lang emacs-lisp nix data
       :os tty
       :config literate (default +bindings +smartparens)
       )
