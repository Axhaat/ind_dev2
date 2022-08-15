
#to assign different ports of different sites

export FLASK_APP=Chennai.py
flask run --host 127.0.0.1 --port 8000




#Run the following command to install the Apache package on load balancer machine.
yum install httpd -y
systemctl start httpd
systemctl enable httpd
firewall-cmd --permanent --add-service=http
firewall-cmd --reload
#assuming two different servers are running , 127.0.0.1.8000 and 127.0.0.2.8000
#Enter the Apache conf directory, open the httpd.conf file, and add at the end of the file:
cd /etc/httpd/conf.d
vim lb.conf


Header add Set-Cookie "ROUTEID=.%{BALANCER_WORKER_ROUTE}e; path=/" env=BALANCER_ROUTE_CHANGED
ProxyRequests off
< Proxy balancer://help> 
BalancerMember http://127.0.0.1.8000/loadfactor=4
BalancerMember http://127.0.0.2.8000/loadfactor=3.5
BalancerMember http://127.0.0.3.8000/loadfactor=2.5
ProxySet lbmethod=byrequests
< /Proxy> 

< Location /balancer-manager> 
SetHandler balancer-manager
< /Location> 

ProxyPass /balancer-manager !
ProxyPass / balancer://help/




