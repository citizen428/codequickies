(use '[clojure.string :only [join]])

(defn tag-builder [tag]
  (fn [& args]
    (let [[content attrs] (partition-by map? args)
          attr-str (join (map (fn [[x y]] (format "%s=\"%s\"" (name x) y))
                              (first attrs)))
          padding (if (zero? (count attrs)) "" " ")]
      (format "<%s%s%s>%s</%s>" tag padding attr-str (join " " content) tag))))
