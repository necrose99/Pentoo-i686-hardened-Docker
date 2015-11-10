# Pentoo_i686_hardened_Docker
Pentoo_i686_hardened_Docker

**notes still very ALPHA **

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
