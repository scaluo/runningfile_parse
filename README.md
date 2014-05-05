a parse running file gem

now only can parse tcx file

# Usage #

```
par = RunningfileParse::TcxParse.new(filename)
summary = par.runsummary

#puts summary

puts summary.totaltime
puts summary.distance
puts summary.maxspeed
puts summary.calories

#puts detail

par.rundetails.each do |detail|
  puts detail.currtime
  puts detail.lati
  puts detail.long
  puts detail.distance
  puts detail.speed
end

```   
