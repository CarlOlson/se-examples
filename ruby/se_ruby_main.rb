
require "json"
require_relative "ruby_processor.rb"

loop do

  filename = gets.chomp

  begin
    if filename.empty?
      puts( { "error" =>
              "No file given." }.to_json )
    elsif File.exist? filename
      p = RubyProcessor.parse filename
      puts( { "spans" => p.spans }.to_json )
    else
      puts( { "error" =>
              "File `#{filename}' doesn't exist." }.to_json )
    end
  rescue Parser::SyntaxError => e
    rsn = e.diagnostic.reason
    msg = e.diagnostic.message
    loc = e.diagnostic.location
    puts( { "error" => e.message,
            "error-span" => [rsn, loc.begin_pos, loc.end_pos, {"message" => msg}]
          }.to_json )
  rescue => e
    if $DEBUG
      puts e.backtrace
    else
      puts( { "error" =>
              e.message }.to_json )
    end
  end
  
end
