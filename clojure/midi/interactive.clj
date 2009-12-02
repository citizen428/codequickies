;; Copyright (c) 2009 Michael Kohl

(ns midi/interactive
  (:import [javax.sound.midi MidiSystem]
	   [javax.swing JFrame] [java.awt.event KeyListener]))

(let [synth (MidiSystem/getSynthesizer)
      frame (JFrame. "Music Frame")]
  (.open synth)
  (let [channel (aget (.getChannels synth) 0)]
    (doto frame
      (.setSize 300 300)
      (.setDefaultCloseOperation JFrame/EXIT_ON_CLOSE)
      (.addKeyListener
       (proxy [KeyListener] []
         (keyPressed [e]
                     (.noteOn channel (int (.getKeyChar e)) 64))
         (keyReleased [e]
                      (.noteOff channel (int (.getKeyChar e))))
         (keyTyped [e])))
      (.setVisible true))))
