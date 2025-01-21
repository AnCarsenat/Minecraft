-- Define the URL to download the folder from
local url = "https://github.com/AnCarsenat/Minecraft/tree/main/artillery/Version1/src"
local folderName = "cannon_updater"
local installScript = "install.lua"

-- Require necessary modules
-- local http = require("http")
-- local fs = require("fs")

-- Function to download a file
local function downloadFile(fileUrl, path)
    local response = http.get(fileUrl)
    if response then
        print("opening file")
        local file = fs.open(path, "wb")
        print("file opended writing file")
        file.write(response.readAll())
        print("file wrote closing file")
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

    print("Extracting file")
    -- Extract the zip file
    shell.run("tar", "-xf", folderName .. ".zip", "-C", folderName)
    print("Extraction complete.")

    -- Run the install script
    print("Running install script")
    shell.run(folderName .. "/" .. installScript)
    print("Installation complete.")
else
    print("Failed to download the folder.")
end
