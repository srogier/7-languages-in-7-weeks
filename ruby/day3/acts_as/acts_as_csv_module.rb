module ActsAsCsv

  def self.included(base)
    base.extend ClassMethods
  end


  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  
  module InstanceMethods
    
    attr_accessor :headers, :csv_contents
    
    def read
      @csv_contents = []
    
      file = File.new(self.class.to_s.downcase + '.txt')
      @headers = file.gets.chomp.split(', ');
      
      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end
  
    def initialize 
      read
    end
  
  end

end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end


m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect


