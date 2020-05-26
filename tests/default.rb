if os.windows?
  service_name = "Habitat"
else
  service_name = "hab-sup"
end
describe service(service_name) do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

  describe port(8080) do
    it { should be_listening }
  end