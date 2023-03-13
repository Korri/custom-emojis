 #!/bin/zsh

CONTENT="
"
for file in $(ls *.png | grep -v "@"); do
    CONTENT="$CONTENT<img src="$file" width="32" height="32" alt="$file" title="${file%.*}" />
"
done

sed -i '' -e "/### Emoji list/,/### / { /### /! { d; }; }" README.md
sed -i '' -e "/### Emoji list/r /dev/stdin" README.md <<< "$CONTENT"
