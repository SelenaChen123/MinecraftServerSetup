# Allow Commands

Steps to allow commands/cheats

### Prerequisites

1. Complete all the steps in the [Create Server](../create-server.md#create-server) file

2. Complete all the steps in the [Start Server on Boot](../start-server-on-boot/start-server-on-boot.md#start-server-on-boot) file

3. Create your user in the Minecraft server

### Steps

1. Connect to the Oracle Cloud server:
    ```
    ssh -i ~/.ssh/<PRIVATE_SSH_KEY_NAME> opc@<PUBLIC_IP_ADDRESS>
    ```
    - *PRIVATE_SSH_KEY_NAME*: name of the private SSH key used to make the Oracle Cloud server

    - *PUBLIC_IP_ADDRESS*: public IP address of the Oracle Cloud server

2. Install gcc, gcc-c++, and make:
    ```
    sudo yum install gcc gcc-c++ make
    ```

3. Hover your cursor over and copy the link to the latest Mono `.tar` file from: https://download.mono-project.com/sources/mono/index.html

4. Download the latest Mono `.tar` file into the Oracle Cloud server:
    ```
    wget <MONO_TAR>
    ```
    - *MONO_TAR*: copied link to the latest Mono `.tar` file

5. Unpack the Mono `.tar` file:
    ```
    tar -czvf <MONO_TAR_NAME>
    ```
    - *MONO_TAR_NAME*: name of the Mono `.tar` file that was downloaded

6. Move into the folder that was unpacked from the Mono `.tar` file:
    ```
    cd <MONO_FOLDER>
    ```
    - *MONO_FOLDER*: name of the folder that was unpacked from the Mono `.tar` file

7. Configure Mono:
    ```
    ./configure --prefix=/usr/local
    ```

8. Build Mono:
    ```
    make
    ```

9. Install Mono:
    ```
    sudo make install
    ```

10. Check the Mono version:
    ```
    mono --version
    ```

11. Hover your cursor over and copy the link to the latest NBTExplorer `.tar` file from: https://github.com/jaquadro/NBTExplorer/releases

12. Move to the home folder:
    ```
    cd ~
    ```

13. Copy your 

13. Download the latest NBTExplorer `.tar` file into the Oracle Cloud server:
    ```
    wget <NBTEXPLORER_TAR>
    ```
    - *NBTEXPLORER_TAR*: copied link to the latest NBTExplorer `.tar` file

14. Unpack the NBTExplorer `.tar` file:
    ```
    tar -czvf <NBTEXPLORER_TAR_NAME>
    ```
    - *NBTEXPLORER_TAR_NAME*: name of the NBTExplorer `.tar` file that was downloaded

15. Build NBTUtil:
    ```
    xbuild <NBTEXPLORER_FOLDER>/NBTUtil/NBTUtil.csproj
    ```
    - *NBTEXPLORER_FOLDER*: name of the folder that was unpacked from the NBTExplorer `.tar` file

16. Check the Minecraft level data:
    ```
    mono <NBTEXPLORER_FOLDER>/NBTUtil/NBTUtil.exe --path world/level.dat --printtree
    - *NBTEXPLORER_FOLDER*: name of the folder that was unpacked from the NBTExplorer `.tar` file
    ```

17. Stop the `minecraft.service` service:
    ```
    sudo systemctl start /etc/systemd/system/minecraft.service
    ```

18. Check the status of the `minecraft.service` service:
    ```
    sudo systemctl status /etc/systemd/system/minecraft.service
    ```

19. Find the process ID of the running Minecraft server:
    ```
    ps -A | grep java
    ```

20. Copy the number at the very start of the output of step 19

21. Stop the Minecraft server:
    ```
    kill <pid>
    ```
    - *pid*: copied process ID number of the running Minecraft server

22. Check the status of the `minecraft.service` service:
    ```
    sudo systemctl status /etc/systemd/system/minecraft.service
    ```

23. Open the `ops.json` file:
    ```
    vi ops.json
    ```

24. Type `i`

25. Paste the following:
    ```
    [
        {
            "uuid": "<uuid>",
            "name": "<username>",
            "level": 4,
            "bypassesPlayerLimit": false
        }
    ]
    ```

26. Press the `Esc` key on your keyboard

27. Type `:wq`

28. Press the `Enter` key on your keyboard

29. Open the `usercache.json` file:
    ```
    cat usercache.json
    ```

30. Find your username next to one of the `name` fields in the `usercache.json` file and copy the `uuid` value next to your username

31. Open the `ops.json` file again:
    ```
    vi ops.json
    ```

32. Type `i`

33. Replace `<uuid>` in the `ops.json` file with the copied uuid from the `usercache.json` file

34. Replace `<username>` in the `ops.json` file with your username

35. Press the `Esc` key on your keyboard

36. Type `:wq`

37. Start the `minecraft.service` service:
    ```
    sudo systemctl start /etc/systemd/system/minecraft.service
    ```

38. Check the status of the `minecraft.service` service:
    ```
    sudo systemctl status /etc/systemd/system/minecraft.service
    ```
