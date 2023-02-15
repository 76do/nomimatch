class RequestSerializer
  include FastJsonapi::ObjectSerializer
  attributes :sender_name, :shop_url, :atmosphere, :message 

  attribute :dismissal_time do |object|
    object.dismissal_time_before_type_cast
  end
  
  attribute :number_of_people do |object|
    object.number_of_people_before_type_cast
  end

  attribute :budget do |object|
    object.budget_before_type_cast
  end

  attribute :created_at do |object|
    I18n.l object.created_at
  end
end
