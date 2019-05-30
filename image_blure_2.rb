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

    def blur
        # copy the original to avoid interacting with
        # pixels we set to '1' during the blure process
        tmp = @image.map {|row|
            row.map {|val|
                val
            }
        }
        
        tmp.each_index{|y|
            tmp[y].each_index {|x|
                # look for '1' in the original
                if tmp[y][x] == 1
                    [-1, 0, 1].each {|dy|
                        # avoid going outside the canvas
                        if y + dy >= 0 && y + dy < tmp.length
                            [-1, 0, 1].each {|dx|
                                # avoid going outside the canvas, and only move if
                                # dx or dy are 0 (avoid moving diagonally)
                                if dx*dy == 0 && x + dx >= 0 && x + dx < tmp[y].length
                                    @image[y + dy][x + dx] = 1
                                end
                            }
                        end
                    }
                end
            }
        }
    end
end

