#coding: utf-8
#Fixes dates that were improeprly saved at midnight if you ran it before I fixed the bug

require 'rb-dayone'

s = DayOne::Search.new do
  tag.include "Mood"
  entry_text.exclude "Quick"
end

s.results.each do |entry|
  entry.creation_date += (21 * 60 * 60)
  entry.save!
end