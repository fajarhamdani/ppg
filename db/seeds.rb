# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Start Delete current data'
Rule.delete_all
Desa.delete_all
Kelompok.delete_all
Person.delete_all
puts 'Finish delete data'

puts 'Start create rules'
roles = [{ name: 'super_admin'}, { name: 'daerah' }, { name: 'desa' }, { name: 'kelompok'}]
Role.create(roles)
puts 'Finish create rules'

user = User.create(email: 'admin@mailinator.com', password: '123456789')
user.roles << Role.find_by(name: 'super_admin')

puts 'Start Create data'
desas = { 1 => 'Karees Selatan', 2 => 'Karees Utara', 3 => 'Babakan Sari', 4 => 'Cicadas', 5 => 'Arcamanik'}
kelompoks = {
  1 => { 1 => 'Sekejati', 2 => 'Babakan Jati', 3 => 'Jatimulya', 4 => 'Talaga Bodas', 5 => 'Binong', 6 => 'Warung Jambu', 7 => 'Kawaluyaan' },
  2 => { 1 => 'Kebon Gedang', 2 => 'Maleer', 3 => 'Cibangkong', 4 => 'Anyer', 5 => 'Cikaso', 6 => 'Malabar' },
  3 => { 1 => 'Arum Sari 1', 2 => 'Arum Sari 2', 3 => 'Babakan Sumedang', 4 => 'Atlas' },
  4 => { 1 => 'Ampera', 2 => 'Wiranta', 3 => 'Padasuka', 4 => 'Cicaheum 1', 5 => 'Cicaheum 2' },
  5 => { 1 => 'Boling', 2 => 'MekarSari', 3 => 'Sarimas', 4 => 'Mandalajati', 5 => 'Jatiwangi', 6 => 'Indramayu' }
}
blood_types = ['O','A','B','AB']
place_of_births = ['Bandung','Garut','Sumedang','Jakarta', 'Bekasi', 'Bogor', 'Lamongan', 'Lampung']
date_of_births = []
(5..30).each do |i|
  date_of_births << i.years.ago
end

desas.each do |key, desa_name|
  desa = Desa.create(name: desa_name)

  kelompoks[key].values.each do |kelompok_name|
    kelompok = Kelompok.create(desa_id: desa.id, name: kelompok_name)

    100.times do |i|
      sex = ((i % 2) == 0) ? 1 : 0
      if sex == 1
        fullname = "Pria #{i}"
        nickname = "Pria#{i}"
      else
        fullname = "Wanita #{i}"
        nickname = "wanita#{i}"
      end

      Person.create(
        kelompok_id: kelompok.id, fullname: fullname, nickname: nickname, sex: sex,
        date_of_birth: date_of_births.sample, place_of_birth: place_of_births.sample,
        blood_type: blood_types.sample
      )
    end
  end
end
puts 'Finish Create Data'