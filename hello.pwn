// PAWN
#include <a_samp>

main()
{
    print("Hello, World!");
}

public OnPlayerConnect(playerid)
{
    new name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, name, sizeof(name));
    printf("Hello, %s!", name);
}
