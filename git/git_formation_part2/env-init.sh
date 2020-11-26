ssh host01;
docker pull freez13/amazonlinux:git;
docker run -dt --name git_host -v /root:/work_dir/ freez13/amazonlinux:git /bin/bash;
docker exec git_host bash -c "chmod 750 /work_dir/";
clear;
launch_container() {

  if [ $# -eq 0 ]
  then
    echo "Must provide a host name"
    exit 1
  fi
  docker exec -it $1 bash -c "cd /work_dir; echo 'PS1='\''\\e[1;32m$1$\\e[0m '\' >> /root/.bashrc; bash";
}

launch_container "git_host";
clear;
