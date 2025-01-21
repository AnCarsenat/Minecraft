
--Lua program for controlling
--digi_adapters


print("test")

--Run peripheral to get periph name

digi_adpt_name = "digital_adapter_0"

--Check if it works in terminal :
--. . . print(peripheral.getMethods(digi_adpt_name))

--This is used to list methods of said adapter
for i, method
in pairs(peripheral.getMethods(digi_adpt_name))
do print(method)
end

--Check for issues
print("digi_adpt_name = "..digi_adpt_name)

--We finally make a call to one of it's methods
peripheral.call(digi_adpt_name,"print")
