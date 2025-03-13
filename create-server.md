# Create Server
Steps to create a Minecraft server in Oracle Cloud: https://jangro.com/2024/05/31/how-set-up-a-free-vanilla-minecraft-server-in-2024/

## 1. Create an Oracle Cloud Instance

1. Set up an Oracle Cloud free tier account and log in: https://www.oracle.com/cloud/free/

2. Click the *Create a VM instance* section on the home page

3. Give your compute instance a *Name*

4. Select *root* for *Create in compartment*

5. Click the *Change shape* button in the *Image and shape* section

6. Select *Ampere* for the *Shape series*

7. Click the checkbox next to *VM.Standard.A1.Flex* as *Shape name*

8. Enter *4* for the *Number of OCPUs*

9. Click the *Select shape* button

10. Select *Create new virtual cloud network* for the *Primary network* in the *Primar VNIC information* section

11. Click the *Save private key* button in the *Add SSH keys* section

12. Click the *Save public key* button in the *Add SSH keys* section

13. Click the *Create* button at the very end

14. Wait for the instance to get to a *RUNNING* status

15. Click the link to the *Subnet* in the *Primary VNIC* section

16. Click the *Default Security List* in the *Security Lists* section

17. Click the *Add Ingress Rules* button in the *Ingress Rules* section

18. Enter *0.0.0.0/0* for the *Source CIDR*

19. Enter *25565* for the *Destination Port Range*

20. Click the *Add Ingress Rules* button

21. Click the *Add Ingress Rules* button in the *Ingress Rules* section again

22. Enter *0.0.0.0/0* for the *Source CIDR*

23. Select *UDP* for the *IP Protocol*

24. Enter *25565* for the *Destination Port Range*

25. Click the *Add Ingress Rules* button

## 2. Create a Minecraft Server in the Oracle Cloud Server

1. Create a `.ssh` directory:
    ```
    mkdir ~/.ssh
    ```

2. Move the private SSH key to the `.ssh` directory:
    ```
    mv <PRIVATE_SSH_KEY> ~/.ssh
    ```
    - *PRIVATE_SSH_KEY*: path to the private SSH key that was downloaded from step 11 of the [Create an Oracle Cloud Instance](#create-an-oracle-cloud-instance) section

3. Move the public SSH key to the `.ssh` directory:
    ```
    mv <PUBLIC_SSH_KEY> ~/.ssh
    ```
    - *PUBLIC_SSH_KEY*: path to the public SSH key that was downloaded from step 12 of the [Create an Oracle Cloud Instance](#create-an-oracle-cloud-instance) section

4. Connect to the Oracle Cloud server:
    ```
    ssh -i ~/.ssh/<PRIVATE_SSH_KEY_NAME> opc@<PUBLIC_IP_ADDRESS>
    ```
    - *PRIVATE_SSH_KEY_NAME*: name of the private SSH key used to make the Oracle Cloud server
    - *PUBLIC_IP_ADDRESS*: public IP address of the Oracle Cloud server

5. Open the TCP firewall port:
    ```
    sudo firewall-cmd --permanent --zone=public --add-port=25565/tcp
    ```

6. Open the UDP firewall port:
    ```
    sudo firewall-cmd --permanent --zone=public --add-port=25565/udp
    ```

7. Reload the firewall:
    ```
    sudo firewall-cmd --reload
    ```

8. Update the Oracle Cloud server:
    ```
    sudo yum update
    ```

9. List all JDK versions:
    ```
    yum list jdk*
    ```

10. Install the most recent headless version:
    ```
    sudo yum install <HEADLESS_JDK>
    ```
    - *HEADLESS_JDK*: most recent headless JDK version

11. Wait for the JDK to install

12. Check the Java version:
    ```
    java --version
    ```

13. Hover your cursor over and copy the link to the latest Minecraft `.jar` file from: https://www.minecraft.net/en-us/download/server

14. Download the latest Minecraft `.jar` file into the Oracle Cloud server:
    ```
    wget <MINECRAFT_JAR>
    ```
    - *MINECRAFT_JAR*: copied link to the latest Minecraft `.jar` file

15. Run the Minecraft `.jar` file:
    ```
    java -Xmx1024M -Xms1024M -jar server.jar nogui
    ```

16. Wait for the Minecraft `.jar` file run to print:
    ```
    Failed to load eula.txt
    ```

17. Accept the End User License Agreement:
    ```
    sed -i 's/false/true/' eula.txt
    ```

18. Run the Minecraft `.jar` file again:
    ```
    java -Xmx1024M -Xms1024M -jar server.jar nogui
    ```

## 3. Add the Minecraft Server to Minecraft

1. Copy the *Public IPv4 address* value in the *Primary VNIC* section of the Oracle Cloud sever

2. Start the Minecraft Launcher

3. Click the *Installations* tab

4. Click the *New Installation* button

5. Give your installation a *NAME*

6. Select the same version as the Minecraft `.jar` downloaded from step 14 of the [Create a Minecraft Server in the Oracle Cloud Server](#create-a-minecraft-server-in-the-oracle-cloud-server) section for the *VERSION*

7. Wait for the installation to install and launch

8. Click the *Multiplayer* button

9. Click the *Add Server* button

10. Give your server a *Server Name*

11. Paste the IP address as the *Server Address*

12. Click the *Done* button

12. Wait for the server to load

13. Click the sever to start playing