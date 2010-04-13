(use '(incanter core charts io))
(def usage (read-dataset "/Users/michi/Downloads/report.csv" :header true))

(def instance-types
     (set (filter #(re-find #"BoxUsage" %) ($ :UsageType usage))))

(with-data (->> ($rollup :sum :UsageValue :UsageType usage)
                ($where {:UsageType {:$in instance-types}}))
  (view (bar-chart :UsageType :UsageValue
                   :title "EC2 Instance Usage"
                   :x-label "Instance Types"
                   :y-label "Usage Value")))
