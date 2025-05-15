# Back Up Server

Steps to back up the Minecraft server in the Oracle Cloud server (and optionally locally)

## Back Up Minecraft Server in the Oracle Cloud Server

### Prerequisites

Complete all the steps in the [Create Server](../create-server.md#create-server) file

### Steps

1. Download the `backup_minecraft.sh` file that's in this folder

2. Copy the `backup_minecraft.sh` file from your local machine to the Oracle Cloud server:
    ```
    scp -i "~/.ssh/<PRIVATE_SSH_KEY_NAME>" "<START_SCRIPT>" "opc@<PUBLIC_IP_ADDRESS>:/home/opc"
    ```
    - *PRIVATE_SSH_KEY_NAME*: name of the private SSH key used to make the Oracle Cloud server
    - *START_SCRIPT*: path to the `backup_minecraft.sh` file on your local machine
    - *PUBLIC_IP_ADDRESS*: public IP address of the Oracle Cloud server

3. Connect to the Oracle Cloud server:
    ```
    ssh -i ~/.ssh/<PRIVATE_SSH_KEY_NAME> opc@<PUBLIC_IP_ADDRESS>
    ```
    - *PRIVATE_SSH_KEY_NAME*: name of the private SSH key used to make the Oracle Cloud server

    - *PUBLIC_IP_ADDRESS*: public IP address of the Oracle Cloud server

4. Update the permissions of the `backup_minecraft.sh` script in the Oracle Cloud server:
    ```
    sudo chmod +x /home/opc/backup_minecraft.sh
    ```

5. Open the cron editor:
    ```
    crontab -e
    ```

6. Type *i* to edit the file

7. Paste the following into the file:
    ```
    0 2 * * * /home/opc/backup_minecraft.sh
    ```

8. Type *ESC* to stop editing the file

9. Type *:wq* to save and close the file

10. List all cron jobs to check for the new entry:
    ```
    crontab -l
    ```

## Back Up Minecraft Server Locally (Optional)

1. Complete all the steps in the [Back Up Minecraft Server in the Oracle Cloud Server](#back-up-minecraft-server-in-the-oracle-cloud-server) section

2. Download the `start_backup.sh` file that's in this folder

3. Create a `Backups` folder somewhere on your local machine where you want to save your Minecraft backups

4. Replace the following variables in the `start_backup.sh` file on your local machine:
    - *PUBLIC_IP_ADDRESS*: public IP address of the Oracle Cloud server
    - *PRIVATE_SSH_KEY_NAME*: name of the private SSH key used to make the Oracle Cloud server
    - *BACKUPS_FOLDER*: path to the `Backups` folder on your local machine

5. Create a Windows scheduled task to back up the Minecraft server from the Oracle Cloud server to your local machine daily:
    ```
    schtasks /create /tn "BackupMinecraft" /tr "<BASH_PATH> -c <BACKUP_SCRIPT>" /sc daily /st <BACKUP_TIME>
    ```
    - *BASH_PATH*: path to the `bash.exe` command on your local machine
    - *BACKUP_SCRIPT*: path to the `start_backup.sh` file on your local machine
    - *BACKUP_TIME*: time in 24-hour *HH:MM* format to back up the Minecraft server to your local machine daily
