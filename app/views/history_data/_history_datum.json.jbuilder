json.extract! history_datum, :id, :iteration_data, :result_data, :created_at, :updated_at
json.url history_datum_url(history_datum, format: :json)