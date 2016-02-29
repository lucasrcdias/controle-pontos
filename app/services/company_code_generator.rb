class CompanyCodeGenerator
  CODE_RANGE = (1000..9999)

  def self.generate_code
    sort_code_and_find_company

    while(@company.present?)
      sort_code_and_find_company
    end

    return @generated_code
  end

  private

  def self.sort_code_and_find_company
    @generated_code = Random.rand(CODE_RANGE)
    @company        = Company.with_code(@generated_code)
  end
end
