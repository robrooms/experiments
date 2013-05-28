#!/usr/bin/env ruby
require 'gmail'
require 'mail'
require 'colorize'

username="mail"
password="password"

gmail = Gmail.new(username, password)

new_emails = gmail.inbox.emails(:unread)
puts "You have " + "#{new_emails.length}".colorize( :red ) + " new emails!"
puts "\n"

new_emails.reverse_each do |email|
        email_from = email.from[0].name
        puts "From: ".colorize( :blue ) + "#{email_from}" 
        email_subject = Mail::Encodings.value_decode(email.subject)
        puts "Subject: ".colorize( :green ) + "#{email_subject.tr("\n","").gsub(/\s+/, " ").strip}"
        puts "\n"
        end

gmail.logout