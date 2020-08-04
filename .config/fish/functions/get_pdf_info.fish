# Defined in /tmp/fish.6kTakU/get_pdf_info.fish @ line 1
function get_pdf_info
	for file in (find ./ -type f -iname "*pdf")
	   echo "File: $file" >> pdf_info.txt
	   pdfinfo $file >> pdf_info.txt
	   echo -e "\n" >> pdf_info.txt
	end
end
