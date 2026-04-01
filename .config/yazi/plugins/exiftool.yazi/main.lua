local M = {}

function M:peek(job)
    local cmd = "exiftool"
    local args = {
        "-f",
        "-p",
        "\x1b[34mFile name\x1b[0m: $FileName\n" ..
        "\x1b[34mLast modified\x1b[0m: $FileModifyDate\n" ..
        "\x1b[34mPermissions\x1b[0m: ${FilePermissions;}\n" ..
        "\x1b[34mFile type\x1b[0m: ${FileType;}\n" ..
        "\x1b[34mFile OS\x1b[0m: ${FileOS;}\n" ..
        "\x1b[34mFile version\x1b[0m: ${FileVersionNumber;}\n" ..
        "\x1b[34mProduct version\x1b[0m: ${ProductVersionNumber;}\n" ..
        "\x1b[34mCompany name\x1b[0m: ${CompanyName;}\n" ..
        "\x1b[34mFile description\x1b[0m: ${FileDescription;}\n",
        tostring(job.file.url)
    }
	local output, err = Command(cmd):arg(args):output()

	local text
	if output then
        local header = string.format("\x1b[1;33mExiftool in file: %s\x1b[0m\n\n", job.file.name)
        text = ui.Text.parse(header .. output.stdout):fg("red")
	else
		text = ui.Text(string.format("Failed to start %s, error: %s", cmd, err)):fg("red")
	end

	ya.preview_widget(job, text:area(job.area))
end

function M:seek() end

return M
