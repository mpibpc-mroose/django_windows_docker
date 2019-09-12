Project template for running a Django application on Windows with Docker
===
I had a case, where I wanted to use native PowerShell commands in a Django application. 
I was able to run it with a hand grown setup using Apache / IIS, but it  was painful to setup and 
maintain.

As I had some experience with Docker and Docker is now well supported on Windows, I gave it a try.

As it was painful, too to get all the small pieces together I decided to store all this information into this project 
template. Maybe it could help somebody else.  

Important things
--
- I built the whole think on a Windows Enterprise 1809 LTSC. Ff you built on another platform you may 
have to change the base image used for Nginx. 
- If running in production you have to think about various things as performance and security by yourself, when 
adapting this template

Contributions
--
... are of course welcome!

License
--
GNU GPLv3