# vim: ft=ruby

guard :shell do
  watch(%r{^.*\.tex}) do |m|
    %x[make lualatex]
    puts Time.now
  end
end
