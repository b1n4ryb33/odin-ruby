require_relative "event_manager/version"
require "csv"
require 'google/apis/civicinfo_v2'
require 'erb'

# module EventManager

  class Error < StandardError; end
  
  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, '0')[0..4]
  end

  def clean_phone_number(number)
      
    digits = number.gsub(/[\D]/, "") 
    
    return digits[1..10] if digits.length == 1 && digits[0] == "1"

    return "0000000000" if digits.length < 10 || digits.length > 10

    digits

  end

  def legislators_by_zipcode(zip)

    civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
    civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

    begin 
      legislators = civic_info.representative_info_by_address(
        address: zip,
        levels: 'country',
        roles: ['legislatorUpperBody', 'legislatorLowerBody']
      ).officials
    
    rescue
      'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
    end

  end

  def save_thank_you_letter(id,form_letter)
    Dir.mkdir('output') unless Dir.exists?('output')
  
    filename = "output/thanks_#{id}.html"
  
    File.open(filename, 'w') do |file|
      file.puts form_letter
    end
  end

  contents = CSV.open(
    'resources/event_attendees_full.csv',
     headers: true,
     header_converters: :symbol
  )

  template_letter = File.read('resources/form_letter.erb')
  erb_template = ERB.new template_letter

  contents.each do |row|
    id = row[0]
    name = row[:first_name]
  
    zipcode = clean_zipcode(row[:zipcode])

    phone_number = clean_phone_number(row[:homephone])

    legislators = legislators_by_zipcode(zipcode)
  
    form_letter = erb_template.result(binding)
    
    save_thank_you_letter(id,form_letter)
  end

