To setup:

0. Setup vagrant, virtualbox -and place all files in gist in a folder.

1. Review vagrant file
Look at the vagrant file and the cpu/ram usage. This runs two virtual
machines so it could use a lot of resources. Change the vagrant file to
your needs. You may get a 'no valid host was found' error since there
may not be enough allocated memory (If you lower the ram usage).

2. Run: `vagrant up`

3. Go to 192.168.50.7 in a web browser and log in using:
user: "another_demo_user"
password: "secretadmin"
You should then be able to see a dropdown on the top right for federation.
You should able to switch between Keystone Providersß
