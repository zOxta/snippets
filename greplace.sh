# Ubuntu's version
grep -rl "https://ajax.googleapis.com/ajax/libs/jquery" /in/this/directory | xargs sed -i 's/https:\/\/ajax.googleapis.com\/ajax\/libs\/jquery/https:\/\/cdn.jsdelivr.net\/jquery/g'

# OSX's version (notice the empty string after the -i argument)
grep -rl "https://ajax.googleapis.com/ajax/libs/jquery" /in/this/directory | xargs sed -i '' 's/https:\/\/ajax.googleapis.com\/ajax\/libs\/jquery/https:\/\/cdn.jsdelivr.net\/jquery/g'
