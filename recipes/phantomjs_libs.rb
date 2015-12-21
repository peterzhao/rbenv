# install packages requried by phantomjs. Phantomjs will be automatically installed by jasmine:ci rake task
['freetype', 'fontconfig'].each do |package_name|
  package package_name
end
