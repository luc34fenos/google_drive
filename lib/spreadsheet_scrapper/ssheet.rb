def ssheet(jason)
	session = GoogleDrive::Session.from_config("config.JSON")

	ws = session.spreadsheet_by_title("emailTHP")
	worksheet = ws.worksheets.first
	
	text = jason

	#jso = File.read(jason)
	#text = JSON.parse(jso)

	for i in (0..(text.length-1))
		worksheet[i+1, 1] = text.keys[i]

		worksheet[i+1, 2] = text.values[i]
	end
	worksheet.save
end