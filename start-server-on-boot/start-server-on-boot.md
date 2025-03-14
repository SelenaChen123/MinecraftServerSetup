# Start Server on Boot
Steps to automatically start the Minecraft server when the Oracle Cloud server boots

### Prerequisites

Complete all the steps in the [Create Server](../create-server.md#create-server)  file

### Steps

1. Download the `start_minecraft.sh` and `minecraft.service` files that are in this folder

2. Copy the `start_minecraft.sh` file from your local machine to the Oracle Cloud server:
    ```
    scp -i "~/.ssh/<PRIVATE_SSH_KEY_NAME>" "<START_SCRIPT>" "opc@<PUBLIC_IP_ADDRESS>:/home/opc"
    ```
    - *PRIVATE_SSH_KEY_NAME*: name of the private SSH key used to make the Oracle Cloud server
    - *START_SCRIPT*: path to the `start_minecraft.sh` file on your local machine
    - *PUBLIC_IP_ADDRESS*: public IP address of the Oracle Cloud server

3. Copy the `minecraft.service` file from your local machine to the Oracle Cloud server:
    ```
    scp -i "~/.ssh/<PRIVATE_SSH_KEY_NAME>" "<SERVICE_FILE>" "opc@<PUBLIC_IP_ADDRESS>:/home/opc"
    ```
    - *PRIVATE_SSH_KEY_NAME*: name of the private SSH key used to make the Oracle Cloud server
    - *SERVICE_FILE*: path to the `minecraft.service` file on your local machine
    - *PUBLIC_IP_ADDRESS*: public IP address of the Oracle Cloud server

4. Connect to the Oracle Cloud server:
    ```
    ssh -i ~/.ssh/<PRIVATE_SSH_KEY_NAME> opc@<PUBLIC_IP_ADDRESS>
    ```
    - *PRIVATE_SSH_KEY_NAME*: name of the private SSH key used to make the Oracle Cloud server

    - *PUBLIC_IP_ADDRESS*: public IP address of the Oracle Cloud server

5. Update the permissions of the `start_minecraft.sh` script in the Oracle Cloud server:
    ```
    sudo chmod +x /home/opc/start_minecraft.sh
    ```

6. Reload the system:
    ```
    sudo systemctl daemon-reload
    ```

7. Enable the `minecraft.service` service:
    ```
    sudo systemctl enable minecraft.service
    ```

8. Start the `minecraft.service` service:
    ```
    sudo systemctl start minecraft.service
    ```

9. Check the status of the `minecraft.service` service:
    ```
    sudo systemctl status minecraft.service
    ```
