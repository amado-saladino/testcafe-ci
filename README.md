# testcafe-ci

Testcafe with continuous integration using GitHub Actions

## Run in Docker Container

The below steps are meant to run in a docker container either in a local or cloud environment. Running the project in GitHub Actions does not require using Docker, it automatically set up what is required as per workflow configurations.

## Build Image

`docker build -t test:1.0 .`

## Start Container

`docker run -v /app/node_modules -v test-project:/app -p 80:8000 test:1.0`

## Port

Port 8000 is exposed in `Dockerfile` Allure repport is also published on port 8000 in `entrypoint.sh` script

## Volumes

`node_modules` directory is anonymously mounted to avoid error that might happen as this directory will be created during installing `npm` packages.

`test-project` is a volume mount mapped to `/app` which is the working directory in the container, this allow file and directory syncronization between the container and the host. To update the project:

- Stop the container `docker stop <container-name or id>`
- Update tests or pages
- Start the container again `docker start <container-nanme or id>`
- Open your browser and navigate to `http://<YOUR-IP>`

## References

I learnt [this course](https://testautomationu.applitools.com/testcafe-tutorial/) before building this project.
