json.vehicles do |json|
  json.array! vehicles do |vehicle|
    json.id vehicle.id
    json.city vehicle.city
    json.model vehicle.model
    json.price vehicle.price
    json.milage vehicle.milage
    json.engine_capacity vehicle.engine_capacity
    json.color vehicle.color
    json.transmission vehicle.transmission
    json.engine_type vehicle.engine_type
    json.assembly_type vehicle.assembly_type
    json.primary_contact vehicle.primary_contact
    json.secondary_contact vehicle.secondary_contact
    json.currency vehicle.currency
    json.user_id vehicle.user_id
    json.created_at vehicle.created_at
    json.updated_at vehicle.updated_at
    json.pictures vehicle.pictures
  end
end
json.total_count vehicles.size
