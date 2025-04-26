# Delete Player Data

Steps to delete player data

### Prerequisites

1. Complete all the steps in the [Allow Commands](../allow-commands/allow-commands.md#allow-commands) file

2. Have a player that you want to delete created in the Minecraft server

### Steps

1. Connect to the Oracle Cloud server:
    ```
    ssh -i ~/.ssh/<PRIVATE_SSH_KEY_NAME> opc@<PUBLIC_IP_ADDRESS>
    ```
    - *PRIVATE_SSH_KEY_NAME*: name of the private SSH key used to make the Oracle Cloud server

    - *PUBLIC_IP_ADDRESS*: public IP address of the Oracle Cloud server

2. Open the `usercache.json` file:
    ```
    cat usercache.json
    ```

3. Find the username of the player that you want to delete next to one of the `name` fields in the `usercache.json` file and copy the `uuid` value next to that username

4. Type `i`

5. Find the `{` character that comes right before the username of the player that you want to delete, find the `}` character that comes right after that, and remove everything from (and including) the `{` character that you found (if a `,` character exists ) to (and including) the `}` character that you found.

6. If there is a `,` character right before or right after what you removed, remove one of those `,` characters

7. Press the `Esc` key on your keyboard

8. Type `:wq`

9. Delete the player's data files:
    ```
    rm world/playerdata/<uuid>.dat; rm world/playerdata/<uuid>.dat_old
    ```
    - *uuid*: the uuid copied from the `usercache.json` file
