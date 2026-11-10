require("folder-rules"):setup()
require("session"):setup({
	sync_yanked = true,
})
function Linemode:size_and_mtime()
	local mtime = self._file.stat.mtime
	local time = ""
	if mtime then
		if mtime.year == ya.time().year then
			time = mtime:format { month = "2-digit", day = "2-digit", hour24 = "2-digit", minute = "2-digit" }
		else
			time = mtime:format { month = "2-digit", day = "2-digit" } .. "  " .. mtime.year
		end
	end
	local size = self._file:size()
	return string.format("%s %s", size and ya.readable_size(size) or "-", time)
end
