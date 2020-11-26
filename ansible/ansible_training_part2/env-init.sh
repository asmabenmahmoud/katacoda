 
ssh host01;
docker network create mynetwork;
docker pull 22072017/ubuntu:ansible-installed.16.04;
docker pull 22072017/ubuntu:ansible-cible-installed.16.04;
docker run -dt --name ansible_node  --network mynetwork -v /root:/work_dir/training-files 22072017/ubuntu:ansible-installed.16.04 /bin/bash;
docker run -dt --name managed_node1  --network mynetwork -v /root:/work_dir/training-files 22072017/ubuntu:ansible-cible-installed.16.04 /bin/bash;
docker run -dt --name managed_node2  --network mynetwork -v /root:/work_dir/training-files 22072017/ubuntu:ansible-cible-installed.16.04 /bin/bash;
docker exec ansible_node bash -c "apt-get update && chmod 777 /work_dir/training-files";
docker exec managed_node1 bash -c "apt-get update && chmod 777 /work_dir/training-files";
docker exec managed_node2 bash -c "apt-get update && chmod 777 /work_dir/training-files";
