# Install Essentials
apt-get -y update
apt-get -y upgrade

apt-get install tmux
apt install build-essential
apt install snapd
snap install core
snap install micro --classic
apt-get install curl
apt-get install wget
apt-get install make
apt-get install whois
apt-get install manpages-dev
apt-get install nano
apt-get install dnsutils
apt-get install awscli
apt-get install iputils-ping
apt-get install net-tools
apt-get install -y libcurl4-openssl-dev
apt-get install -y libssl-dev
apt-get install -y jq
apt-get install -y ruby-full
apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
apt-get install -y build-essential libssl-dev libffi-dev python-dev
apt-get install -y python-setuptools
apt-get install -y libldns-dev
apt-get install -y python3-pip
apt-get install -y python-pip
pip3 install bs4
pip install wfuzz
pip3 install BeautifulSoup
python3 -m pip install fierce
apt-get install -y python-dnspython
apt-get install -y git
apt-get install -y rename
apt-get install -y xargs
apt-get install tar


# echo "Installing Golang"
wget https://golang.org/dl/go1.15.linux-amd64.tar.gz
tar -xvf go1.15.linux-amd64.tar.gz
mv go /usr/local
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export GOPATH=$HOME/go'	>> ~/.bashrc
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bashrc
source ~/.bashrc


# echo "Installing Nmap"
apt install nmap
GO111MODULE=on go get -v github.com/projectdiscovery/naabu/cmd/naabu


GO111MODULE=on go get -v github.com/OWASP/Amass/v3/...


# echo "Installing Sqlmap"
apt install sqlmap


mkdir ~/tools
cd ~/tools/

# echo "installing GooGleBucketBrute"
git clone https://github.com/RhinoSecurityLabs/GCPBucketBrute.git
cd ~/tools/GCPBucketBrute
pip3 install -r requirements.txt
cd ~/tools/
# echo "done"

# echo "installing WpScan"
git clone https://github.com/wpscanteam/wpscan.git && \
cd ~/tools/wpscan/ && \
gem install bundler && bundle install --without test && \
gem install wpscan
cd ~/tools/
# echo "done"

# echo "installing LinkFinder"
git clone https://github.com/GerbenJavado/LinkFinder.git
cd ~/tools/LinkFinder/
python3 setup.py install
pip3 install -r requirements.txt
cd ~/tools/
# echo "done"

# echo "installing gobuster"
git clone https://github.com/OJ/gobuster.git && \
cd ~/tools/gobuster && \
go get && go install
cd ~/tools/
# echo "done"

# echo "installing jsearch"
git clone https://github.com/incogbyte/jsearch.git
cd ~/tools/jsearch/
pip3 install --user -r requirements.txt
cd ~/tools/
# echo "done"



# echo "installing Wafw00f"
git clone https://github.com/EnableSecurity/wafw00f.git
cd ~/tools/wafw00f/
python3 setup.py install
cd ~/tools/
# echo "done"

# echo "installing EyeWitness"
git clone https://github.com/FortyNorthSecurity/EyeWitness.git
cd ~/tools/EyeWitness/Python/setup
./setup.sh
cd ~/tools/
echo "done"

# echo "installing Sublist3r"
git clone https://github.com/aboul3la/Sublist3r.git
cd ~/tools/Sublist3r/
pip install -r requirements.txt
cd ~/tools/
# echo "done"

git clone https://github.com/kufan/sublert.git

# echo "installing s3brute"
git clone https://github.com/ghostlulzhacks/s3brute.git
# echo "done"

# echo "installing Cert.sh"
git clone https://github.com/ghostlulzhacks/CertificateTransparencyLogs.git
# echo "done"


# echo "installing Crawler"
git clone https://github.com/ghostlulzhacks/crawler.git
# echo "done"

# echo "installing commoncrawl"
git clone https://github.com/ghostlulzhacks/commoncrawl.git
# echo "done"

# echo "installing waybackMachine"
git clone https://github.com/ghostlulzhacks/waybackMachine.git
# echo "done"

# echo "installing dirsearch"
git clone https://github.com/maurosoria/dirsearch.git
# echo "done"


# echo "installing massdns"
git clone https://github.com/blechschmidt/massdns.git
cd ~/tools/massdns
make
cd ~/tools/
# echo "done"


# echo "installing knock.py"
git clone https://github.com/guelfoweb/knock.git
cd ~/tools/
# echo "done"

# echo "installing httprobe"
go get -u github.com/tomnomnom/httprobe
# echo "done"

# echo "installing unfurl"
go get -u github.com/tomnomnom/unfurl
# echo "done"

# echo "installing waybackurls"
go get github.com/tomnomnom/waybackurls
# echo "done"

# echo "installing subjack"
go get github.com/haccer/subjack
# echo "done"

# echo "installing Assetfinder"
go get -u github.com/tomnomnom/assetfinder
# echo "done"

# echo "installing Gau"
go get -u github.com/lc/gau
# echo "done"

# echo "installing ffuf"
go get github.com/ffuf/ffuf
# echo "done"

# echo "installing ffufplus"
git clone https://github.com/dark-warlord14/ffufplus.git
# echo "done"

# echo "installing subfinder"
go get -v github.com/projectdiscovery/subfinder/cmd/subfinder
# echo "done"

# echo "installing hakrawler"
go get github.com/hakluke/hakrawler
# echo "done"

# echo "installing httpx"
GO111MODULE=auto go get -u -v github.com/projectdiscovery/httpx/cmd/httpx
# echo "done"

# echo "installing httpx"
GO111MODULE=on go get -u -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
# echo "done"

# echo "installing httpx"
GO111MODULE=on go get -u -v github.com/projectdiscovery/dnsprobe
# echo "done"









