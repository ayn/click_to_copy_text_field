# Install hook code here
puts "Copying files..."
["javascript/jquery.clipboard.pack.js", "jquery.clipboard.swf"].each do |f|
  dest_file = File.join(RAILS_ROOT, "public", f)
  src_file = File.join(File.dirname(__FILE__) , f)
  FileUtils.cp_r(src_file, dest_file)
end
puts "Files copied - Installation complete!"
