# Thanks you http://recursive-design.com/blog/2010/10/12/static-blogging-the-jekyll-way/

namespace :jekyll do

  desc 'Say hello'
  task :hello do
    puts "Hello from the Rakefile"
  end
  

  desc 'Delete generated _site files'
  task :clean do
    system "rm -rf _site"
  end
  
  desc 'Run the jekyll dev server'
  task :server do
    system "jekyll --server --auto"
  end
  
  desc 'Clean temporary files and run the server'
  task :compile => [:clean, 'compass:clean', 'compass:compile'] do
    system "jekyll"
  end

end

namespace :compass do  

  desc 'Delete temporary compass files'
  task :clean do
    system "rm -rf css/*"
  end

end

namespace :pygments do  

  desc 'Delete pygments CSS files'
  task :clean do
    system "rm -f _sass/3rd_party/pygments/*.scss"
  end

  desc 'Generate pygments CSS'
  task :compile => [:clean] do
    system "mkdir -p _sass/3rd_party/pygments"
    system "pygmentize -S default -f html > _sass/3rd_party/pygments/default.scss"
  end

end

namespace :dev do

  desc 'Un-publish old posts to speed up development'
  task :on => ['jekyll:clean'] do
    system 'find . -name "*.textile" -exec sed -i "" "s|published: true|published: true|g" {} \;'
    system 'find . -name "*.yml" -exec sed -i "" "s|published: true|published: true|g" {} \;'
  end

  desc 'Re-publish old posts for deployment'
  task :off => ['jekyll:clean'] do
    system 'find . -name "*.textile" -exec sed -i "" "s|published: true|published: true|g" {} \;'
    system 'find . -name "*.yml" -exec sed -i "" "s|published: true|published: true|g" {} \;'
  end
  
end