module ServicesHelper
 def show_non_blank_field(label, value)

   content_tag( :p,"#{label}: #{value}") if !value.blank?
end
end
