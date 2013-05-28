#!/usr/bin/ruby
require 'gmail'
require 'mail'


username="email"
password="password" 


gmail = Gmail.new(username, password)



new_emails = gmail.inbox.emails(:unread)
puts "You have #{new_emails.length} new emails."
puts "\n"


new_emails.each do |email|
        email_from = email.from[0].name
        puts "From: #{email_from}" 
        email_subject = Mail::Encodings.value_decode(email.subject)
        puts "Subject: #{email_subject.tr("\n","").gsub(/\s+/, " ").strip}"
        puts "\n"
        end

gmail.logout  

