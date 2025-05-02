# Python TODO API

## Setup

Requirements:

- Python (3.8+)

**Recommended:** Install a Python [venv](https://docs.python.org/3/library/venv.html)

```bash
$ python3 -m venv .venv
$ . .venv/bin/activate
```

```bash
$ pip install -r src/api/requirements.txt
```

Or

```bash
$ poetry install
```

## Running with DocumentDB on local host

Start the DoucmentDB Docker image:

```bash
$ docker run -dt -p 10260:10260 documentdboss.azurecr.io/private-preview-manifest:0.0.
```
**Note:** Check TBD for more configuration parameters

Then set the `AZURE_COSMOS_CONNECTION_STRING` to the following value:
```bash
export AZURE_COSMOS_CONNECTION_STRING="mongodb://default_user:Admin100@localhost:10260/?directConnection=true&serverSelectionTimeoutMS=2000&authMechanism=SCRAM-SHA-256&tls=true&tlsAllowInvalidCertificates=true&appName=mongosh+2.5.0"
```

You might need to adjust the username `default_user` or the password `Admin100` or the port `10260` if you customized this
when starting the docker container.

There is also a docker-compose.file you cna use to run both containers. To do so:
```bash
$ docker-compose up
```
You then can access the todo application like noted in "Running in Docker"

## Running

Before running, set the `AZURE_COSMOS_CONNECTION_STRING` environment variable to the connection-string for mongo/cosmos.

Run the following common from the root of the api folder to start the app:

```bash
$ uvicorn todo.app:app --port 3100 --reload
```

There is also a launch profile in VS Code for debugging.

## Running in Docker

The environment variable AZURE_COSMOS_CONNECTION_STRING must be set and then application runs on TCP 8080:

```bash
docker build . -t fastapi-todo
docker run --env-file ./src/.env -p 8080:8080 -t fastapi-todo
```

## Tests

The tests can be run from the command line, or the launch profile in VS Code

```bash
$ pip install -r requirements-test.txt
$ AZURE_COSMOS_DATABASE_NAME=test_db python -m pytest tests/
```
