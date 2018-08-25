# to check keywords in the head of files recursively along with subdirectorys
#e.g: ./check_head_keywords.sh "package"
file_name=$1
echo "$file_name"
echo searching $file_name in the head of files...
function check_sub {
	if [ -z "$file_name" ]; then
		echo "please input a string in argument1 before running this script"
		return
	fi
	file_arrays=($(ls $1))

	# echo $1
	for i in ${file_arrays[@]}
	do
		if test -f $1${i} 
		then
			if head -30 $1$i | grep -q $file_name; then
				echo directory: $2
		 		echo $i
		 	fi
		else
			check_sub $1$i/ $i
		fi
	done
}
check_sub ./