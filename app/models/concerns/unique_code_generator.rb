module UniqueCodeGenerator
  extend ActiveSupport::Concern
  
  CODE_RANGE = (1000..9999)

  included do
    before_create :set_unique_code

    scope :with_code, ->(code) { where(code: code) }
  end

  def set_unique_code
    return if self.code.present?
    self.code = generate_unique_code
  end

  private

  def generate_unique_code
    loop do
      code = Random.rand(CODE_RANGE)
      break code unless self.class.exists?(code: code)
    end
 end
end
