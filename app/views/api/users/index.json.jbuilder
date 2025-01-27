json.users @users.each do |user| 

json.name user.name
json.username user.username
json.email_verified user.email_verified

json.category user.category

if user.user_avatar.present?
    json.user_avatar rails_blob_url(user.user_avatar)
end

json.message @message
json.success true

end