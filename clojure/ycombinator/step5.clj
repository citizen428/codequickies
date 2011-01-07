(ns step5)

(defn yrecur
  [f]
  (f f))

(defn wrap
  [h]
  (yrecur
   (fn [f]
     (let [g (fn [n] ((f f) n))]
       (h g)))))

(def fact
     (wrap
      (fn [g]
        (fn [n]
          (if (< n 2) 1 (* n (g (dec n))))))))
