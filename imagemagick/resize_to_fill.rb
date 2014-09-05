require 'rubygems'
require 'rmagick'

src    = 'src'
dest   = 'dest'
width  = 200
height = 200


src_dir    = File.join(src, '*')
dest_dir   = File.join(dest)
src_images = Dir[src_dir]

src_images.each { |file|
  image = Magick::Image.read(file).first
  image.resize_to_fill!(width, height)
  output_filename = File.join(dest_dir, File.basename(file))
  image.write(output_filename)
}
