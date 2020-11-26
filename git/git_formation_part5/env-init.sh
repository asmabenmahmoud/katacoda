ssh host01;
docker network create mynetwork;
docker pull testgitessai/ubuntu:18.04;
docker run -dt -p 0.0.0.0:2256:22 --name dev1_git_local  --network mynetwork -v /root:/work_dir/training-files testgitessai/ubuntu:18.04 /bin/bash;

