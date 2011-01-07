(ns step4)

(defn yrecur
  [f]
  (f f))

(def fact
     (yrecur
      (fn [f]
        (let [g (fn [n] ((f f) n))]
          (fn [n]
            (if (< n 2) 1 (* n (g (dec n)))))))))
