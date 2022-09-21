if @vehicle.errors.present?
  json.message 'Not Saved.'
else
  json.partial! partial: 'api/vehicles/record', locals: {vehicle: @vehicle}
end
