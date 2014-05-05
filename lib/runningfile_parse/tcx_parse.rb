require "rexml/document"
module RunningfileParse
  class TcxParse
    attr_accessor :runsummary,:rundetails
     def initialize(filename)
          file = File.new(filename)
          doc = REXML::Document.new file
          @rundetails = []
          @runsummary = RunSummary.new
          lapnode = REXML::XPath.match(doc,"//TrainingCenterDatabase/Activities/Activity/Lap")
          parsehead(lapnode)
          REXML::XPath.each(lapnode,"Track/Trackpoint") do |node|
            parsedetail(node)
          end
     end

     private

     def changespeed(speed)
          speed*60*60/1000
     end

     def parsehead(node)
          if @runsummary
               @runsummary.totaltime = REXML::XPath.first(node,"TotalTimeSeconds").text.to_f
               @runsummary.distance = REXML::XPath.first(node,"DistanceMeters").text.to_f
               @runsummary.maxspeed = REXML::XPath.first(node,"MaximumSpeed").text.to_f
               @runsummary.calories = REXML::XPath.first(node,"Calories").text.to_f
          end
     end

     def parsedetail(node)
       currtimenode = REXML::XPath.first(node,"Time")
       latinode = REXML::XPath.first(node,"Position/LatitudeDegrees")
       longnode = REXML::XPath.first(node,"Position/LongitudeDegrees")
       distancenode = REXML::XPath.first(node,"DistanceMeters")
       speednode = REXML::XPath.first(node,"Extensions/ns3:TPX/ns3:Speed")

       if (not currtimenode.nil?) and
          (not latinode.nil?) and
          (not longnode.nil?) and
          (not distancenode.nil?) and
          (not speednode.nil?)

          rundetail = RunDetail.new
          rundetail.currtime = currtimenode.text
          rundetail.lati = latinode.text.to_f
          rundetail.long = longnode.text.to_f
          rundetail.distance = distancenode.text.to_f
          rundetail.speed = speednode.text.to_f

          @rundetails << rundetail
       end
     end

  end
end
