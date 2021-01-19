class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    @boss.employees << self unless @boss.nil?
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end



class Managere < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = []
  end

  def bonus(multiplier)
    sub_salary = 0
    queue = employees.dup
    until queue.empty?
      employee = queue.shift
      sub_salary += employee.salary

      queue += employee.employees if employee.is_a?(Managere)
    end

    sub_salary * multiplier
  end
end