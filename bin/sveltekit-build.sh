#!/bin/sh
echo "Starting SvelteKit Build"

SUBPATH="/xyz"

# We need to config the stuff to inject into the template
cp ./xyz-erb-inject.txt ./scanning-app/ruby-injection-config.txt

# First build scanning app
cd ./scanning-app
yarn install --frozen-lockfile
VITE_BASE_PATH=${SUBPATH} yarn rails-build
cd ../

rm -rf ./public/${SUBPATH}/

# Then copy the assets to the new locations
cp -r ./scanning-app/build/ ./public/${SUBPATH}/

# Yeet all the html files in the static dir,
# as they are all replaced with the ERB template.
find ./public/${SUBPATH}/ -name "*.html" -type f -delete

# Finally we can copy the index.html.erb template
cp ./scanning-app/build/index.html.erb ./app/views/${SUBPATH}/index.html.erb

echo "SvelteKit Build Complete"