(ns step6)

(defn yrecur
  [f]
  (f f))

(defn wrap
  [h]
  (yrecur
   (fn [f]
     (h (fn [n] ((f f) n))))))

(def fact
     (wrap
      (fn [g]
        (fn [n]
          (if (< n 2) 1 (* n (g (dec n))))))))
