///getTObject(object)

var obj = argument0

if (obj = obj_worker) {
    if (team == 0)  return obj_worker_team
    else if (team == 1)  return obj_worker_enemy
}

if (obj = obj_coffeeMachine) {
    if (team == 0)  return obj_coffeeMachine_team
    else if (team == 1)  return obj_coffeeMachine_enemy
}

if (obj = obj_cashier) {
    if (team == 0)  return obj_cashier_team
    else if (team == 1)  return obj_cashier_enemy
}

if (obj = obj_variableManager) {
    if (team == 0)  return obj_variableManager_team
    else if (team == 1)  return obj_variableManager_enemy
}

return obj;
