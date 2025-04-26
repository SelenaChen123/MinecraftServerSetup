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

19. Open the `ops.json` file:
    ```
    vi ops.json
    ```

20. Type `i`

21. Paste the following:
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

22. Press the `Esc` key on your keyboard

23. Type `:wq`

24. Press the `Enter` key on your keyboard

25. Open the `usercache.json` file:
    ```
    cat usercache.json
    ```

26. Find your username next to one of the `name` fields in the `usercache.json` file and copy the `uuid` value next to your username

27. Open the `ops.json` file again:
    ```
    vi ops.json
    ```

28. Type `i`

29. Replace `<uuid>` in the `ops.json` file with the uuid copied from the `usercache.json` file

30. Replace `<username>` in the `ops.json` file with your username

31. Press the `Esc` key on your keyboard

32. Type `:wq`

33. Start the `minecraft.service` service:
    ```
    sudo systemctl start /etc/systemd/system/minecraft.service
    ```

34. Check the status of the `minecraft.service` service:
    ```
    sudo systemctl status /etc/systemd/system/minecraft.service
    ```
