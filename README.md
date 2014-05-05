a parse running file gem
parse Garmin tcx file like this

par = RunningfileParse::TcxParse.new(filename)
par.runsummary #run summary
par.rundetails #run detail array   
