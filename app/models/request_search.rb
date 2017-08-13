class RequestSearch
  attr_reader :date_from, :date_to

  # use keyword args instead
  def initialize(date_from: nil, date_to: nil, **kwargs)
    # You need to use `@` to set instance vars
    @date_from = parsed_date(date_from)
    @date_to = parsed_date(date_to)
  end

  def scope
    Request.where(date: date_from..date_to)
  end

  # reduce the arity by setting the default in the method
  # definition
  def parsed_date(date_string, default = Date.today.to_s)
    Date.parse(date_string)
  rescue ArgumentError, TypeError
    default
  end
end
