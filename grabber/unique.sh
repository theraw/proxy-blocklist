input="fulllist.txt"
output="unique_list.txt"

declare -A seen
while read -r line; do
    if [ -z "${seen[$line]}" ]; then
        echo "$line" >> "$output"
        seen[$line]=1
    fi
done < "$input"
rm -Rf fulllist.txt
