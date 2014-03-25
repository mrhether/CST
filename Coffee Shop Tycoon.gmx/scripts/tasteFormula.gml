///tasteFormula(waterTemp,brewTime,coffeeAmount)
var waterTemp = argument0;
var brewTime = argument1;
var coffeeAmout = argument2;


var ideaTemp = .96
var tempMod = -5* power( (waterTemp/100 - ideaTemp) , 2 ) + 1.00
if (waterTemp > 99){ 
    tempMod -= 0.1 // boiling water is hella bad
}
tempMod = max(0.01,tempMod)
// more coffee less extraction time

var idealBrewTime = 2 * coffeeAmout;
var brewTimeMod = max(0.01,(brewTime - idealBrewTime));

return tempMod * (coffeeAmout/10) * brewTimeMod
