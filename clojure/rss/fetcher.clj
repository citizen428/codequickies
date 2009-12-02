;; Copyright (c) 2009 Michael Kohl

(ns rss/fetcher
  (:use [clojure.contrib.zip-filter.xml :only (attr xml->)]
        [clojure.contrib.str-utils :only (str-join)]
        [clojure.contrib.duck-streams] [clojure.contrib.http.agent])
  (:require [clojure.zip :as zip] [clojure.xml :as xml])
  (:import [java.net URL]))

(defn get-enclosure-urls [url]
  "Extracts enclosure URLs from an RSS 2.0 feed"
  (let [feed (zip/xml-zip (xml/parse url))]
    (xml-> feed :channel :item :enclosure (attr :url))))

(defn fetch-enclosures [urls]
  "Fetches the files provided in an URL list"
  (doseq [url urls]
    (let [[name] (re-find #"(\w|[-.])+$" url)]
      (http-agent url
                  :handler (fn [agnt] (with-open [w (writer name)]
                                        (copy (stream agnt) w)))))))

(comment
  (fetch-enclosures (get-enclosure-urls <feed adress>))
)

