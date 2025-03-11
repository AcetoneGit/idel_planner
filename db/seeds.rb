# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "cleaning database"

User.destroy_all
Patient.destroy_all

group_1 = Group.create!

puts "creating user"
User.create!(first_name: "Léo", last_name: "Martin",  email: "leo@gmail.com", password: "password", group: group_1)
User.create!(first_name: "Clara", last_name: "Dupont",  email: "clara@gmail.com", password: "password", group: group_1)
User.create!(first_name: "Hugo", last_name: "Lefevre",  email: "hugo@gmail.com", password: "password", group: group_1)


puts "creating patient"
Patient.create!(first_name: "Sophie", last_name:"Moreau", address: "5 Rue Centrale 69210 L'Arbresle", date_of_birth: "15/02/1983", social_security_number: "2 69 00 00 000 000 00", mutual: "Harmonie Mutuelle",referring_doctor:"Dr. Lucie Bernard", group: group_1)
Patient.create!(first_name: "Alexandre", last_name:"Petit", address: "12 Avenue du Général de Gaulle 69160 Tassin-la-Demi-Lune", date_of_birth: "27/06/1965", social_security_number: "1 69 00 00 000 000 00", mutual: "MGEN",referring_doctor:"Dr. Pierre Lemoine", group: group_1)
Patient.create!(first_name: "Marion", last_name:"Gauthier", address: "31 Avenue du Chater 69340 Francheville", date_of_birth: "03/11/1979", social_security_number: "2 69 00 00 000 000 00", mutual: "MAIF",referring_doctor:"Dr. Sophie Durand", group: group_1)
Patient.create!(first_name: "Thomas", last_name:"Mercier", address: "8 Rue de la Mairie 69670 Vaugneray", date_of_birth: "09/04/1950", social_security_number: "1 69 00 00 000 000 00", mutual: "MACIF",referring_doctor:"Dr. Antoine Lefevre", group: group_1)
Patient.create!(first_name: "Isabelle", last_name:"Leclerc", address: "1 Route de Lentilly 69890 La Tour-de-Salvagny", date_of_birth: "22/12/1973", social_security_number: "2 69 00 00 000 000 00", mutual: "Mutuelle Générale",referring_doctor:"Dr. Claire Moreau", group: group_1)
Patient.create!(first_name: "François", last_name:"Girard", address: "14 Rue des Aqueducs 69126 Brindas", date_of_birth: "17/08/1960", social_security_number: "1 69 00 00 000 000 00", mutual: "AG2R",referring_doctor:"Dr. Thomas Gauthier", group: group_1)
Patient.create!(first_name: "Lea", last_name:"Blanchet", address: "21 Avenue Maréchal Foch 69630 Chaponost", date_of_birth: "10/07/1945", social_security_number: "2 69 00 00 000 000 00", mutual: "Apivia Mutuelle",referring_doctor:"Dr. Emilie Dufresne", group: group_1)
Patient.create!(first_name: "Vincent", last_name:"Dubois", address: "41 Route de Lyon 69530 Brignais", date_of_birth: "05/02/1958", social_security_number: "1 69 00 00 000 000 00", mutual: "La Mutuelle Familiale",referring_doctor:"Dr. Marc Lefevre", group: group_1)
Patient.create!(first_name: "Melanie", last_name:"Roussel", address: "200 Avenue du Casino 69890 La Tour-de-Salvagny", date_of_birth: "14/11/1967", social_security_number: "2 69 00 00 000 000 00", mutual: "MNT",referring_doctor:"Dr. Isabelle Charrier", group: group_1)
Patient.create!(first_name: "Pierre", last_name:"Chaize", address: "23 Avenue Charles de Gaulle 69160 Tassin-la-Demi-Lune", date_of_birth: "28/01/1951", social_security_number: "1 69 00 00 000 000 00", mutual: "Mutuelle Bleue",referring_doctor:"Dr. Hugo Roussel", group: group_1)
Patient.create!(first_name: "Laura", last_name:"Simon", address: "9 Place Abbé Larue 69370 Saint-Didier-au-Mont-d'Or", date_of_birth: "02/03/1978", social_security_number: "2 69 00 00 000 000 00", mutual: "April",referring_doctor:"Dr. Marion Simon", group: group_1)
Patient.create!(first_name: "Paul", last_name:"Charrier", address: "3 Impasse du Château 69210 Lentilly", date_of_birth: "15/07/1953", social_security_number: "1 69 00 00 000 000 00", mutual: "AESIO",referring_doctor:"Dr. François Vasseur", group: group_1)
Patient.create!(first_name: "Charlotte", last_name:"Picard", address: "35 Avenue Edouard Millaud 69290 Craponne", date_of_birth: "26/10/1961", social_security_number: "2 69 00 00 000 000 00", mutual: "MAIF",referring_doctor:"Dr. Charlotte Dupont", group: group_1)
Patient.create!(first_name: "Samuel", last_name:"Roche", address: "8 Chemin du Moulin 69380 Marcilly-d'Azergues", date_of_birth: "11/05/1958", social_security_number: "1 69 00 00 000 000 00", mutual: "MACIF",referring_doctor:"Dr. Jérôme Tanguy", group: group_1)
Patient.create!(first_name: "Amélie", last_name:"Fontaine", address: "3 Route de Sain-Bel 69280 Marcy-l'Étoile", date_of_birth: "03/09/1969", social_security_number: "2 69 00 00 000 000 00", mutual: "MGEN",referring_doctor:"Dr. Caroline Robert", group: group_1)
Patient.create!(first_name: "Nicolas", last_name:"Dufresne", address: "1615 Route de la Tour 69890 La Tour-de-Salvagny", date_of_birth: "22/12/1949", social_security_number: "1 69 00 00 000 000 00", mutual: "AG2R",referring_doctor:"Dr. Julien Favier", group: group_1)
Patient.create!(first_name: "Camille", last_name:"Lemoine", address: "7 Rue de Lyon 69640 Ville-sur-Jarnioux", date_of_birth: "07/04/1980", social_security_number: "2 69 00 00 000 000 00", mutual: "Apivia",referring_doctor:"Dr. Catherine Faure", group: group_1)
Patient.create!(first_name: "Benoit", last_name:"Gagnon", address: "7 Avenue Lamartine 69260 Charbonnières-les-Bains", date_of_birth: "19/06/1955", social_security_number: "1 69 00 00 000 000 00", mutual: "Mutuelle Bleue",referring_doctor:"Dr. Maxime Lefevre", group: group_1)
Patient.create!(first_name: "Claire", last_name:"Tanguy", address: "25 Route de Bordeaux 69570 Dardilly", date_of_birth: "30/01/1972", social_security_number: "2 69 00 00 000 000 00", mutual: "AESIO",referring_doctor:"Dr. Alice Mercier", group: group_1)
Patient.create!(first_name: "Jérome", last_name:"Pires", address: "26 Route de Lyon 69280 Sainte-Consorce", date_of_birth: "24/11/1964", social_security_number: "1 69 00 00 000 000 00", mutual: "MGEN",referring_doctor:"Dr. David Girard", group: group_1)

puts "finsished"

puts "Ceci est un test"
