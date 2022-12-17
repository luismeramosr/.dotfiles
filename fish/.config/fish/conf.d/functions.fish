function bctl
	xrandr --output HDMI-A-0 --brightness $argv
end

function update
	yay -Syyu --nodiffmenu --noanswerupgrade --noconfirm
end
