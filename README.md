## Materials :
* IBM installation Manager :
  * http://www-01.ibm.com/support/docview.wss?uid=swg27025142 : agent.installer.linux.gtk.x86_64_1.8.3000.20150606_0047.zip
* Websphere 8.5 .
  * IBM WebSphere Application Server Network Deployment Trial, Full Profile (Part 1 of 3) was.repo.8550.ndtrial_part1.zip (1.1G)
  * IBM WebSphere Application Server Network Deployment Trial, Full Profile (Part 2 of 3) was.repo.8550.ndtrial_part2.zip (1.1G)
  * IBM WebSphere Application Server Network Deployment Trial, Full Profile (Part 3 of 3) was.repo.8550.ndtrial_part3.zip (903M)

## Installation and provisionning :

Put this in the in seperate folder for example:

	myHost:~ nabil cd /Users/macpro/Projects/trash/puppet/files
	ls -l
	myHost:files nabil$ ls -l
	total 0
	drwxr-xr-x  31 nabil  staff  1054 Jul 30 01:09 IM
	drwxr-xr-x  13 nabil  staff   442 Jul 25 02:11 WAS
	myHost:files macpro$ cd IM/
	myHost:IM macpro$ ls -l
	-rw-------@    1 macpro  staff  169907161 Jul 19 17:28 agent.installer.linux.gtk.x86_64_1.8.3000.20150606_0047.zip
	myHost:IM nabil$ cd ../WAS/
	myHost:WAS nabil$ ls -l
	-rw-------@  1 nabil  staff  1054492138 Jul 25 01:49 was.repo.8550.ndtrial_part1.zip
    -rw-------@  1 nabil  staff  1022550066 Jul 25 01:57 was.repo.8550.ndtrial_part2.zip
    -rw-------@  1 nabil  staff   902443246 Jul 25 02:04 was.repo.8550.ndtrial_part3.zip

Unzip all materials using the command :

    unzip ...

When all the materials are unziped , we can now build our docker images :

    git clone https://bitbucket.org/livetell/aeva_developer_websphere.git
    cd websphere-provisionning/docker/base
    docker build -t 'nabilblk/was' .

After this an images will be created , to confirm tape the command :

    myHost:base nabil$ docker images
    REPOSITORY             TAG                 IMAGE ID            CREATED              VIRTUAL SIZE
    nabilblk/was         latest              f69f3da65d34        11 hours ago        367.7 MB

Now the images is ready , lets create a container :

    docker run -v /Users/macpro/Projects/trash/puppet/files:/download/was -p 9060:9060 -p 9080:9080 -p 9443:9443 -it nabilblk/was

What this command mean ??


docker run -v %Host_Path%:%Container_Path% -p %Host_Port%:%Container_Port% -it %Image_Name%

Variable  | Description
------------- | -------------
Host_Path  | The foler where all websphere and Websphere installation Manager exit
Container_Path  | The folder in the container where we will mount the Host_Path
Host_Port  | The port in the Host Machine that will be linked to the container port
Container_Port  | the websphere DMGR port
Image_Name  | The name of the docker image (docker build -t '%Image_Name%' .)


After running the command you will be connected directelly in the docker container with puppet standalone and recipts are already installed .

To start provisionning , there is two scripts for this :

    [root@ace863d4292d /]#
    [root@ace863d4292d /]# cd /home/
    [root@ace863d4292d home]# ./install.sh
    [root@ace863d4292d home]# ./configure.sh
    [root@ace863d4292d home]# ./start.sh


Now you can access to websphere console here :
http://%CONTAINER_IP%:9060/ibm/console/unsecureLogon.jsp

You can get the container ip by running this command in the HOST :

    myHost:base nabil$ boot2docker ip
    192.168.59.103

If you are using docker 1.8+ please run this command get the ip :
    myHost:base nabil$ docker-machine ip default
    192.168.59.103
