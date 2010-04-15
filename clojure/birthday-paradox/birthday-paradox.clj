(ns birthday-paradox
  (:use [incanter charts]))

(defn number-pairs
  "Returns possible number of pairs for n people"
  [n]
  (/ (* n (dec n)) 2))

(comment 
  (defn number-pairs
    "Alternate version needing clojure.contrib.combinatorics/combinations"
    [n]
    (count (combinations (range 0 n) 2))))

(defn shared-bday-prop
  "Probability of shared birthday in a group of n people"
  [n]
  (- 1 (pow (/ 364 365) (number-pairs n))))

(view (function-plot shared-bday-prop 2 71 :step-size 1))
