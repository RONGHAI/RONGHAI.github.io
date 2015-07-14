=begin
class Hash
  def method_missing(method, *opts)
    m = method.to_s
    if self.has_key?(m)
      return self[m]
    elsif self.has_key?(m.to_sym)
      return self[m.to_sym]
    end
    super
  end
end
=end
module Jekyll
  class InternationalizationTag < Liquid::Tag
    

    def initialize(tag_name, arg, tokens)
      super
      options = arg.split
      @text = options[0]
    end
    def render(context)
      self.class._localize(@text, context, nil)
    end
    def self._localize(input, context , locale = nil)
      site = context.registers[:site]
      #puts site.data.class
      locales = site.data["locales"]
      locale = locale || site.config["default_locale"] || 'en'
      data = input;    
      data = locales[locale][data] if locales[locale] && locales[locale][data]
      "#{data}"
    end

  end
  module InternationalizationFilter
    def localize(input, locale = nil)
      InternationalizationTag._localize(input, @context, locale)
    end
  end
end
Liquid::Template.register_tag('i18n', Jekyll::InternationalizationTag)
Liquid::Template.register_filter(Jekyll::InternationalizationFilter)
