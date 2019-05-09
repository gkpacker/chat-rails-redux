class MessageSerializer < ActiveModel::Serializer
  attributes :id, :author, :content, :created_at

  def author
    object.user.email
  end
end
