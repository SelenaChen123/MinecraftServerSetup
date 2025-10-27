# Restore Server Backup

Steps to restore a server backup

### Prerequisites

1. Complete all the steps in the [Back Up Server](../back-up-server/back-up-server.md#back-up-server) file

2. Have a backup already saved from following the steps in the [Back Up Server](../back-up-server/back-up-server.md#back-up-server) file

### Steps

1. Move to the service folder:
    ```
    cd /etc/systemd/system
    ```

2. Stop the `minecraft.service` service:
    ```
    sudo systemctl stop minecraft.service
    ```

3. View the list of server backups:
    ```
    ls /home/opc/minecraft_backups
    ```

4. Copy the name of the server backup that you want to restore to.

5. Create a copy of the server backup that you want to restore to in your home folder:
    ```
    cp /home/opc/minecraft_backups/<SERVER_BACKUP> .
    ```
    - *SERVER_BACKUP*: copied name of the server backup that you want to restore to

6. Delete the server files:
    ```
    rm -r ~/world
    ```

7. Move to the root folder:
    ```
    cd /
    ```

7. Unpack the server backup:
    ```
    tar -zxvf ~/<SERVER_BACKUP>
    ```
    - *SERVER_BACKUP*: copied name of the server backup that you want to restore to

8. Move to the service folder:
    ```
    cd /etc/systemd/system
    ```

9. Start the `minecraft.service` service:
    ```
    sudo systemctl start minecraft.service
    ```

10. Check the status of the `minecraft.service` service:
    ```
    sudo systemctl status minecraft.service
    ```
