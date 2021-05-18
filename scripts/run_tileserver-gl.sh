docker run --rm -it --name tilserver-gl -v $(pwd)/data:/data  -p 8080:8080 maptiler/tileserver-gl --public_url http://localhost:8080 --verbose
