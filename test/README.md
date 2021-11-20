# How to Run Terratest

## Preconditions

Ensure you have a valid set of Atlas Keys in your environment that have permissions to create a project on DigitalOnUs Atlas organization

Atlas Keys to set:
```
MONGODB_ATLAS_PUBLIC_KEY
MONGODB_ATLAS_PRIVATE_KEY
```

Get the necessary packages:
```
go get github.com/gruntwork-io/terratest/modules/terraform 
go get github.com/stretchr/testify/assert@v1.4.0
```


## Run the test

In this directory (test) run the following command

```
go test -v -timeout 5m
```
