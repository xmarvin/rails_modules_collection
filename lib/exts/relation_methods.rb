class ActiveRecord::Relation
  def random
    self.offset(rand(self.count)).first if self.count > 0
  end

  def sequence_order
    #self.order("#{table_name}.created_at ASC")
    self.order("#{table_name}.id ASC")
  end

  def get_by_offset(n)
    offset = n.to_i - 1
    self.offset(offset).first if offset >=0
  end

end

class ActiveRecord::Base

  def type_with_id
    "#{self.class.name}_#{id}"
  end

end
