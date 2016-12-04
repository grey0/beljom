class Review
  include Mongoid::Document
  field :user_name, type: String
  field :content, type: String

  embedded_in :products, inverse_of: :reviews
end
