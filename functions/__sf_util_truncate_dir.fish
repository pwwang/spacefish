#
# Truncate directory
#

function __sf_util_truncate_dir -a path truncate_to -d "Truncate a directory path"
	if test "$truncate_to" -eq 0
		echo $path
	else
		set -l folders (string split / $path)

		if test (count $folders) -le "$truncate_to"
			echo $path
		else
      set -l prefix
			if test -z $SPACEFISH_DIR_TRUNC_LEN -o "$SPACEFISH_DIR_TRUNC_LEN" -eq 0
				set prefix ".../"
			else
				set prefix (string sub -l $SPACEFISH_DIR_TRUNC_LEN $folders[1..(math -1 - $truncate_to)] | tr "\n" /)
			end
			echo $prefix(string join / $folders[(math 0 - $truncate_to)..-1])
		end
	end
end
