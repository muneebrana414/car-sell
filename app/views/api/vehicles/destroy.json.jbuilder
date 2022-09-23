if @deleted_vehicle 
  json.message 'Successfully Deleted.'
else
  json.message 'Not deleted'
end