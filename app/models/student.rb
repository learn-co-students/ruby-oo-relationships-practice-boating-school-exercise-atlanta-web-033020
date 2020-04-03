class Student
    attr_reader :first_name
    @@all = []

    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_boating_test(test_name, test_status, instructor)
        BoatingTest.new(self, test_name, test_status, instructor)
    end

    def self.find_student(first_name)
        self.all.find { |student| student.first_name == first_name }
    end

    def grade_percentage
        tests = BoatingTest.all.select { |test| test.student == self }
        test_statuses = tests.map { |test| test.test_status }
        test_statuses.count { |test_status| test_status == "passed" }.to_f / test_statuses.length * 100.0
    end
end
