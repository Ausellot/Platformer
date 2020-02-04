/// @description Insert description here
a_text[0] = "ATT";
a_text[1] = "DEF";
a_text[2] = "ITE";
a_text[3] = "RUN";

a_item_text[0] = "HEAL";
a_item_text[1] = "CookieNade";

playerMAX_HP = 20;
playerHP = 20;
playerIP = 3;

monsterHP = 10;
monsterMAX_HP = 10;


selected_option = 0; // shows the arrow hovering over the options
playerTurn = true;

ds_messages = ds_list_create();
messageCounter = 0; // tracks the message
showBattleText = false; // displays battle text or not

messageTimer = 0;
timeBeforeButtonAccepted = 15;

enemytimer = 0;
timeTillEnemyAttacks = 0;
battleOption = 0; // which option selected

playerDead = false;
battle = false;
victory = false;

showItemOptions = false; // show item menu
item_option = 0; // which item to use

battleSpawnTimer = 0;
timeTillBattleSpawns = 0;
state = "INIT";

//screenshake
screenShake = false;
maxShakeX = 5;
maxShakeY = 5;
shakeX = 0;
shakeY = 0;
shakeTimer = 0;
timeTillShakeEnds = 30;