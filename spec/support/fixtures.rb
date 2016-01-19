def fixture(name)
  File.read(File.join(defined?(SPEC_ROOT) ? SPEC_ROOT : Dir.pwd, 'spec', 'fixtures', "#{name}.html"))
end
