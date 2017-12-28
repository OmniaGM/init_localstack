### INIT_LOCALSTACK Template
This template allow you to mock AWS services without changing the endpoint for the services by hide [localstack](https://github.com/localstack/localstack) behind Nginx server which map between AWS API to localstack which is mocking tool to many of AWS services.

This template based on [initialised-localstack](https://github.com/markglh/initialised-localstack) image which allow you to start [localstack](https://github.com/localstack/localstack) image fully initialised with your configuration.

### Running
`docker-compose up` will start 

- the stack with the services defined by SERVICES in the docker-compose.yml 
- Nginx server with self-signed certificate
- your app container with certificate assigned to it 

### Bootstrapping LocalStack
You can override `./bootstrap_localstack/init.sh` script for more details you can check [initialised-localstack](https://github.com/markglh/initialised-localstack)


### Add Your Application
Just Add your application container setup in the placeholders in `Dockerfile`