-- Define the URL to download the folder from
local url = "http://example.com/path/to/folder.zip"
local folderName = "downloaded_folder"
local installScript = "install.lua"

-- Function to download a file
local function downloadFile(url, path)
    local response = http.get(url)
    if response then
        local file = fs.open(path, "wb")
        file.write(response.readAll())
        file.close()
        response.close()
        return true
    else
        return false
    end
end

-- Download the folder zip file
if downloadFile(url, folderName .. ".zip") then
    print("Download complete.")

    -- Extract the zip file
    shell.run("unzip", folderName .. ".zip", folderName)
    print("Extraction complete.")

    -- Run the install script
    shell.run(folderName .. "/" .. installScript)
    print("Installation complete.")
else
    print("Failed to download the folder.")
end