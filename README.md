# Open edX Setup

Boilerplate repo for Open edX installation using Terraform.

## Features:
* `Open edX` configuration

## Commands to run:
```
 *     echo EDXAPP_LMS_BASE: '${aws_instance.edx_instance.public_ip}' >> config.yml
 *     echo EDXAPP_CMS_BASE: '${aws_instance.edx_instance.public_ip}' >> config.yml
 *     sudo wget https://raw.githubusercontent.com/lpm0073/edx.scripts/master/edx.platform-install.sh
 *     sudo chmod 755 edx.platform-install.sh
 *     sudo nohup ./edx.platform-install.sh &

 *     sudo /edx/bin/supervisorctl status
```
#### create the admin account:
```
   cd /edx/app/edxapp/edx-platform
   sudo -u www-data /edx/bin/python.edxapp ./manage.py lms --settings aws createsuperuser
```
#### Optional: add the ubuntu user to a couple of the Open edX Linux groups. This will greatly simplify working with Open edX system files.
```
 sudo usermod -a -G www-data ubuntu
 sudo usermod -a -G edxapp ubuntu
```

* Configure [pre-commit](https://pre-commit.com/) hook. Before every commit the hook will properly format your tf files and also regenerate README.md using `terraform-docs`.
```
brew install pre-commit
pre-commit install # In project folder
```


