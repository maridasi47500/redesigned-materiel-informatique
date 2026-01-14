require "nokogiri"
require "open-uri"
h=Nokogiri::HTML(File.read("menu.html"))
h.css(".c-megaMenu__linkCat").each do |d|

if ["Cartouches et Toners", "High Tech", "Téléphonie et mobilité"].include?(d.text)
p "++++"+d.text+"===="

d.parent.children.css(".c-megaMenu__link").each do |j|
if !j.attributes["class"].value.include?("withChild") and j.text != d.text
p j.text
p ("https://www.bureau-vallee.gf"+j.attributes["href"].value)
@x=Nokogiri::HTML(URI.open(j.attributes["href"].value))
@x.css(".c-productCard__title").each do |product|
@y=Nokogiri::HTML(URI.open("https://www.bureau-vallee.gf"+product.attributes["href"].value))
p "==="
p "New Product"
p "Name : "+@y.css(".c-productMain__title").text
p "prix: "+@y.css(".c-price__price").text
p "pic link: "+@y.css("[data-nimg=1]")[0].attributes["src"].value
p "==="

end

end
end
end
end
