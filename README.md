# IntelliJ@k8s
Iam playing around and try to move a IntelliJ-Instance to k8s. What is tricky with this idea? Get the GUI to my PC, but keep intelliJ running inside a k8s.  
  
## Getting GUI
I read a lot about VNC, but this is not what I want. So I decided to use X. But how to get a X-Connection inside from k8s to my local machine? And I found a way: Making my PC accessible via SSH. (Configurated a port-forward from a high random port to my machine).  
With SSH its possible to tunnel the .X11-socket (`/tmp/.X11-unix/X0`) inside a pod. 

# Usage
 1. Prepare connection from k8s-nodes to target-pc.
 2. Generate SSH-keys (`ssh-keygen -t ed25519 -a 100`)
 3. Put SSH-public-key to target-pc (see `ssh-copy-id`)
 4. Create a secret with private key `kubectl create secret generic private-keys --from-file=id_ed25519=id_ed25519`
 5. Replace placeholder inside `k8s.yml` with your values.
 6. Deploy it via `kubectl apply -f k8s.yml`
 7. Intellij should appear on your desk. Have fun.
