# github-repo-search

A simple sinatra app that displays public repositories from GitHub based on the search term provided.

## Requirements 

1. Sinatra 3.1.0
2. Ruby 2.7.7

## How to Run 

### Docker 

A Dockerfile is included to enable ease of execution on either Linux, mac or windows. To run on Linux, make sure to have docker installed on your machine and follow the instructions below:

1. $ git clone https://github.com/harryobas/github-repo-search.git

2. $ cd github-repo-search

3. $ sudo docker build . -t "github-repo-search"

4. $ sudo docker run -p 4567:4567 --network="host" github-repo-app

5. Go to http://localhost:4567 on your browser 




