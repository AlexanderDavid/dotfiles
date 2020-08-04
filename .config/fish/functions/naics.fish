function naics
curl "http://piccolo.diabolicallabs.com/api/opportunity/attachment/naics/"(pwd | rev |awk -F '/' '{print $1}' | rev | awk -F'_' '{print $1}') | tr -d '[]"' | sed 's/,/\n/g' | xargs -L 1 -I % sh -c 'curl -JO http://piccolo.diabolicallabs.com/api/opportunity/attachment/%'
end
