module ApplicationHelper
  def flash_class(type)
    case type.to_sym
    when :notice
      "bg-green-500 text-white px-4 py-4 rounded m-2"
    when :alert
      "bg-red-500 text-white px-4 py-4 rounded m-2"
    else
      "bg-blue-500 text-white px-4 py-4 rounded m-2"
    end
  end
end
