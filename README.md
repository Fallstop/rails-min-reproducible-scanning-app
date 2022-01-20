# Rails min-reproducible scanning app

### Setup
Requires a *nix based os (sample build script uses /bin/sh)
```bash
bundle install
rake sveltekit # Runs build & injection of app
rails server
```
You can find the svelte app at [`http://127.0.0.1:3000/xyz`](http://127.0.0.1:3000/xyz)