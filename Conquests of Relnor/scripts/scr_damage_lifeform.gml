///scr_damage_lifeform(lifeform, source, obj_damage)

if(!instance_exists(argument0)|| !instance_exists(argument1) ||
    !instance_exists(argument2)){
    return false;
}

var _lifeform = argument0;
var _source = argument1;
var _damage = argument2;

if(_lifeform.allegiance == _source.allegiance){
    return false;
}

if( (_lifeform.hitpoints - _damage.amount) <= 0){
    _lifeform.hitpoints = 0;
    _lifeform.state = _lifeform.deathState;
}
else{
    _lifeform.hitpoints -= _damage.amount;
}

scr_lifeform_update_health_bar(_lifeform);

var _dir = point_direction(_source.x,_source.y, 
                        _lifeform.x,_lifeform.y);
var _xForce = lengthdir_x(_damage.knockback, _dir);
var _yForce = lengthdir_y(_damage.knockback, _dir);

with(_lifeform){
    if(target == noone && !isPlayer && isDefensive && !isAggressive){
        _xForce = round(_xForce/2);
        _yForce = round(_yForce/2);
        var _distanceToSource = distance_to_point(_source.x, _source.y);
        if(_distanceToSource < reach){
            image_speed = attackImageSpeed;
            scr_npc_auto_retaliate(_source);
        }
    }
    physics_apply_impulse(x,y, _xForce, _yForce);
}



