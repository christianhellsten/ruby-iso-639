require 'open-uri'
require 'fastercsv'

class ISO639
  def self.codes
    codes = []
    open('http://loc.gov/standards/iso639-2/ISO-639-2_utf-8.txt') do |f|
      f.each_line do |line|
        FasterCSV.parse(line, :col_sep => "|") do |row|
          code = {
            '639-2-bibliographic' => row[0],
            '639-2-terminilogy' => row[1],
            '639-1' => row[2],
            'english' => row[3],
            'french' => row[4]
          }
          codes << code
        end
      end
    end
    codes
  end
end
