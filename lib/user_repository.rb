require_relative 'user'

class UserRepository
  def all
    users = []

    # Send the SQL query and get the result set.
    sql = 'SELECT id, first_name, last_name, email FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    # The result set is an array of hashes.
    # Loop through it to create a model
    # object for each record hash.
    result_set.each do |record|

      # Create a new model object
      # with the record data.
      user = User.new
      user.id = record['id'].to_i
      user.first_name = record['first_name']
      user.last_name = record['last_name']
      user.email = record['email']

      users << user
    end

    return users
  end

  def find(id)
    sql = 'SELECT id, first_name, last_name, email FROM users WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    user = User.new
    user.id = result_set[0]['id'].to_i
    user.name = result_set[0]['first_name']
    user.last_name = result_set[0]['last_name']
    user.email = result_set[0]['email']

    return user
  end

  def create(user)
    sql = 'INSERT INTO users (first_name, last_name, email) VALUES ($1, $2, $3);'
    result_set = DatabaseConnection.exec_params(sql, [user.first_name, user.last_name, user.email])

    return user
  end
end
