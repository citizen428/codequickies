;; Copyright (c) 2009 Michael Kohl

(ns midi/keyboard
  (:import [javax.sound.midi MidiSystem Sequence MidiEvent ShortMessage])
  (:use [clojure.contrib.seq-utils :only (indexed)]))

(loop [line (read-line)]
  (if (re-find #"exit" line) (System/exit 0))
  (def sq (Sequence. Sequence/PPQ 2))
  (def track (.createTrack sq))
  (doseq [[idx note] (indexed line)]
    (let [msg (ShortMessage.)]
      (.setMessage msg ShortMessage/NOTE_ON (int note) 64)
      (.add track (MidiEvent. msg idx))))
  (let [msg (ShortMessage.)]
    (.setMessage msg ShortMessage/STOP)
    (.add track (MidiEvent. msg (+ (.length line) 1))))
  (doto (MidiSystem/getSequencer)
    (.open)
    (.setSequence sq)
    (.start))
  (recur (read-line)))





