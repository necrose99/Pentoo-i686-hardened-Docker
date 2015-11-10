# Pentoo_i686_hardened_Docker
Pentoo_i686_hardened_Docker

**notes still very (pre) ALPHA **
### 
with Gentoo add LXC and Docker 
IE Emerge LXC and DOCKER 

https://hub.docker.com/r/necrose99/pentoo-i686-hardened-docker/ 

auto build of pentoo in docker container , (much still to do as Gentoo-x86-hardened isnt genrating 
if it was I could simplely add on pentoo Repo and packages ie emerge --usebinpkg and swap make.conf to pull in binhosted
them emerge --update all (etc) 
https://hub.docker.com/r/necrose99/gentoo-docker-x86/ works so I can Add on to this however Gentoo x86hardend wont. 

my thinking is to simply unpack iso keep squashfiles then unpack into necrose99/gentoo-docker-x86 based container overight the non hardend files. , then prune squashfiles , then update pentoo container.
**Wishlist for Pentoo /lastest-iso/amd64-hardend ,x86 etc... ** 

but for testing new ebuilds in a fresh chroot (idea is to have it autobuilt daily) on demand or beable to have a forkable shareable testing chroot ie (like github branches instanceable) anyhow I can make changes but dont have to sync the whole VM. if I find something useful 
#### why 
Bump testing , custom Cd's anything to were Breaking your "Production" Install isnt a good Idea. 
<a href="http://www.youtube.com/watch?feature=player_embedded&v=YOUTUBE_VIDEO_ID_HERE
" target="_blank"><img src="http://img.youtube.com/vi/pg1onIAwpaQ/0.jpg" 
alt="IMAGE ALT TEXT HERE" width="240" height="180" border="10" /></a>
Docker+LXC alows for a Fast Chroot one can do version teting of varrious things. and or you can make for use as package builds were you have some abstraction like a virtual machine ie jailing however far less of a CPU penelty that a full hyprivsor has. however in a jailed chroot IP and remote X11 ie can test LXQT for pentoo etc. 
<img src="http://avanimation.avsupport.com/gif/F-18b.gif"> I like to Do Reserch for new Security tools I like the Bleeding Edge.  Insted of Flying High I'm more like the car-crash test dummy.  **However You swing a hammer enough an smash your thumbs** enough one teends to **try to find a better way**
For the average user 
having to setup Chroot ....**BrainFREZE** headache .... 
adding in docker and vagrant lxc , if your chroot goes Bust you should be able to pull down a fresh copy every time
and far less Paifull. as  well **Dockerhub will Regenerate daily**  So thus **FRESH Packages**

### note I could Give a rats about x86 support however on most corp Laptops 64 bit windows and an i5 Virtualbox/vmware images and 64 bit will craw like ass. however as a nod to the Pentoo Team and for the Olivebranch and to Pentoo Users it gives a safe means of Installing Pentoo Linux on say Ubuntoo or other distos as a container , or one can make 
*** A CLOUD Security APPLIANCE***  or **CLoud based dev container** IE can build packages or likewise shared workspaces without the usual security contraints. 

#### Docker has diffrancing/(github like versioning) so if you have bugs being able to share your container (And only the files etc that have changed.) ie if only 10 megs out of the 2-3 gigs of an Install then that is it.
as well 
##Prior to testing You can Fork the container## ie **stable**   **Testing** ***OMG this is going to get Nuts (might bust up something)***  thus like Master on github , Testing & **This could be a really BAD Idea**.... branches you can more safely test things. 

