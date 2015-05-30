class Role
  attr_accessor :id

  ROLES = {1 => :admin, 2 => :volunteer, 3 => :contributor, 4 => :guest, 5 => :anon}

  ROLES.each do |id, name|
    class_eval <<-"end_eval", __FILE__, __LINE__
      def #{name}?
        self.id == #{id}
      end

      def self.#{name}_id
        #{id}
      end
    end_eval
  end

  def initialize(role)
    if role.is_a?(Integer)
      @id = role
    else
      @id = ROLES.select {|id, name| name == role}.keys.first
    end
  end

  def name
    ROLES[self.id]
  end

end
