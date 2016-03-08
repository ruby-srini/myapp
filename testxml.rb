gem 'libxml-ruby', '>= 0.8.3'
require 'xml'
require 'pp'

# ##################################
# # Parsing Delicious API Response #
# ##################################
 xml = File.read('posts.xml')
# #puts Benchmark.measure {
#        parser, parser.string = XML::Parser.new, xml
#        doc, posts = parser.parse, []
#        doc.find('//posts/post').each do |p|
#          posts << p.attributes.inject({}) { |h, a| h[a.name] = a.value; h }
#        end
#         pp posts
#  #    }

doc = XML::Document.string(xml)
posts =[]
doc.find('//posts/post').each do |p|
          posts << p.attributes.inject({}) { |h, a| h[a.name] = a.value; h }
end

 posts.each do |n|
  puts n["tag"]
 end