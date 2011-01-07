(ns step3)


(defn yrecur
  [f]
  (f f))

(def fact
     (yrecur (fn [f]
               (fn [n]
                 (if (< n 2) 1 (* n ((f f) (dec n))))))))
