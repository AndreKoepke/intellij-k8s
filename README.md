# IntelliJ@k8s
Iam playing around and try to move a IntelliJ-Instance to k8s. What is tricky with this idea? Get the GUI to my PC, but keep intelliJ running inside a k8s.  
  
## Getting GUI
I read a lot about VNC, but this is not what I want. So I decided to use X. But how to get a X-Connection inside from k8s to my local machine? And I found a way: Making my PC accessible via SSH. (Configurated a port-forward from a high random port to my machine).  
With SSH its possible to tunnel the .X11-socket (`/tmp/.X11-unix/X0`) inside a pod. 

