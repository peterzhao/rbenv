# tools cookbook

This cookbook includes the following recipes to install some tools on linux machine (currenly only support centos):

### rbenv

By default, this recipe will install rbenv and ruby for user vagrant. You can override the following attribute to change the user:
   
        override['tools']['rbenv']['user']['name'] = 'vagrant'
        override['tools']['rbenv']['user']['home'] = '/home/vagrant'

By default, this cookbook will install ruby 2.1.2 and set it as shell version.

You can override the following attribute to set what versions of ruby to install

        override['tools']['rbenv']['versions'] = ['2.1.2']
        override['tools']['rbenv']['shell_version'] = '2.1.2'

### tmate

This recipe will install [tmate](http://tmate.io/) on the machine. A ssh key pair ~/.ssh/id_rsa 
and ~/.ssh/id_rsa.pub will be generated if they are not there. You can override the following attributes to change the user:

   
        override['tools']['tmate']['user']['name'] = 'vagrant'
        override['tools']['tmate']['user']['home'] = '/home/vagrant'

### mountebank

This recipe will install [mountebank](http://www.mbtest.org/)

## License

Copyright (c) <2015> <copyright Peter Zhao>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
