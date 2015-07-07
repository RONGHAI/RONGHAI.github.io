# encoding: utf-8

require 'pathname'
DIR = Pathname.new(__FILE__).parent 


module Tools
  require "fileutils"
  include FileUtils
  def replace(in_file, replacements)
    contents = IO.read(in_file)
    changed = false
    replacements.each do | key, value |
      if(contents.gsub!(key, value))
        changed = true;
      end
    end
    File.open(in_file, 'w') { | io | io.puts(contents) } 
    return changed
  end
  def copy_with_replace(from, to, replacements)
    FileUtils.mkdir_p File.dirname(to)
    copy(from, to) unless from == to
    replace(to, replacements)
  end
end

include Tools
require 'rubygems'

=begin
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
=end
require 'date'
require 'rake'
namespace :post do
    desc "create a new post"
    task :new, [:title, :categories] do |t, args| #don't include space `rake post:new["Title","Cats"]`
    file_file = Date.today.strftime("%F")<<"-"<<args[:title].downcase.chomp.gsub(/[\s]+/, '-').gsub(/[^-a-zA-Z0-9]/, '')<<".markdown"
    puts file_file
    copy_with_replace( "#{DIR}/_templates/post.markdown",  "#{DIR}/_posts/#{file_file}" ,  {
        "{{title}}" => args[:title],
        "{{date}}" => DateTime.now.strftime("%F %T"),
        "{{categories}}" => args[:categories].nil? ? "" : args[:categories]
      })
  end
end  

task :default => "post:new"
