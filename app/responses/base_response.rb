class BaseResponse
  def self.success(message: "Success", payload: nil)
    {
      status: true,
      message: message,
      payload: payload
    }
  end

  def self.error(message: "Failed", payload: nil)
    {
      status: false,
      message: message,
      payload: payload
    }
  end
end
