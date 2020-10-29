class Person < ApplicationRecord
  enum sex: [:wanita, :pria]

  GENERUS_CATEGORIES = {
    caberawit: { batas_bawah: 5, batas_atas: 12 },
    praremaja: { batas_bawah: 13, batas_atas: 15 },
    remaja: { batas_bawah: 16, batas_atas: 18 },
    dewasa: { batas_bawah: 19, batas_atas: 30 }
  }.freeze

  belongs_to :kelompok

  validates_presence_of :fullname, :nickname, :date_of_birth, :sex, :kelompok

  default_scope { order(fullname: :asc) }

  scope :caberawits, -> { self.age_range(GENERUS_CATEGORIES[:caberawit]) }
  scope :praremajas, -> { self.age_range(GENERUS_CATEGORIES[:praremaja]) }
  scope :remajas, -> { self.age_range(GENERUS_CATEGORIES[:remaja]) }
  scope :dewasas, -> { self.age_range(GENERUS_CATEGORIES[:dewasa]) }

  GENERUS_CATEGORIES.keys.each do |category|
    define_method("#{category}?") {
      case category
      when :caberawit
        Person.caberawits.exists?(id: id)
      when :praremaja
        Person.praremajas.exists?(id: id)
      when :remaja
        Person.remajas.exists?(id: id)
      when :dewasa
        Person.dewasas.exists?(id: id)
      end
    }
  end

  def self.age_range(range)
    includes(kelompok: :desa).where(
      "date_of_birth BETWEEN ? AND ?",
      range[:batas_atas].years.ago.end_of_day,
      range[:batas_bawah].years.ago.beginning_of_day
    )
  end

  def birthday
    date_of_birth&.strftime('%d %B %Y')
  end

  # jangan terlalu sering dipanggil, karna load datanya banyak
  def status
    if caberawit?
      'caberawit'
    elsif praremaja?
      'praremaja'
    elsif remaja?
      'remaja'
    elsif dewasa?
      'dewasa'
    end
  end
end
