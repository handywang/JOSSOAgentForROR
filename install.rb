puts 'The follow content is from README file, please read it clearly.'
puts IO.read(File.join(File.dirname(__FILE__), 'README'))