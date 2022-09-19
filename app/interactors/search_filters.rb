class SearchFilters < ApplicationInteractor
  delegate :searching_filters, :page, to: :context
  delegate :vehicles, :flash, to: :context

  def call
    @record = PgSearch.multisearch(searching_filters)
    if searching_filters.any?
      if @record.any?
        @ids = Array.new
        @record.each do |el|
          @ids.push(el.searchable_id)
        end
        context.flash = false
        context.vehicles = Vehicle.where(id: @ids).page(page)
      else
        context.flash = true
        context.vehicles = Vehicle.where(primary_contact: "").page(page)
      end
    else
      context.vehicles = Vehicle.where.not(primary_contact: "").page(page)
    end
  end

end
