export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

subdomains(){
     cd Recon
     mkdir $1
     cd $1
     echo "Getting the Asn "
     echo "================================================"
     amass intel -org $1 | awk '{sub(/,.*/,"")} NR' | tee -a asn.txt
     echo "Getting the Asn domains "
     echo "================================================"
     for asn in $(cat asn.txt); do amass intel -asn $asn | tee -a  domains.txt; done
     echo "finished Asn"
     echo "================================================" 
     echo "echo Gathering subdomains with Sublist3r ....."
     python ~/tools/Sublist3r/sublist3r.py -d $1 -o sublist3r.txt
     echo "================================================" 
     echo "find domains purchased by same company "
     amass intel -whois -d $i | tee -a  domains.txt
     echo "================================================"
     echo "Gathering subdomains with Assetfinder ....."
     assetfinder --subs-only $1 | tee -a domains.txt
     echo "================================================"
     echo "Gathering subdomains with Subfinder ....."
     subfinder -d $1 | sort -u | tee -a domains.txt
     echo "================================================"
     echo "Gathering subdomains with Amass ....."
     amass enum -passive -d $1 | sort -u | tee -a domains.txt
     echo "================================================"
     echo "find endpoints by crawl the website **$1 domains $2 1 or 2 "
     python3 ~/tools/crawler/crawler.py -d https://$1 -l 1 | tee -a domains.txt
     echo "================================================"
     echo "Extract subdomains from cert.sh"
     python ~/tools/CertificateTransparencyLogs/certsh.py -d $1 | tee -a domains.txt
     echo "================================================"     
     echo "Sort unique domains ....."
     cat sublist3r.txt >> domains.txt
     sort -u domains.txt -o domains.txt
     rm sublist3r.txt
     echo "================================================"
     echo "Compiling third-level domains ....."
     cat domains.txt | grep -Po "(\w+\.\w+\.\w+)$" | sort -u >> third-level.txt
     echo "================================================"
     echo "Find third-level domains ....."
     for domain in $(cat third-level.txt); do amass enum -passive -d $domain >> all-third-level.txt; done
     echo "================================================"
     echo "Sort unique domains ....."
     cat all-third-level.txt domains.txt -o domains.txt
     sort -u domains.txt -o domains.txt
     echo "================================================" 
     echo "find a list of endpoints "
     cat domains.txt | waybackurls | tee -a endpoints.txt
     cat domains.txt | hakrawler   | tee -a endpoints.txt
    }

endpoints(){
           cd ~/Recon/$1
           echo "find a list of endpoints from Commoncrawl.org **$1 domains** "
           python ~/tools/commoncrawl/cc.py -d $1 | tee -a endpoints.txt
           echo "================================================"
           echo "find a list of endpoints from waybackmachine.org **$1 domains** "
           python3 ~/tools/waybackMachine/waybackMachine.py $1 | tee -a endpoints.txt
           echo "================================================"
           echo "Sort unique domains ....."
           
           echo "================================================"
           echo "================================================"
           echo "Fetch known URLs from AlienVault's Open Threat Exchange, the Wayback Machine, and Common Crawl"
           gau $1 | tee -a endpoints.txt
           echo "================================================"
           
           }
 probed(){
 	      cd ~/Recon/$1/
	      cat domains.txt endpoints.txt >>all.txt
           sort -u all.txt -o all.txt
           echo "Gathering live domains with httprobe ....."
           cat all.txt | httprobe -c 50 | tee -a live_all.txt
           echo "take a screen shot for domains in file " 
           python3 ~/tools/EyeWitness/Python/EyeWitness.py -f live_all.txt -d $1 --web
}


 ffufplus(){
           bash ~/tools/ffufplus/script.sh 
           } 

subjack(){ 
          echo "find if you can take over this domain" 
          subjack -w $1 -t 100 -timeout 30 -o $1 -ssl
         }

bucketbrute(){
              cd ~/tools/GCPBucketBrute/
              echo "enumerate Google Storage bucket and find sensetive data"
              python3 ~/tools/GCPBucketBrute/gcpbucketbrute.py -k $1 -u
            }
s3brute(){ 
          echo "enumerate Google Storage bucket and find sensetive data"
          python ~/tools/s3brute/amazon-s3-enum.py -w ~/tools/s3brute/BucketNames.txt -d $1 
         }

jsearch(){
          echo "find sensetive data in Js"
          python3 ~/tools/jsearch/jsearch.py -u https://$1 -n $1

         }                    

wafw00f(){
          echo "find the waf kind "
          python ~/tools/wafw00f/wafw00f/main.py $1      
         }
dirsearch(){
	        python3 ~/tools/dirsearch/dirsearch.py -u $1 -E
          }         
linkfinder(){
	         python3 ~/tools/LinkFinder/linkfinder.py -i $1 -o $1.html
}
