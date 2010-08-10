(use '(incanter core charts io))

(def all-langs (read-dataset "http://github.com/ezgraphs/R-Programs/raw/master/git_lang_stats.txt"
                             :header true
                             :delim \;))

(def func-langs #{"Clojure" "Erlang" "F#" "Haskell" "OCaml" "Scala" "Scheme"})

(with-data ($where {:Language {:$in func-langs}} all-langs)
  (view (bar-chart :Language
                   :Users
                   :title "Users per language on Github"
                   :x-label "Language"
                   :y-label "Users"
                   :set-theme :dark))

  (view (bar-chart :Language
                   :Repositories
                   :title "Repositories per language on Github"
                   :x-label "Language"
                   :y-label "Repositories"))
  
  (view (bar-chart :Language
                   (map / ($ :Repositories) ($ :Users))
                   :title "Repositories per user on Github"
                   :x-label "Language"
                   :y-label "Repositories/user"))
    
  (view (pie-chart :Language
                   :Users
                   :title "Users of functional languages on Github"
                   :legend true)))
