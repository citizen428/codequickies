(ns step2)

(defn fact
  [f]
  (fn [n]
    (if (< n 2) 1 (* n ((f f) (dec n))))))
