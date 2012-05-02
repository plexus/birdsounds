class Birdname <  Struct.new(:english, :latin)
  class << self
    def all
      load
    end

    private
  
    def load
      @all ||= IO.read(Rails.root.join('latin_names')).split("\n").map {|l| l.split("\t")}.map {|e,l| self.new(e,l)}
    end
  end
end
