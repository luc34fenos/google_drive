def make_csv(text)
	CSV.open("db/files.csv", "a+") do |csv|
        csv << text.keys
        csv << text.values
	end
end