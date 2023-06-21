<h1>Terraform Class with Kendu Francis</h1>

<h2>Day One</h2>
-The profider.tf configuration file begins with the terraform block, that takes two arguments: required_version (of terraform) and required_provider. The required terraform version matches that which is installed in the local machine or the desired version of the team running the project, in this case: 1.4.6

-The required_provider argument specifies the aws provider, which in turn carries arguments of source (hashicorp/aws) and the version (5.0.1)

<h3>Static Credentials</h3>
-The authentication information specified in the provider block which is in the profider.tf file, (other norms just call is main.tf file).
-This block takes the arguments region (eu-central-l), access_keys and secred_key.
-These key are used to gain access into the provider account (aws)
-They are hard coded in the configuration file, hence the name static credentials. 
-But this is not best practice, thus we have dynamic credentials.

<h3>Dynamic Credentials</h3>
<h4>Shared Credential</h4>
-Here we make use of shared credentials, were terraform makes use of the config and the credentials files of aws.
-The provider block here, contains three arguments: shared_config_files to which the path to the config file is attributed,
the shared_credentials_file to which the path to the credentias file is attributed and profile which specifies the profile used.

<h4>profiles</h4>
-use: aws configure --profile <profile_name> to create profiles. In this case create two profiles: (replace <profile_name> with) dev-account and prod-account. Enter the information requested: access key, secret key, default region. You can ignore the default output format.
-Here the provider block contains three arguments: region which specifies a region incase you wish to use a region different from the default; profile which specifies the profile and lastly alias which will be use to define multiple providers for recourse creation.