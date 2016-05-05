class XmlDocument
  attr_accessor :indent, :level

  def initialize(indent = false, level = 0)
    @indent = indent
    @level = level
  end

  def method_missing(tag, *args, &prc)
    attrs = args.first || {}
    final = ""
    if block_given?
      final << "#{open_tag(tag, attrs)}"
      indent
      final << prc.call
      unindent
      final << "#{closing_tag(tag)}"
    else
      final << lone_tag(tag, attrs)
    end
  end

  def open_tag(tag_name, attrs)
    "#{tab}<#{tag_body(tag_name, attrs)}>#{newline}"
  end

  def lone_tag(tag_name, attrs)
    "#{tab}<#{tag_body(tag_name, attrs)}/>#{newline}"
  end

  def closing_tag(tag_name)
    "#{tab}</#{tag_name}>#{newline}"
  end

  def newline
    @indent ? "\n" : ""
  end

  def indent
    @level += 1 if @indent
  end

  def tab
    "  " * @level
  end

  def unindent
    @level -= 1 if @indent
  end

  def tag_string(attrs)
    attrs.map { |key, value| "#{key}=\"#{value}\"" }
  end

  def tag_body(tag_name, attrs)
    ([tag_name] + tag_string(attrs)).join(" ")
  end
end
