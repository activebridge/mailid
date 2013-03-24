module Mailid
  class Engine < ::Rails::Engine
    #isolate_namespace Mailid

    initializer "mailid.models.messagable" do
      ActiveSupport.on_load(:mongoid) do
        #include Mailid::Models::Messagable
        self.send(:include, Mailid::Models::Messagable)
      end
    end
  end
end
