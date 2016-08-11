# Running Strato with Docker

Strato is easiest to deploy and manage when running inside a containerized environment. 
Composed of many of loosely coupled microservices, Strato is architected for modularity and scalability.

We package our software using a Docker registry and provide a Docker Compose file and a set of 
scripts to launch Strato.

## Launching the Software

Prerequisites: Docker.

After successfully installing Docker, and purchasing a developer or production license for Strato, 
you will be granted access credentials to our registry at auth.blockapps.net:5000. Using those credentials,
login to the registry with `docker login`:

```
$ docker login -u <user> -p <password> auth.blockapps.net:5000

Login succeeded.
```

Having successfully logged in, launch strato by running `./init-strato.sh`. This will pull the software from the registry and launch the strato platform in single node development mode. The end state looks like:

```
$  ./init-strato.sh 

Creating network "docker_default" with the default driver
Creating docker_postgres_1
Creating docker_global-db_1
Attaching to docker_global-db_1
global-db_1  | pghost = postgres
global-db_1  | Waiting for postgres to start
..
global-db_1  | Waiting for postgres to start
global-db_1  | Migrating: CREATe TABLE "blockchain"("id" SERIAL  PRIMARY KEY UNIQUE,"path" VARCHAR NOT NULL,"uuid" VARCHAR NOT NULL)
global-db_1  | >>>> Creating global database
docker_global-db_1 exited with code 0
docker_postgres_1 is up-to-date
..
Creating docker_strato_1
Creating docker_nginx_1
```

Check that Strato launched successfully by running the faucet:
```
$ curl -d "faucet=1&&password=securePassword"  http://localhost:8000/users/testUser

57d2c0dfaa8788f19d53b4a1da50c9f4bd353755
```

You are now ready to build your first Blockchain Application.