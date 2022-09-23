if @vehicle.errors.present?
  json.message 'No Record Found.'
else
  json.partial! partial: 'api/vehicles/record', locals: {vehicle: @vehicle}
end
