(ns step1)

(defn fact
  [n]
  (if (< n 2) 1 (* n (fact (dec n)))))
