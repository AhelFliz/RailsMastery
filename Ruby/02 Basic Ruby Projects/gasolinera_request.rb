require 'net/http'
require 'json'
require 'uri'

url = URI("https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/")

response = Net::HTTP.get(url)

begin
  data = JSON.parse(response)
  puts "Total gasolineras encontradas: #{data['ListaEESSPrecio'].size}"
  data['ListaEESSPrecio'].each do |gas_station|
    puts "Gasolinera: #{gas_station['Rótulo']}"
    puts "Dirección: #{gas_station['Dirección']}"
    puts "Precio Gasolina 95: #{gas_station['Precio Gasolina 95 E5']}"
    puts "Precio Gasolina 98: #{gas_station['Precio Gasolina 98 E5']}"
    puts "Precio Gasoil: #{gas_station['Precio Gasóleo A']}"
    puts "-" * 50
  end
rescue JSON::ParserError => e
  puts "Error al parsear el JSON: #{e.message}"
end
