def fixture(name)
  File.open(File.join(SPEC_ROOT, 'spec', 'fixtures', "#{name}.html"))
end
