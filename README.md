<h1>Terraform Class with Kendu Francis</h1>

<h2>Day One</h2>
-The profider.tf configuration file begins with the terraform block, that takes two arguments: required_version (of terraform) and required_provider. The required terraform version matches that which is installed in the local machine or the desired version of the team running the project, in this case: 1.4.6<br>

-The required_provider argument specifies the aws provider, which in turn carries arguments of source (hashicorp/aws) and the version (5.0.1)<br>

<h3>The state files</h3>
- There are files and folders that terraform automatially creates in the course of working with it. They are: the .terraform folder, the terraform.tfstate file, the terraform.tfstate.backup, the terraform.lock.hcl file<br>

<h4>The .terraform Folder</h3>
- This folder is created when we run the terraform init command. 
<h4>The terraform.lock.hcl</h3>
- This file is created when we run the terraform init command. This file holds all the information about the providers that have been installed with the terraform init.
<h4>The terraform.tfstate</h3>
- This file is created when the terraform apply is run. This holds the current state of your provisioned infrastructure. it is the source of truth for you configuration.
<h4>The terraform.tfstate.backup</h3>
- This is created when terraform destroy is run. It serves for reverting a change if the need arises. It backs up the .tfstate file.

<h3>Static Credentials</h3>
-The authentication information specified in the provider block which is in the profider.tf file, (other norms just call is main.tf file).<br>
-This block takes the arguments region (eu-central-l), access_keys and secred_key.<br>
-These key are used to gain access into the provider account (aws)<br>
-They are hard coded in the configuration file, hence the name static credentials.<br>
-But this is not best practice, thus we have dynamic credentials.<br>

<h3>Dynamic Credentials</h3>
<h4>Shared Credential</h4>
-Here we make use of shared credentials, were terraform makes use of the config and the credentials files of aws.<br>
-The provider block here, contains three arguments:<br>
shared_config_files to which the path to the config file is attributed,<br>
the shared_credentials_file to which the path to the credentias file is attributed and profile which specifies the profile used.<br>

<h4>profiles</h4>
-use: aws configure --profile <profile_name> to create profiles. In this case create two profiles: (replace <profile_name> with) dev-account and prod-account. Enter the information requested: access key, secret key, default region. You can ignore the default output format.<br>
-Here the provider block contains three arguments: region which specifies a region incase you wish to use a region different from the default; profile which specifies the profile and lastly alias which will be use to define multiple providers for recourse creation.

<h2>Day 4</h2>
Here the variable types are being handled.

<h3>Sensitive</h3>
- Variable are make into sensitive (secured) items by passing the sensitive argument to the variable block and settng it to true. This will cause these values of such variable not to appear say when you run terraform plan.

<h3>list</h3>
- The variable type is defined as list(string)<br>
- when the variable is called, one value in the list has to be spesified using indexing

<h3>map</h3>
- With the variable type = map, the default argument is set to a map. A map is a list of key-value pairs enclosed in curly brackets<br>
- When calling this variable, we pass the corresponding key to the value that is desired in square brackets

<h2>Day 5</h2>
<h4>State Management</h3>
- State management is simply the different ways in which we can manage the state file. A more formal defination is process of captureing and storing infratruction created in terraform. Terraform keeps track of the provisioned resources and the relation between them in a file called the state file which stores the state of your configuration using the .tfstate file.<br>
- There are two types of states: local and remote.<br>
- When you manage your state file locally you use a local state. this is not recommended when more that one persons are using the state file.<br>
- With remote state files, the files are stored in a secured remote locate. This is a recommended state managment method. It give us the advantage of collaboration and versioning.<br>
- In aws state files are kept in s3 buckets were versioning and encryption can be used.<br> 
- There is also stage locking. This helps prevert file corruption. It enabels that only one person can apply changes at a time. So before some one runs terraform apply, a lock is acquired and as long as that terraform apply is going on, no other person can run a terraform apply.<br>
- the lock is created by the developer in dynamodb. So terraform collects the lock from dynamodb and lock the apply.<br>
- With the remote storage in s3 either the s3 bucket is first of all create  manually and then the state files programed to be stored there; or terraform itself can be used to create the s3 bucket and then the state files can now be copied to it.<br>
- To set the state files to be stored remotely, we will need the backend block. this backend block specifies the bucket, key and region.<br>
- The bucket is the name of the s3 bucket in which you want to store your state files<br>
- The key is the path in the bucket to the state file<br>
- The region argument defines the region choice for the s3 bucket.<br>
- Note the terraform automatically uses the backend except it is not set.<br>
