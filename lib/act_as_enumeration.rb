module ActAsEnumeration
  def act_as_enumeration(options)
    (class << self; self; end).instance_eval do
      options.each do |name, value|
        name = name.to_s
        define_method(name) { value }
      end
    end
  end
end
