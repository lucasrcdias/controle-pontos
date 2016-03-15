class UniqueCodeGenerator
  CODE_RANGE = (1000..9999)

  def self.generate_code(object_class)
    @object_class = object_class
    sort_code_and_find_object

    while(@object.present?)
      sort_code_and_find_object
    end

    return @generated_code
  end

  private

  def self.sort_code_and_find_object
    @generated_code = Random.rand(CODE_RANGE)
    @object         = @object_class.with_code(@generated_code)
  end
end
