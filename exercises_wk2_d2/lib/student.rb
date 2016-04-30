class Student
  attr_accessor(:first_name, :last_name)
  def initialize(first, last)
    @first_name = first
    @last_name  = last
    @courses = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def courses
    @courses
  end

  def enroll(course)
    @courses << course if !self.courses.include?(course)
    course.students << self
  end

  def course_load
    hash = Hash.new(0)
    @courses.each do |course|
      hash[course.department] += course.credits
    end
    hash
  end
end
