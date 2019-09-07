# Program to crawl Google Images to fill existing food-400 categories to 500 images each

function get_num_files {
  # Gets the number of files in directory
  cd $(echo $1 | tr -d '\r')
  NUM_FILES=$(ls -1 | wc -l)
  echo "$NUM_FILES"
  cd ..
}

cd "$HOME"/Documents/food-datasets/food-404/images || exit
for img_cat in *; do
  NUM_FILES=$(get_num_files "$img_cat")
  if (( $NUM_FILES < 400 )); then
    googleimagesdownload -k "$img_cat" -o "$HOME"/Documents/food-datasets/food-404/images/$img_cat \
    -l $((400-$NUM_FILES)) -cd "/usr/lib/chromium-browser/chromedriver"
  fi
done
