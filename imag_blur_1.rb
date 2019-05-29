class Image
    def initialize(image)
        @image = image
    end
    
    # convert to a multi line string
    def to_s
        @image.map {|row|
            row.join('')
        }.join("\n")
    end
    
    # use the standard to_s and print to console
    def output_image
        puts self.to_s
    end
end

