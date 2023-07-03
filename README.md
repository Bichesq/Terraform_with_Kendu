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

<h2>Day 2</h2>
<h3>Provisioners</h3>
Provisioners give terraform a means to execute some operations that are not fundamentally part of its functionality. Terraform is a infrastructure provisioning tool and it is not best practise to use it for any configuration tasks, though situations may necessitate one or two configuration actions, like copying files from local machine to the server.<br> 
There are three types of provisioners: File, local exec and remote exec provisioners.

<h4>File Provisioner</h4>
The file provisioner is used to copy files or directories from the machine executing the terraform apply to the newly created resource.  The file provisioner can connect to the resource using either ssh or winrm connections.

<h4>Remote exec Provisioner</h4>
It automatically logs in to the created instance and carries out initial configurations like install programs<br>
As the name suggests remote-exec provisioner is always going to work on the remote machine. With the help of this, you can specify the commands of shell scripts that want to execute on the remote machine.<br>
The remote-exec provisioner invokes a script on a remote resource after it is created. This can be used to run a configuration management tool, bootstrap into a cluster, etc. It requires a connection and supports both ssh and winrm.<br>
- There are two methods to go about the remote-exec provisioner: inline and script

<h5>Inline</h5>
In the inline execution, use the inline attribute. It takes as values a list of command you wish to run on the remote terminal - []

<h5>Script</h5>

<h4>Local exec Provisioner</h4>
Copies resourses from created instance into may a file in your local machine.
The local-exec provisioner invokes a local executable after a resource is created. This invokes a process on the machine running Terraform, not on the resource.<br>
Basically, this provisioner is used when you want to perform some tasks onto your local machine where you have installed the terraform.

<h4>The Connection Block</h4>
Since the provisioners will need to have access into the server before performing their tasks, they will need a connection block.<br>
- The connection block takes the attributes: type, user, host and password (or private_key as an alternative to password)<br>
- type specifies how we will connect to the remote server, in our case ssh<br>
- User specifies which user are we logging into the server as: ubuntu, ec2-user, root etc depending on your operating system<br>
- The host defines the ip address of your remote server. Since it is yet to be created we set this attribute to self.public_ip<br>
- set private_key to a file containting the private key: file(path_to_file)

<h2>Day 3</h2>
<h3>Terraform Variables</h3>
- Variables are used to make our terraform configuration file reusable and also to keep sensitive information out of our configuration file which can eventually be pushed to github.<br>
- Variables are declared by using the keyword variable followed by the variable itself and end up with curly brackets open and close.<br>
- This variable block can take optional attributes: description, type and default etc. The description carries info about the variable, while default defines a default value for the variable. This default value is what terraform uses if that variable is not specified before or when executing the terraform configuration file(terraform plan/apply).<br>
If this default is not set and the variable is not defined before and when the terraform file is executed, there will be a promt seeking these values<br>
- As a commong practice these variable are created in separate file called variables.tf

<h4>Defining variables values</h4>
-There are three ways in which variables can be defined: default values, manual values and .tfvar files<br>
- We have seen default values already<br>
- Manual values are entered on the terminal with the terraform plan/apply command(using the flag --vars). These manual values have the highest priority among all methods of defining variable values. This means that terraform will first check if manual values have been configured before moving to the other options if not.<br>
- Next in priority is the .tfvars file. This is a separate file in which we define the values for all the variables we have in our main terraform configuration file.

<h5>Custom auto tfvars files</h5>
When the .tfvars files are named terraform.tfvars terraform recognises it automatically. But there are situations that need the file to be named differently eg to define differnt evironments for deployement of infrastructure.<br>
These files are called custom files and so when we do use another name other than terraform, we have to add .auto before the .tfvars, if we want terraform to read the file automatically.<br>
If we do not use this .auto, we will have to use a flag (--var-file) at the command line to indicate this file during terraform apply.

<h4>Consuming(making use of) variables</h4>
To make use of variables in place of the actual values, we use the key work var followed by a dot and then the variable name. e.g var.subnet_cidr

<h4>Referencing a resource</h4>
resource.resource_logical_name.id (id can be replaced by any attribute of the resource object depending on the need.)

<h3>Environmental variables</h3>
Environmental variables are used by Terraform to to customize various aspects of its behaviour.

<h4>TF_VAR_name Environmental variable</h4>
The TF_VAR_name is used to set variables. It is yet another way to set or define a variable. It has that least priority so tarraform will consider it last when it looks for a value to a variable.<br>
- Use this variable to export the variable in question, a variable with name: db_user. To do this pass the following on the terminal:<br>
export TF_VAR_db_user=Your_db_username<br>
When this is done and you run terraform plan/apply, the value is pick up from the environment by terraform automatically.

<h2>Day 4</h2>
Here the variable types are being handled.

<h3>Sensitive</h3>
- Variable are made into sensitive (secured) items by passing the sensitive argument to the variable block and settng it to true. This will cause these values of such variable not to appear say when you run terraform plan.

<h3>list</h3>
- The variable type is defined as list(string)<br>
- when the variable is called, one value in the list has to be specified using indexing

<h3>map</h3>
- With the variable type = map, the default argument is set to a map. A map is a list of key-value pairs enclosed in curly brackets<br>
- When calling this variable, we pass the corresponding key to the value that is desired in square brackets

<h2>Day 5</h2>
<h4>State Management</h3>
- State management is simply the different ways in which we can manage the state file. A more formal defination is process of capturing and storing infratruction created in terraform. Terraform keeps track of the provisioned resources and the relation between them in a file called the state file which stores the state of your configuration using the .tfstate file.<br>
- There are two types of states: local and remote.<br>
- When you manage your state file locally you use a local state. this is not recommended when more that one persons are using the state file.<br>
- With remote state file, the file are stored in a secured remote locate. This is a recommended state managment method. It give us the advantage of collaboration and versioning.<br>
- In aws state files are kept in s3 buckets were versioning and encryption can be used.<br> 
- S3 stores the state as a key in a bucket.<br>
- There is also state locking and consistency checking via DynamoBD which can be enables by setting the dynamobd_table field in an existing DynamoDB table name. Terraform generates key names that include the values of the bucket and key variables. <br>
- This helps prevert file corruption. It enabels that only one person can apply changes at a time. So before some one runs terraform apply, a lock is acquired and as long as that terraform apply is going on, no other person can run a terraform apply.<br>
- the lock is created by the developer in dynamodb. So terraform collects the lock from dynamodb and lock the apply.<br>
- With the remote storage in s3 either the s3 bucket is first of all create  manually and then the state files programed to be stored there; or terraform itself can be used to create the s3 bucket and then the state files can now be copied to it.<br>
- To set the state files to be stored remotely, we will need the backend block configured in the terraform block itself. This backend block specifies the bucket, key and region.<br>
- The bucket is the name of the s3 bucket in which you want to store your state files<br>
- The key is the path in the bucket to the state file<br>
- The region argument defines the region choice for the s3 bucket.<br>
- Note the terraform automatically uses the backend except it is not set.<br>
