module TeamsHelper

  def users_list(users)
    list = User.pluck(:first_name, :last_name, :email).map{ |name_array| "#{name_array.first} #{name_array.second} | #{name_array.last}" }
    users.each do |user|
      list.delete_if{ |name_string| name_string == "#{user.first_name} #{user.last_name} | #{user.email}" }
    end
    list
  end

end