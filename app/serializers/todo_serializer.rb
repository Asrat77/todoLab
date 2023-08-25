class TodoSerializer < ActiveModel::Serializer
  attributes :id, :title, :status, :date
end
