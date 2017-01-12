function split(inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={} ; i=1
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                t[i] = str
                i = i + 1
        end
        return t
end

function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

commandArray = {}
if (string.len(tostring(uservariablechanged['Location [NAME]'])) > 3) then
	print('change detected: '..uservariables['Home Location'])
	home_latitude, home_longitude = uservariables['Home Location']:match("([^,]+),([^,]+)")
	latitude, longitude = uservariablechanged['Location [NAME]']:match("([^,]+),([^,]+)")
	dlon = math.rad(home_longitude-longitude)
	dlat = math.rad(home_latitude-latitude)
	sin_dlat = math.sin(dlat/2)
	sin_dlon = math.sin(dlon/2)
	a = sin_dlat * sin_dlat + math.cos(home_latitude) * math.cos(latitude) * sin_dlon *sin_dlon
	c = 2 * math.atan2(math.sqrt(a),math.sqrt(1-a))
	distance = 10253130.6 * c
	print(distance)
	commandArray['Variable:DistanceFromHome'] = tostring(round(distance*10,1)*0.1)
end

return commandArray
