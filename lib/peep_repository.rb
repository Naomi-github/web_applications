require_relative 'peep'

class AlbumRepository
  def all
    peeps = []

    # Send the SQL query and get the result set.
    sql = 'SELECT id, peep, time_stamp, user_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])

    # The result set is an array of hashes.
    # Loop through it to create a model
    # object for each record hash.
    result_set.each do |record|

      # Create a new model object
      # with the record data.
      peep = Peep.new
      peep.id = record['id'].to_i
      peep.peep = record['peep']
      peep.time_stamp = record['time_stamp']
      peep.user_id = record['user_id'].to_i

      peeps << peep
    end

    return peeps
  end

  def find(id)
    sql = 'SELECT id, peep, time_stamp, user_id FROM peeps WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    peep = Peep.new
    peep.id = result_set[0]['id'].to_i
    peep.peep = result_set[0]['title']
    peep.time_stamp = result_set[0]['release_year']
    peep.user_id = result_set[0]['artist_id'].to_i

    return peep
  end

  def create(peep)
    sql = 'INSERT INTO peeps (peep, time_stamp, user_id) VALUES ($1, $2, $3);'
    result_set = DatabaseConnection.exec_params(sql, [peep.peep, peep.time_stamp, peep.user_id])

    return peep
  end

  def delete(id)
    sql = 'DELETE FROM peeps WHERE id = $1;';
    DatabaseConnection.exec_params(sql, [id]);
  end
end
