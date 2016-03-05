class Service < ActiveRecord::Base
 searchkick
 # require 'uri'
  self.inheritance_column = nil  #type field will be allowed
  attr_accessor :TYPES, :LOCATIONS, :EMAIL_VISIBILITY, :PUBLISH_TO, :OWNERSHIP # constant arrays

  before_validation :remove_white_spaces  , :only => [:name, :phone, :fax, :location, :website,:email,:keywords]

  validates :type, presence: true, :inclusion => { in:  TYPES, message:"-- choose a Type from the drop down list." }
  validates :location, presence: true, :inclusion => { in:  LOCATIONS, message:"-- choose a Location from the drop down list." }
  validates_presence_of :name, :phone,:email
  validates_uniqueness_of :phone, :name
  #validates  :name, uniqueness: {scope: :department, message: "Should be unique per department"}
  validates_presence_of :location ,unless: ->(service){service.website.present?}
  validates_presence_of :website ,unless: ->(service){service.location.present?}
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_format_of :website, with:  /\A^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$\Z/ix

  validates :name, length: { in: 6..50 }
  validates_numericality_of :phone
  validates :phone, length: { in: 7..15, wrong_length: "Phone length between 7-15" }
  #validates_plausible_phone :phone, country_code: 'US'
  #validates_format_of :phone, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/

  def remove_white_spaces()
    # trim whitespace from beginning and end of string attributes
    attribute_names.each do |name|
      if send(name).respond_to?(:squish)
        send("#{name}=", send(name).squish)
      end
    end
  end

  def name=(s)
    write_attribute(:name, s.to_s.titleize.squish)
  end

  def email=(s)
    write_attribute(:email, s.to_s.downcase.squish)
  end

  def website=(s)
    write_attribute(:website, s.to_s.downcase.squish)
  end
  #validates :location_xor_website
  # def location_xor_website
  # 	unless location.blank? ^ website.blank?
  # 		errors.add(:base, "Please add value in location or website")
  # 	end
  # end
end
