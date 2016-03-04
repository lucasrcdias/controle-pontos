module FFaker
  module CpfCnpj
    extend ModuleUtils
    extend self

    CNPJ  = %w(32185913840882 19876842311569 36341596801060 17382099757571 51372461508936)

    def cpf
      numbers = 9.times.map { rand(9) }
      numbers << generate_cpf_digit(numbers)
      numbers << generate_cpf_digit(numbers)
      numbers.join
    end

    def cnpj
      CNPJ.sample
    end

    private

    def generate_cpf_digit(numbers)
      multiplied = numbers.map.each_with_index do |number, index|
        number * ((numbers.size + 1) - index)
      end

      mod = multiplied.reduce(:+) % 11
      mod < 2 ? 0 : 11 - mod
    end
  end
end
