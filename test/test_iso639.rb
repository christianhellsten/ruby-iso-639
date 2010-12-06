require 'helper'
require 'open-uri'
require 'fastercsv'

class TestISO639 < Test::Unit::TestCase
  should "fetch and parse ISO-639 from loc.gov" do
    codes = ISO639.codes
    assert_equal codes.size, 485

    afar = codes.first
    zaza = codes.last
    assert_equal(afar, { "639-1"=>"aa",
                         "639-2-terminilogy"=>nil,
                         "english"=>"Afar",
                         "french"=>"afar",
                         "639-2-bibliographic"=>"\357\273\277aar" })
    assert_equal(zaza, { "639-1"=>nil,
                         "639-2-terminilogy"=>nil,
                         "english"=>"Zaza; Dimili; Dimli; Kirdki; Kirmanjki; Zazaki",
                         "french"=>"zaza; dimili; dimli; kirdki; kirmanjki; zazaki",
                         "639-2-bibliographic"=>"zza" })
  end
end
