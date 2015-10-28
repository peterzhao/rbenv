This is light weight cookbook to install rbenv and ruby

By default, this cookbook will install rbenv and ruby for user vagrant. You can override the following attribute to change the user:
   
        override['rbenv']['user']['name'] = 'vagrant'
        override['rbenv']['user']['home'] = '/home/vagrant'

By default, this cookbook will install ruby 2.1.2 and set it as shell version.

You can override the following attribute to set what versions of ruby to install

        override['rbenv']['versions'] = ['2.1.2']
        override['rbenv']['shell_version'] = '2.1.2'
