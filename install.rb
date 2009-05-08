# Install hook code here
puts "Copying files..."
FileUtils.cp_r(File.join(File.dirname(__FILE__), "javascript/jquery.clipboard.min.js"), File.join(RAILS_ROOT, "public/javascripts"))
FileUtils.cp_r(File.join(File.dirname(__FILE__), "swf/jquery.clipboard.swf"), File.join(RAILS_ROOT, "public"))
puts "Files copied - Installation complete!"
