# riot.im-docker
A project that puts the [riot.im webapp](https://github.com/vector-im/riot-web) in a docker image.  
The build process automates [the getting started](https://github.com/vector-im/riot-web#getting-started) guide.  
You can mount your own [config.json](https://github.com/vector-im/riot-web#configjson) in `/data`. If you don't, the container will run
with the default sample config.json.

Exposes riot-web via the builtin python3 HTTP server on port `8000`.
