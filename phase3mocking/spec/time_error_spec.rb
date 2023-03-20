require 'time_error'

describe TimeError do
  it "returns the time difference between server and local computer" do
    requester_double = double :requester
    allow(requester_double).to receive(:get).with(
      URI("https://worldtimeapi.org/api/ip")
    ).and_return('{"abbreviation":"GMT","client_ip":"51.187.249.88","datetime":"2023-03-20T10:39:14.361160+00:00","day_of_week":1,"day_of_year":79,"dst":false,"dst_from":null,"dst_offset":0,"dst_until":null,"raw_offset":0,"timezone":"Europe/London","unixtime":1679308754,"utc_datetime":"2023-03-20T10:39:14.361160+00:00","utc_offset":"+00:00","week_number":12}')
    local = TimeError.new(requester_double)
    fake_time = Time.new(2023, 03, 20, 10, 39, 15)
    expect(local.error(fake_time)).to eq -0.63884
  end
end


