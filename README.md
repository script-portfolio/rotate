# rotate
Useful script to organize rotate like simple logrotate


    mkdir F

    ls -ltd F*
       drwxr-xr-x 2 vlad vlad 4096 Apr  5 22:34 F

    bash ./rotate.sh F 

    ls -ltd F*
        drwxr-xr-x 2 vlad vlad 4096 Apr  5 22:34 F.0

    mkdir F
        drwxr-xr-x 2 vlad vlad 4096 Apr  5 22:35 F
        drwxr-xr-x 2 vlad vlad 4096 Apr  5 22:34 F.0

    bash ./rotate.sh F
    LC_ALL=C ls -ltd F*
        drwxr-xr-x 2 vlad vlad 4096 Apr  5 22:35 F.0
        drwxr-xr-x 2 vlad vlad 4096 Apr  5 22:34 F.1

