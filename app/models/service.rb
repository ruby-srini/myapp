class Service < ActiveRecord::Base
	self.inheritance_column = nil
	attr_accessor :TYPES, :LOCATIONS, :EMAIL_VISIBILITY, :PUBLISH_TO, :OWNERSHIP

	before_validation :remove_white_spaces , :only => [:name, :phone, :fax, :location, :website,:email,:keywords]
	validates :type, presence: true, :inclusion => { in:  TYPES, message:"-- choose a Type from the drop down list." }
	validates :location, presence: true, :inclusion => { in:  LOCATIONS, message:"-- choose a Location from the drop down list." }
    validates_presence_of :name, :phone,:email
     validates_uniqueness_of :phone, :name
    
    validates_presence_of :location ,unless: ->(service){service.website.present?}
    validates_presence_of :website ,unless: ->(service){service.location.present?}
     validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    validates_format_of :website, :with => /\A^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$\Z/ix
    

def remove_white_spaces
  # trim whitespace from beginning and end of string attributes
  attribute_names.each do |name|
    if send(name).respond_to?(:strip)
      send("#{name}=", send(name).strip)
    end
  end
end



  #validates :location_xor_website
# def location_xor_website
# 	unless location.blank? ^ website.blank?
# 		errors.add(:base, "Please add value in location or website")
# 	end
# end
end
