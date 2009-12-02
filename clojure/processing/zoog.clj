;; Copyright (c) 2009 Michael Kohl

;; Zoog (c) Daniel Shiffman
;; http://www.learningprocessing.com

(ns processing
  (:use rosado.processing)
  (:import (javax.swing JFrame) (processing.core PApplet)))

(defn zoog
  [dst]
  (background-int 255)
  (ellipse-mode CENTER)
  (rect-mode CENTER)
  ; Body
  (stroke-int 0)
  (fill 150)
  (rect 100 100 20 100)
  ; Head
  (fill 150)
  (ellipse 100 70 60 60)
  ; Eyes
  (fill 0)
  (ellipse 81 70 16 32)
  (ellipse 119 70 16 32)
  ; Legs
  (stroke-int 0)
  (line 90 150 80 160)
  (line 110 150 120 160))

(def p5-applet
     (proxy [PApplet] []
       (setup []
              (binding [*applet* this]
                (size 200 200)
                (smooth)
                (framerate 30)))

       (draw []
             (binding [*applet* this]
               (zoog this)))))

(.init p5-applet)

(def swing-frame (JFrame. "Clojure Zoog"))
(doto swing-frame
  (.setDefaultCloseOperation JFrame/EXIT_ON_CLOSE)
  (.setSize 200 200)
  (.add p5-applet)
  (.pack)
  (.show))