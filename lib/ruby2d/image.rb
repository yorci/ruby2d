# image.rb

module Ruby2D
  class Image
    
    attr_accessor :x, :y, :width, :height, :data
    attr_reader :path, :color
    
    def initialize(x, y, path)
      
      # TODO: Check if file exists
      #   `File.exists?` is not available in MRuby
      #   Ideally would do:
      #     unless File.exists? path
      #       raise Error, "Cannot find image file `#{path}`"
      #     end
      
      @type_id = 3
      @x, @y, @path = x, y, path
      @color = Color.new([1, 1, 1, 1])
      init(path)
      add
    end
    
    def color=(c)
      @color = Color.new(c)
    end
    
    def add
      if Module.const_defined? :DSL
        Application.add(self)
      end
    end
    
    def remove
      if Module.const_defined? :DSL
        Application.remove(self)
      end
    end
    
  end
end
