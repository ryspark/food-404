# Program to crawl Google images based on the contents of to_crawl.txt

cd "$HOME"/Documents/food-datasets/crawl-scripts
while read search; do
  TARGET=$(echo "$search" | sed -e "s/ /_/g")
  googleimagesdownload -k "$search" -o "$HOME"/Documents/food-datasets/food-404/images -i "$TARGET" -l 500 -cd "/usr/lib/chromium-browser/chromedriver"
done </home/ryan/Documents/food-datasets/crawl-scripts/to_crawl.txt
