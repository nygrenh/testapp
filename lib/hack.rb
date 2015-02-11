require 'byebug'

class Hack
  def self.run
    puts "++++++++++++++++++++++++++"

    keyh = {
      locale: [:en],
      formats: [:html],
      variants: [],
      handlers: [:raw, :erb, :builder, :ruby, :coffee, :jbuilder]
    }
    key = ActionView::LookupContext::DetailsKey.get(keyh)
    name = 'index'
    prefix = 'people'
    partial = false
    locals = []

    rrr = ActionView::OptimizedFileSystemResolver.new('/home/hnygren/Code/testapp/app/views')
    #rrr = ActionController::Base.view_paths

    view_path = "/home/hnygren/Code/testapp/app/views/people/index.html.erb"
    erb = ERB.new File.read view_path

    cache = rrr.instance_variable_get(:@cache)
    cache.cache(key, name, prefix, partial, locals) do
      aa = ActionView::Template.new(
        "<h1>Welcome to my cool website!</h1><p>plz follow me on twitter</p>",
        view_path,
        erb,
        virtual_path: "people/index", format: Mime::HTML,
        variant: nil, updated_at: Time.new)
        [aa]
    end
  end
end
