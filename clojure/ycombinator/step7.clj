(ns step7)

(defn Y
  [h]
  ((fn [f] (f f)) (fn [f]
                    (h (fn [n]
                         ((f f) n))))))

(def fact
     (Y (fn [g]
          (fn [n]
            (if (< n 2) 1 (* n (g (dec n))))))))

