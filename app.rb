require 'nokogiri'
require 'open-uri'
require 'csv'

url = 'https://www.post.japanpost.jp/cgi-zip/zipcode.php?pref=8&city=1082350&addr=&cmp=1&mode=list'

html = open(url).read
doc = Nokogiri::HTML.parse(html)

doc_csv = []
doc_csv << ['郵便番号']

doc.css("div.zip").each do |zip_code|
  doc_csv << [
    zip_code.text.gsub('〒','')
  ]
end

File.open('upload.csv', 'w') do |file|
  file.print("\uFEFF")
  doc_csv.each do |row|
    file.puts(row.to_csv)
  end
end
